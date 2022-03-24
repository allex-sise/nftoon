import Vue from "vue";
import Vuex from "vuex";
import { ethers } from "ethers";
import getContractAbiById from "./contractMappers"
import axios from 'axios'

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    signer: null,
    account: null,
    error: null,
  },
  getters: {
    signer: (state) => state.signer,
    account: (state) => state.account,
    error: (state) => state.error,
  },
  mutations: {
    setSigner(state, signer) {
      state.signer = signer;
    },
    setAccount(state, account) {
      state.account = account;
    },
    setError(state, error) {
      state.error = error;
    },
  },
  actions: {
    async connect({ commit, dispatch }) {
      try {
        const { ethereum } = window;
        if (!ethereum) {
          commit("setError", "Metamask not installed!");
          return;
        }

        let isConnected = ethereum.isConnected();
        if(!isConnected){
          commit("setError", "Account not connected!");
        }

        await dispatch("storeAccount");

        await dispatch("checkNetwork");
      } 
      catch (error) {
        console.log(error);
        commit("setError", "Account request refused.");
      }
    },
    async storeAccount({ commit }) {
      const accounts = await ethereum.request({ method: "eth_accounts" });
      if (accounts.length !== 0) {
        commit("setAccount", accounts[0]);
        return 1;
      } else {
        commit("setError", "Ensure you're LOGGED-in to Metamasknot and CONNECTED!");
        return 0;
      }
    },
    async checkNetwork({ commit, dispatch }) {
      let chainId = await ethereum.request({ method: "eth_chainId" });
      if (chainId !== process.env.MIX_PUSHER_CHAIN_ID) {
        if (!(await dispatch("switchNetwork"))) {
          commit(
            "setError",
            "You are not connected to the Polygon Test Network!"
          );
        }
      }
    },
    async switchNetwork() {
      try {
        await ethereum.request({
          method: "wallet_switchEthereumChain",
          params: [{ chainId: process.env.MIX_PUSHER_CHAIN_ID }],
        });
        return 1;
      } catch (switchError) {
        return 0;
      }
    },
    async getMetamaskSignature({commit, dispatch}){
      const walletSigner = await dispatch("getSignerUsingMetamask");
      commit("setSigner", walletSigner);
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

    async toonMintNftMultiple({state, dispatch}, payload){
        try {
            console.log('payload:',payload);
            // let walletSigner = state.signer;
            // if(walletSigner == null){
            //   walletSigner = await dispatch("getSignerUsingMetamask");
            // }
            const mnemonic = process.env.MIX_PUSHER_MNEMONIC;
            let walletSigner = await dispatch("getSignerUsingMnemonic", mnemonic);
            
            const constractAbi = getContractAbiById(payload.contractAddress);

            const payloadContract = {
              signer: walletSigner,
              contractAddress: payload.contractAddress,
              contractAbi: constractAbi,
            }
            const connectedContract = await dispatch("createContract", payloadContract);

            console.log('MINT', payloadContract);
            //todo: salveaza in DB tx hash
            const mintTxn = await connectedContract["mint()"]();
            
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
    async getMetadata({dispatch}, payload){
      try {
        const constractAbi = getContractAbiById(payload.contractAddress);
        //todo: wallet shoud not be used
        const provider = await dispatch("getProviderUsingMetamask");

        const payloadContract = {
          signer: provider,
          contractAddress: payload.contractAddress,
          contractAbi: constractAbi,
        }
        const connectedContract = await dispatch("createContract", payloadContract);

        const metadata = await connectedContract.tokenURI(payload.tokenId);
        return metadata;
      } catch (error) {
        console.log(error);
        return null;
      }
    },
    async getTokenIdFromTxHash({dispatch}, transactionHash){
      try {
        const provider = await dispatch("getProviderUsingMetamask");
        const txReceipt = await provider.getTransactionReceipt(transactionHash);

        if(txReceipt.status === 1){
          const tokenId = parseInt(Number(txReceipt.logs[0].topics[3]));
          return tokenId;
        }
        return null;
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
    
    async setThemeColor({dispatch}, payload){
      await dispatch("storeInDb", payload);
    },
    async storeInDb({dispatch}, payload){
      console.log('store in DB', payload);
      axios.post(payload.route, payload);
    },
    
  getSignerUsingMetamask(){
    const { ethereum } = window;
    const provider = new ethers.providers.Web3Provider(ethereum);
    const signer = provider.getSigner();
    return signer;
  },
  getProviderUsingMetamask(){
    const { ethereum } = window;
    const provider = new ethers.providers.Web3Provider(ethereum);
    return provider;
  },
  getSignerUsingMnemonic({dispatch}, mnemonic){
      const alchemyKey = process.env.MIX_PUSHER_ALCHEMY_SECRET_ALCHEMY_MUMBAY_API_KEY;
      const provider = new ethers.providers.AlchemyProvider('maticmum',alchemyKey);

      const walletMnemonic = ethers.Wallet.fromMnemonic(mnemonic);
      const wallet = walletMnemonic.connect(provider);
      //wallet can be used as signer in connectedContract
      return wallet;
  },
},
});