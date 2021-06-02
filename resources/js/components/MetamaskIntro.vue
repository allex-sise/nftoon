<template>
    <div id="demo">
        <vue-metamask 
            @onComplete="onComplete"
        >
        </vue-metamask>
        <p v-if="loading" color=red>LOADING...</p>

        <div v-if="userData">
            <label>Wallet address:</label>{{userData.metaMaskAddress}}
        </div>
        <button v-on:click="saveFile()">Submit IPFS</button>
        <!-- <button v-on:click="uploadFileWithUrl()">TEST</button> -->
        {{ipfsMetadataUrl}}
        <p/>
        <label>TokenId</label>
        <input type="number" v-model="token.id"/>
        <button @click="(mintNft())">MINT NFT</button>
        <div v-if="token.id">
            <p>Minting tokenId: {{token.id}}</p>
        </div>
        <p>Mint response: {{mintResponse}}</p>
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
        props:{
            description:null,
            externalUrl:null,
            name:null,
            image:null
        },
        data(){
            return {
                userData: null,
                decentralizedBankContract: null,
                token:{
                    id: null,
                },
                tokenData:{
                    description: this.description,
                    background_color: "ffffff",
                    external_url: this.externalUrl,
                    image: null,
                    name:this.name,
                    animation_url:null
                },
                ipfsMetadataUrl:null,
                ipfsImageUrl: this.image,
                file:null,
                pinata_api_key:null,
                pinata_secret_api_key:null,
                loading: false,
                mintResponse: null
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
            tmp(){
                document.getElementById("demo").innerHTML = "Hello World";
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
                if(this.token.id == null) return;
                await this.decentralizedBankContract.methods.mint(this.userData.metaMaskAddress, this.ipfsMetadataUrl, this.token.id).send({
                    from: this.userData.metaMaskAddress,
                }).on("transactionHash")
            },
            async saveFile() {
                // let isSuccess = await this.pinFileToIPFS();
                this.loading=true;
                let isSuccess = await this.uploadFileWithUrl();

                if(isSuccess == false){
                    return;
                }

                this.tokenData.image = 'https://dweb.link/ipfs/' + this.ipfsImageUrl;
                await this.pinJSONToIPFS();
                this.loading=false;
            },
            async pinJSONToIPFS(){
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

                await axios.post(url, body, configUploadJson)
                    .then(response => (this.ipfsMetadataUrl = 'https://dweb.link/ipfs/' + response.data.IpfsHash))
                    .catch(function (error) {
                        console.log(error);
                        return false;
                    });

                return true;
            },
            handleFileUpload(){
                this.file = this.$refs.file.files[0];
            },
            async getFileData(){
                // let response = await fetch('http://'+this.ipfsImageUrl);
                let response = await fetch('http://localhost/minted/public/uploads/product/thumbnail/thum-f0378bd7760ae93c7971b96ae2db8bb1.jpeg');
                return await response.blob();
                // let metadata = {
                //     type: 'image/jpeg'
                // };
                // return new File([data], "test.jpg",metadata);

            },
            async pinFileToIPFS(){
                if(this.file == null){
                    return false;
                }
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

                await axios.post(url, data, configUploadFile)
                    .then(response => (this.ipfsImageUrl = response.data.IpfsHash))
                    .catch(function (error) {
                        console.log(error);
                        return false;
                    });
                return true;
            },
            async uploadFileWithUrl(){
                //todo https://stackoverflow.com/questions/37241882/how-to-append-an-image-from-url-to-a-formdata-javascript
                const url = `https://api.pinata.cloud/pinning/pinFileToIPFS`;
                
                let data = new FormData();
                data.append('file', await this.getFileData());
                data.append('name','imageMain');

                let configUploadFile = {
                    maxContentLength:'Infinity',
                    headers: {
                        'Content-Type': `multipart/form-data; boundary=${data._boundary}`,
                        pinata_api_key: this.pinata_api_key,
                        pinata_secret_api_key: this.pinata_secret_api_key
                    }
                };

                await axios.post(url, data, configUploadFile)
                    .then(response => (this.ipfsImageUrl = response.data.IpfsHash))
                    .catch(function (error) {
                        console.log(error);
                        return false;
                    });
                return true;
            }
        }
    }
</script>