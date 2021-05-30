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
        <div v-if="userData">
            <label>Wallet address:</label>{{userData.metaMaskAddress}}
        </div>
        <form>
            <input type="text" v-model="tokenData.description"/>Desc:{{tokenData.description}}<br/>
            <input type="text" v-model="tokenData.background_color"/>{{tokenData.background_color}}<br/>
            <input type="text" v-model="tokenData.external_url"/>{{tokenData.external_url}}<br/>
            <input type="text" v-model="tokenData.image"/>ImgUrl:"{{tokenData.image}}<br/>
            <input type="text" v-model="tokenData.name"/>Name:{{tokenData.name}}<br/>
            <input type="text" v-model="tokenData.animation_url"/>{{tokenData.animation_url}}<br/>
            <button type="button" v-on:click="saveFile()">saveFile</button>
            <p>Info:{{info}}</p>
        </form>
        <div class="container">
            <div class="large-12 medium-12 small-12 cell">
            <label>File
                <input type="file" id="file" ref="file" v-on:change="handleFileUpload()"/>
            </label>
                <button v-on:click="pinFileToIPFS()">Submit File</button>
            </div>
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
                },
                tokenData:{
                    description: "pinataTest",
                    background_color: "ffffff",
                    external_url: "https://minted.ro/",
                    image: "www.mint.ro",
                    name:"namePin",
                    animation_url:null
                },
                info:null,
                file:'',
                pinata_api_key:null,
                pinata_secret_api_key:null
            }
        },
        async mounted(){
            await this.loadBlockchainData();
            this.pinata_api_key=process.env.MIX_PUSHER_PINATA_API_KEY;
            this.pinata_secret_api_key=process.env.MIX_PUSHER_PINATA_SECRET_API_KEY;
            console.log(this.pinata_api_key);
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
            },
            saveFile() {
                this.pinJSONToIPFS();
            },
            pinJSONToIPFS(){
                const url = `https://api.pinata.cloud/pinning/pinJSONToIPFS`;

                const body = {
                    pinataMetadata: {
                        name: this.tokenData.name
                    },
                    pinataContent: this.tokenData,
                };

                const configUploadJson = {
                    headers: {
                        pinata_api_key: this.pinata_api_key,
                        pinata_secret_api_key: this.pinata_secret_api_key
                    },
                };

                axios.post(url, body, configUploadJson)
                    .then(response => (this.info = response.data.IpfsHash))
                    .catch(function (error) {
                        //handle error here
                        console.log(error);
                    });
            },
            handleFileUpload(){
                this.file = this.$refs.file.files[0];
            },
            pinFileToIPFS(){
                const url = `https://api.pinata.cloud/pinning/pinFileToIPFS`;

                let data = new FormData();
                data.append('file', this.file);

                let configUploadFile = {
                    maxContentLength:'Infinity',
                    headers: {
                        'Content-Type': `multipart/form-data; boundary=${data._boundary}`,
                        pinata_api_key: this.pinata_api_key,
                        pinata_secret_api_key: this.pinata_secret_api_key
                    }
                };

                axios.post(url, data, configUploadFile)
                    .then(response => (this.info = response.data.IpfsHash))
                    .catch(function (error) {
                        //handle error here
                        console.log(error);
                    });
            }
        }
    }
</script>