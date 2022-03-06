import Vue from "vue";
import Vuex from "vuex";
import { ethers } from "ethers";
import contract from "../assets/contracts/MintedNFT721.json";
import axios from 'axios';

const { createAlchemyWeb3 } = require("@alch/alchemy-web3");


Vue.use(Vuex);

// Intreg fisierul o sa fie apelat pentru un contract anume
// alea cred ca trebuie sa le salvez aici global
// si restul functiilor trebuie sa fie generale


export default new Vuex.Store({
  state: {
    connectedContract: null,
  },
  getters: {
    connectedContract: (state) => state.connectedContract,
  },
  mutations: {
    async initContract(state, contractAddress) {
      if(state.connectedContract == null){
        const mnemonic = process.env.MIX_PUSHER_MNEMONIC;
        const wallet = await dispatch("getSignerUsingMnemonic", mnemonic);
        const payload = {
          signer: wallet,
          contractAddress: contractAddress,
          contractAbi: contract.abi,
        }
        const contract = await dispatch("createContract", payload);

        state.connectedContract = contract;
      }
    },
  },
  actions: {
    async init({dispatch}){
      const mnemonic = process.env.MIX_PUSHER_MNEMONIC;
      const wallet = await dispatch("getSignerUsingMnemonic", mnemonic);
      const payload = {
        signer: wallet,
        contractAddress: process.env.MIX_PUSHER_ALCHEMY_CONTRACT,
        contractAbi: contract.abi,
      }
      await dispatch("setupEventListeners", payload);
      console.log('Init complete');
    },
    async setupEventListeners({ dispatch }, payload) {
        try {
        const connectedContract = await dispatch("createContract", payload);

        connectedContract.on(
            "Minted",
            async (from, tokenId, indexedTokenIPFSPath, tokenIPFSPath) => {
                const payloadMint = {
                    route : payload.route,
                    token : {
                        name : payload.name,
                        itemIdkey :  payload.idd,
                        itemTokenid : tokenId.toNumber(),
                        itemMetadataUrl : 'https://dweb.link/ipfs/' + tokenIPFSPath,
                        description : payload.description,
                        nftImageUrl : 'https://dweb.link/ipfs/' + payload.ipfsImageHash,
                        etherscan : 'https://ropsten.etherscan.io/token/' + contractAddress + '?a=' + tokenId
                    },
                };
                await dispatch("storeInDb", payloadMint);
                // window.location.reload();
            }
        );

        //todo: Continue with the rest below!
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
    //old getContract
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
            const mnemonic = process.env.MIX_PUSHER_MNEMONIC;
            const wallet = await dispatch("getSignerUsingMnemonic", mnemonic);

            const payloadContract = {
              signer: wallet,
              contractAddress: process.env.MIX_PUSHER_ALCHEMY_CONTRACT,
              contractAbi: contract.abi,
            }
            const connectedContract = await dispatch("createContract", payloadContract);

            console.log('MINT', payloadContract);
            const mintTxn = await connectedContract["mint(string)"]('QmTUX9mwjT3oHC4P3zEoHdSt1tNJrxTRib2i1nNnraxFmR/14.json');
            
            console.log('mintTxn', mintTxn);
            await mintTxn.wait();

            const payloadTxHash = {
                route: payload.route,
                idd: payload.idd,
                transactionHash: mintTxn.hash
            }
            await dispatch("storeInDb", payloadTxHash);
        } catch (error) {
            console.log(error);
            return null;
        }
    },
    async storeInDb({dispatch}, payload){
      console.log('store in DB', payload);
      axios.post(payload.route, payload);
    },
  },
});