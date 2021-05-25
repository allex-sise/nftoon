<template>
    <div id="demo">
        <vue-metamask 
            userMessage="msg" 
            @onComplete="onComplete"
        >
        </vue-metamask>
        <button @click="(mintNft())">MINT NFT</button>
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
                msg: "This is demo net work",
                decentralizedBankContract: null,
                userData: null,
            }
        },
        async mounted(){
            await this.loadBlockchainData();
        },
        methods:{
            onComplete(responseData){
                this.userData = responseData;
                // console.log('data:', responseData);
            },
            async loadBlockchainData(){
                const API_KEY ="https://eth-ropsten.alchemyapi.io/v2/X3ZvuZL6NkgWOL2Rws8iN7-GO_8qTNSC";
                const alchWeb3 = createAlchemyWeb3(API_KEY);
                const contractAddress = "0xad79cDe5874817BcA90a3FEcd736A422f725d766";
                this.decentralizedBankContract = new alchWeb3.eth.Contract(
                    contract.abi,
                    contractAddress
                );
                // const userCount = await this.decentralizedBankContract.methods.userCount().call();
                // for (let i = 1; i <= userCount; i++) {
                //     const user = await this.decentralizedBankContract.methods.users(i).call();
                //     console.log('user: ',user);
                // }
            },
            async mintNft(){
                console.log('addr: ',this.userData.metaMaskAddress);
                await this.decentralizedBankContract.methods.mint(this.userData.metaMaskAddress, 'https://nftcool.free.beeceptor.com/eminem6.json', 12).send({
                    from: this.userData.metaMaskAddress,
                }).on("transactionHash");
            }
        }
    }
</script>