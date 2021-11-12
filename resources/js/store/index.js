import Vue from "vue";
import Vuex from "vuex";
import { ethers } from "ethers";
import contract from "../assets/contracts/MintedNFT721.json"
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
    },
    mintRoute:null,
  },
  getters: {
    account: (state) => state.account,
    error: (state) => state.error,
    secrets: (state) => state.secrets,
    contractAddress: (state) => state.contractAddress,
    token: (state) => state.token,
    mintRoute: (state) => state.mintRoute,
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
      console.log("js mintRoute",route);
      state.mintRoute = route;
    }
  },
  actions: {
    loadSecrets({commit}){
      const secrets = {
        pinata_api_key:process.env.MIX_PUSHER_PINATA_API_KEY,
        pinata_secret_api_key:process.env.MIX_PUSHER_PINATA_SECRET_API_KEY,
        alchemy_api_key: process.env.MIX_PUSHER_ALCHEMY_SECRET_API_KEY
      };
      const contractAddress = process.env.MIX_PUSHER_MASTER_CONTRACT;
      commit("setSecrets", secrets);
      commit("setContract", contractAddress);
    },
    loadTokenData({commit}, tokenData){
      commit("setTokenData", tokenData);
    },
    async connect({ commit, dispatch }, connect) {
      try {
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
        await dispatch("fetchNFTMetadata");
        await dispatch("setupEventListeners");
      } catch (error) {
        console.log(error);
        commit("setError", "Account request refused.");
      }
    },
    async checkNetwork({ commit, dispatch }) {
      let chainId = await ethereum.request({ method: "eth_chainId" });
      const ropstenChainId = "0x3";
      if (chainId !== ropstenChainId) {
        if (!(await dispatch("switchNetwork"))) {
          commit(
            "setError",
            "You are not connected to the Ropsten Test Network!"
          );
        }
      }
    },
    async switchNetwork() {
      try {
        await ethereum.request({
          method: "wallet_switchEthereumChain",
          params: [{ chainId: "0x3" }],
        });
        return 1;
      } catch (switchError) {
        return 0;
      }
    },
    async checkIfConnected({ commit }) {
      const { ethereum } = window;
      const accounts = await ethereum.request({ method: "eth_accounts" });
      if (accounts.length !== 0) {
        commit("setAccount", accounts[0]);
        return 1;
      } else {
        return 0;
      }
    },
    async requestAccess({ commit }) {
      const { ethereum } = window;
      const accounts = await ethereum.request({
        method: "eth_requestAccounts",
      });
      commit("setAccount", accounts[0]);
    },
    async getContract({ state }) {
      try {
        const { ethereum } = window;
        const provider = new ethers.providers.Web3Provider(ethereum);
        const signer = provider.getSigner();
        const connectedContract = new ethers.Contract(
          state.contractAddress,
          contract.abi,
          signer
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
            console.log("save to DB")
            await dispatch("saveToDB");
          }
        );
      } catch (error) {
        console.log(error);
      }
    },
    async mintNFT({ commit, dispatch }, ipfsMetadataUrl) {
      try {
        const connectedContract = await dispatch("getContract");
        const mintTxn = await connectedContract["mint(string)"](ipfsMetadataUrl);
        await mintTxn.wait();
        console.log("finished mint nft")
        return mintTxn;
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
    async saveToDB({state}){
        if(state.token !== null){
            console.log("token",state.token);
            console.log("state.mintRoute",state.mintRoute);
            axios.post(state.mintRoute,state.token).then(res => {
            if(res.data.status === 'ok'){
                toastr.success(res.data.message);
            }else{
                toastr.error(res.data.message);
            }
            }).catch(error=>{
                toastr.error(error.response.data.errors);
        });
        }
    },
    async setMintRoute({commit},mintRoute){
      commit("setMintRoute", mintRoute);
    },
  },
});