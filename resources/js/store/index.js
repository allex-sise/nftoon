import Vue from "vue";
import Vuex from "vuex";
import { ethers } from "ethers";
import contract from "../assets/contracts/MintedNFT721.json"
import contractRegele from "../assets/contracts/NftoonRegeleV3.json"
import axios from 'axios'

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    account: null,
    error: null,
    secrets: null,
    contractAddress: null,
    token:{
      name:null,
      //itemIdkey= DB the key of an item
      itemIdkey: null,
      //blockchain NFT id
      itemTokenid: null,
      itemMetadataUrl: null,
      description: null,
      externalUrl: null,
      nftImageUrl: null,
      etherscan: null,
    },
    blockchain: null,
    mintRoute:null,
  },
  getters: {
    account: (state) => state.account,
    error: (state) => state.error,
    secrets: (state) => state.secrets,
    contractAddress: (state) => state.contractAddress,
    token: (state) => state.token,
    mintRoute: (state) => state.mintRoute,
    blockchain: (state) => state.blockchain,
  },
  mutations: {
    setAccount(state, account) {
      state.account = account;
    },
    setError(state, error) {
      state.error = error;
    },
    setSecrets(state, secrets){
      state.secrets = secrets;
    },
    setContract(state, contractAddress){
      state.contractAddress = contractAddress;
    },
    setTokenData(state, token){
      state.token = token;
    },
    setMintRoute(state, route){
      state.mintRoute = route;
    },
    setBlockchain(state){
      const { ethereum } = window;
      const provider = new ethers.providers.Web3Provider(ethereum);
      const signer = provider.getSigner();
      const blockchain = {
        provider:provider,
        signer: signer,
      }
      state.blockchain = blockchain;
    }
  },
  actions: {
    loadSecrets({commit, state}){
      if (state.secrets === null){
        const secrets = {
          pinata_api_key:process.env.MIX_PUSHER_PINATA_API_KEY,
          pinata_secret_api_key:process.env.MIX_PUSHER_PINATA_SECRET_API_KEY,
          alchemy_api_key: process.env.MIX_PUSHER_ALCHEMY_SECRET_API_KEY,
          mnemonic: process.env.MIX_PUSHER_MNEMONIC,
        };
        commit("setSecrets", secrets);
      }
      
      if(state.contractAddress === null){
        const contractAddress = process.env.MIX_PUSHER_ALCHEMY_CONTRACT;
        commit("setContract", contractAddress);
      }
    },
    loadContract({commit}){
      const contractAddress = process.env.MIX_PUSHER_ALCHEMY_CONTRACT;
      commit("setContract", contractAddress);
    },
    storeTokenData({commit}, tokenData){
      commit("setTokenData", tokenData);
    },
    async connect({ commit, dispatch }, connect) {
      try {
        await dispatch("requestAccess");
        await dispatch("loadSecrets");
        const { ethereum } = window;
        if (!ethereum) {
          commit("setError", "Metamask not installed!");
          return;
        }
        if (!(await dispatch("checkIfConnected")) && connect) {
          await dispatch("requestAccess");
        }
        await dispatch("checkNetwork");
        commit("setBlockchain");
        await dispatch("setupEventListeners");
      } catch (error) {
        console.log(error);
        commit("setError", "Account request refused.");
      }
    },
    async checkNetwork({ commit, dispatch }) {
      let chainId = await ethereum.request({ method: "eth_chainId" });
      const polygonChainId = "0x13881";
      if (chainId !== polygonChainId) {
        if (!(await dispatch("switchNetwork"))) {
          commit(
            "setError",
            "You are not connected to the Polygon Test Network!"
          );
          return 0;
        }
      }
      return 1;
    },
    async switchNetwork({ commit }) {
      try {
        const polygonChainId = "0x13881";
        await ethereum.request({
          method: "wallet_switchEthereumChain",
          params: [{ chainId: polygonChainId }],
        });
        return 1;
      } catch (switchError) {
        return 0;
      }
    },
    async checkIfConnected({ commit }) {
      let isConnected = ethereum.isConnected();
      if(!isConnected){
        commit("setError", "Account not connected!");
      }

      const accounts = await ethereum.request({ method: "eth_accounts" });
      if (accounts.length !== 0) {
        commit("setAccount", accounts[0]);
        return 1;
      } else {
        commit("setError", "Ensure you're LOGGED-in to Metamasknot and CONNECTED!");
        return 0;
      }
    },
    async requestAccess({ commit }) {
      try{
        // const { ethereum } = window;
        const accounts = await ethereum.request({
          method: "eth_requestAccounts",
        });
        commit("setAccount", accounts[0]);
      }
      catch (error){
        if (err.code === 4001){
          commit("setError", "Please connect to MetaMask!");
        }
      }
    },
    async getContract({ state }) {
      try {
        const connectedContract = new ethers.Contract(
          state.contractAddress,
          contract.abi,
          state.blockchain.signer
        );
        return connectedContract;
      } catch (error) {
        console.log(error);
        console.log("connected contract not found");
        return null;
      }
    },
    async createContract({dispatch}, payload) {
      try {
          const connectedContract = new ethers.Contract(
            payload.contractAddress,
            payload.contractAbi,
            payload.signer
          );
          return connectedContract;
      } catch (error) {
          console.log(error);
          console.log("connected contract not found");
          return null;
      }
    },
    async setupEventListeners({ state, commit, dispatch }) {
      try {
        const connectedContract = await dispatch("getContract");

        if (!connectedContract) return;

        connectedContract.on(
          "Minted",
          async (from, tokenId, indexedTokenIPFSPath, tokenIPFSPath) => {
            state.token.itemTokenid = tokenId.toNumber();
            state.token.itemMetadataUrl = 'https://dweb.link/ipfs/' + tokenIPFSPath;
            await dispatch("saveMintToDB");
            window.location.reload();
          }
        );

        ethereum.on('chainChanged', () => {
          window.location.reload();
        });

        ethereum.on('accountsChanged', async () => {
          const accounts = await ethereum.request({ method: "eth_accounts" });
          if (accounts.length === 0) {
            commit("setError", "MetaMask is locked or none account connected!");
          } else if (accounts[0] !== state.account) {
            commit("setError", "");
            commit("setAccount", accounts[0]);
          }
        });

        ethereum.on('disconnect', () => {
          commit("setError", "Connection to Chain Disconnected");
        });
      } catch (error) {
        console.log(error);
      }
    },
    async mintNFT({ state,dispatch }, payload) {
      state.token.nftImageUrl = 'https://dweb.link/ipfs/' + payload.ipfsImageHash;
      try {
        const connectedContract = await dispatch("getContract");
        const mintTxn = await connectedContract["mint(string)"](payload.ipfsMetadataUrl);
        await mintTxn.wait();
        return mintTxn;
      } catch (error) {
        console.log(error);
        return null;
      }
    },
    //pot sa folosesc contractul pentru plata dar este mai scump
    async payUserV2({ dispatch },receiverUserAddress){
      try {
        const connectedContract = await dispatch("getContract");
        const transferTxn = await connectedContract.transferToWallet(receiverUserAddress,{value: ethers.utils.parseEther('0.00001')});
        await transferTxn.wait();
        return transferTxn;
      } catch (error) {
        console.log(error);
        return null;
      }
    },
    async transferToken({ commit, dispatch },payload){
      try {
        const payloadTransferToken={
          receiverUserAddress: payload.receiverUserAddress,
          tokenId: payload.tokenId,
        };

        const connectedContract = await dispatch("getContract");
        const transferTxn = await connectedContract.transferToken(payloadTransferToken.receiverUserAddress, payloadTransferToken.tokenId);
        await transferTxn.wait();
        return transferTxn;
      } catch (error) {
        commit("setError", error.message);
        return null;
      }
    },
    async toonMintNftMultiple({dispatch}, payload){
        try {
            console.log('payload:',payload);
            const mnemonic = process.env.MIX_PUSHER_MNEMONIC;
            const wallet = await dispatch("getSignerUsingMnemonic", mnemonic);

            const payloadContract = {
              signer: wallet,
              contractAddress: payload.contractAddress,
              contractAbi: contractRegele.abi,
            }
            const connectedContract = await dispatch("createContract", payloadContract);

            console.log('MINT', payloadContract);
            //todo: salveaza in DB tx hash
            const mintTxn = await connectedContract["mint(string)"](payload.ipfsPath);
            
            console.log('mintTxn', mintTxn);
            // await mintTxn.wait();

            const payloadTxHash = {
                route: payload.route,
                itemIdkey: payload.itemIdkey,
                transactionHash: mintTxn.hash
            }
            await dispatch("storeInDb", payloadTxHash);
        } catch (error) {
        console.log(error);
        return null;
      }
    },
    async getMetadata({dispatch}, tokenId){
      try {
        const connectedContract = await dispatch("getContract");
        const metadata = await connectedContract.tokenURI(tokenId);
        return metadata;
      } catch (error) {
        console.log(error);
        return null;
      }
    },
    async getNextTokenId({dispatch}){
      try {
        const connectedContract = await dispatch("getContract");
        const tokenId = await connectedContract.getNextTokenId();
        tokenId = tokenId.toNumber();        
        return tokenId;
      } catch (error) {
        console.log(error);
        return null;
      }
    },
    async saveMintToDB({state}){
        if(state.token !== null){
            state.token.etherscan = 'https://mumbai.polygonscan.com/token/' + state.contractAddress + '?a=' + state.token.itemTokenid

            axios.post(state.mintRoute,state.token).then(res => {
            if(res.data.status === 'ok'){
                // toastr.success(res.data.message);
            }else{
                // toastr.error(res.data.message);
            }
            }).catch(error=>{
                // toastr.error(error.response.data.errors);
        });
        }
    },
    async setMintRoute({commit},mintRoute){
      commit("setMintRoute", mintRoute);
    },
    async payUser({ state, dispatch, commit }, payload) {
      try {
        const payloadPaymentAuthor={
          route: payload.routePaymentAuthor,
          user_id: payload.payoutUserId,
          amount: payload.withdrawAmount,
          amountETH: payload.withdrawAmountEth,
          withdraw_id: payload.withdraw_id,
        };
        await dispatch("storeInDb", payloadPaymentAuthor);
        
        // alert('Do not close/refresh the window!');
        const signer = state.blockchain.signer;
        const transferTxn = await signer.sendTransaction({
          to: payload.requestorWalletAddress,
          value: ethers.utils.parseEther(payload.withdrawAmountEth)
        });

        const payloadTransactionHash={
          route: payload.routeTransactionHash,
          withdraw_id: payload.withdraw_id,
          transaction_hash: transferTxn.hash,
        };
        await dispatch("storeInDb", payloadTransactionHash);

        await transferTxn.wait();
        let txReceipt = await dispatch("isTransactionMined", transferTxn.hash);

        const payloadBlockchainStatus={
          route: payload.routeBlockchainStatus,
          withdraw_id: payload.withdraw_id,
          blockchain_status: txReceipt.status,
        };
        await dispatch("storeInDb", payloadBlockchainStatus);
        
        // window.location.reload();
      } catch (error) {
        console.log("catch reject", error);

        const onErrorPayload = {
          route: payload.routeBlockchainStatus,
          withdraw_id: payload.withdraw_id,
          blockchain_status: 69
        };

        if(error.code === 4001){
          onErrorPayload.blockchain_status = 2;
        }
        else{
          txReceipt = await dispatch("isTransactionMined", transferTxn.hash);
          if(txReceipt){
            onErrorPayload.blockchain_status = txReceipt.status;
          }
        }
        
        await dispatch("storeInDb", onErrorPayload);
      }
    },
    async userDepositFunds({ state, dispatch, commit }, payload) {
      // commit("setError", "Do NOT CLOSE this page!");
      try {
        const payloadBankDeposit={
          route: payload.routeBlockchainDeposit,
          bank_name: 'blockchain',
          owner_name: payload.ownerName,
          account_number: payload.userWallet,
          amount: payload.withdrawAmount,
          amountEth: payload.withdrawAmountEth,
          status: 0,
        };
        await dispatch("storeInDb", payloadBankDeposit);
        
        // alert('Do not close/refresh the window!');
        const signer = state.blockchain.signer;
        const transferTxn = await signer.sendTransaction({
          to: payload.mintedWallet,
          value: ethers.utils.parseEther(payload.withdrawAmountEth)
        });
        
        await transferTxn.wait();
        let txReceipt = await dispatch("isTransactionMined", transferTxn.hash);

        if(txReceipt.status === 1){
          console.log("INTRAT OK");
          const payloadBlockchainStorePayment = {
            route: payload.routeBlockchainStorePayment,
          }
          await dispatch("storeInDb", payloadBlockchainStorePayment);
        }
      } catch (error) {
        console.log("catch reject", error);

        // const onErrorPayload = {
        //   route: payload.routeBlockchainStatus,
        //   withdraw_id: payload.withdraw_id,
        //   blockchain_status: 69
        // };

        // if(error.code === 4001){
        //   onErrorPayload.blockchain_status = 2;
        // }
        // else{
        //   txReceipt = await dispatch("isTransactionMined", transferTxn.hash);
        //   if(txReceipt){
        //     onErrorPayload.blockchain_status = txReceipt.status;
        //   }
        // }
        
        // await dispatch("storeInDb", onErrorPayload);
      }
    },
    async setThemeColor({dispatch}, payload){
      await dispatch("storeInDb", payload);
    },
    async storeInDb({dispatch}, payload){
      console.log('store in DB', payload);
      axios.post(payload.route, payload);
    },
    async isTransactionMined({state},transactionHash){
      const provider = state.blockchain.provider;
      const txReceipt = await provider.getTransactionReceipt(transactionHash);
      if (txReceipt && txReceipt.blockNumber) {
          if(txReceipt.status === 0 ){
            console.log("FAILED");
          }
          if(txReceipt.status === 1 ){
            console.log("SUCCESS");
          }
          return txReceipt;
      }
      else {
        console.log("Transaction not available on the blockchain!");
      }
    },
  getSignerUsingMetamask(){
    const { ethereum } = window;
    const provider = new ethers.providers.Web3Provider(ethereum);
    const signer = provider.getSigner();
    return signer;
},
getSignerUsingMnemonic({dispatch}, mnemonic){
    // V0
    // const { ethereum } = window;
    // console.log('ethereum: ',ethereum);
    // const provider = new ethers.providers.Web3Provider(ethereum);

    // V1
    // const alchemyKey = process.env.MIX_PUSHER_ALCHEMY_SECRET_ALCHEMY_MUMBAY_API_KEY;
    // const web3 = createAlchemyWeb3(alchemyKey); 
    // const provider = web3.Web3Provider;

    // V2
    const alchemyKey = process.env.MIX_PUSHER_ALCHEMY_SECRET_ALCHEMY_MUMBAY_API_KEY;
    const provider = new ethers.providers.AlchemyProvider('maticmum',alchemyKey);

    const walletMnemonic = ethers.Wallet.fromMnemonic(mnemonic);
    const wallet = walletMnemonic.connect(provider);
    //wallet can be used as signer in connectedContract
    return wallet;
},
    //todo: add disable event listener
  },
});