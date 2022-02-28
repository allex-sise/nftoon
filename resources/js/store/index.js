import Vue from "vue";
import Vuex from "vuex";
import { ethers } from "ethers";
import contract from "../assets/contracts/MintedNFT721.json"
import axios from 'axios'

Vue.use(Vuex);

// Intreg fisierul o sa fie apelat pentru un contract anume
// alea cred ca trebuie sa le salvez aici global
// si restul functiilor trebuie sa fie generale


export default new Vuex.Store({
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
                const payload = {
                    route : '',
                    token : {
                        name : '',
                        itemIdkey :  '',
                        itemTokenid : '',
                        itemMetadataUrl : '',
                        description : '',
                        externalUrl : '',
                        nftImageUrl : '',
                        etherscan : 'https://ropsten.etherscan.io/token/' + contractAddress + '?a=' + tokenId
                    },
                };
                await dispatch("storeInDb", payload);
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
        const { ethereum } = window;
        const provider = new ethers.providers.Web3Provider(ethereum);
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
            //todo: salveaza in DB tx hash
            const mintTxn = await connectedContract["mint(string)"]('QmTUX9mwjT3oHC4P3zEoHdSt1tNJrxTRib2i1nNnraxFmR/10.json');
            
            console.log('mintTxn', mintTxn);
            // await mintTxn.wait();

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