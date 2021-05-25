<template>
    <div id="demo">
        <vue-metamask 
            @onComplete="onComplete"
        >
        </vue-metamask>
        <label>TokenId</label>
        <input type="number" v-model="token.id"/>
        <button @click="(mintNft())">MINT EMINEM NFT</button>
        <div v-if="token.id">
            <p>Minting tokenId: {{token.id}}</p>
        </div>
    </div>
</template>


<script>
    import VueMetamask from 'vue-metamask';
    // import {loadBlockchainData} from '../api/loadBlockchain';
    import {createAlchemyWeb3} from "@alch/alchemy-web3";
    import contract from "../assets/Master.json"

    export default {
        components: {
            VueMetamask,
        },
        data(){
            return {
                userData: null,
                decentralizedBankContract: null,
                token:{
                    id: null,
                }
            }
        },
        async mounted(){
            await this.loadBlockchainData();
        },
        methods:{
            onComplete(responseData){
                this.userData = responseData;
            },
            async loadBlockchainData(){
                const API_KEY ="https://eth-ropsten.alchemyapi.io/v2/X3ZvuZL6NkgWOL2Rws8iN7-GO_8qTNSC";
                const alchWeb3 = createAlchemyWeb3(API_KEY);
                const contractAddress = "0xad79cDe5874817BcA90a3FEcd736A422f725d766";
                this.decentralizedBankContract = new alchWeb3.eth.Contract(
                    contract.abi,
                    contractAddress
                );
            },
            async mintNft(){
                console.log('addr: ',this.userData.metaMaskAddress);
                await this.decentralizedBankContract.methods.mint(this.userData.metaMaskAddress, 'https://nftcool.free.beeceptor.com/eminem6.json', this.token.id).send({
                    from: this.userData.metaMaskAddress,
                }).on("transactionHash");
            }
        }
    }
</script>