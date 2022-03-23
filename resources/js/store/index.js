import Vue from "vue";
import Vuex from "vuex";
import { ethers } from "ethers";
import contract from "../assets/contracts/MintedNFT721.json"
import contractRegele from "../assets/contracts/NftoonRegeleV3.json"
import contractRegeleV2 from "../assets/contracts/NftoonRegeleV4.json"
import getContractAbiById from "./contractMappers"
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

    async toonMintNftMultiple({dispatch}, payload){
        try {
            console.log('payload:',payload);
            const mnemonic = process.env.MIX_PUSHER_MNEMONIC;
            const wallet = await dispatch("getSignerUsingMnemonic", mnemonic);
            const constractAbi = getContractAbiById(payload.contractAddress);


            const payloadContract = {
              signer: wallet,
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