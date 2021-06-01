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
            <p>ImgUrl:{{tokenData.image}}</p>
            <input type="text" v-model="tokenData.name"/>Name:{{tokenData.name}}<br/>
            <input type="text" v-model="tokenData.animation_url"/>{{tokenData.animation_url}}<br/>
            <p>Info:{{ipfsMetadataUrl}}</p>
            <p>PhpVal: {{phpVariable}}</p>
        </form>
        <div class="container">
            <div class="large-12 medium-12 small-12 cell">
            <label>File
                <input type="file" id="file" ref="file" v-on:change="handleFileUpload()"/>
            </label>
                <button v-on:click="saveFile()">Submit IPFS</button>
            </div>
        </div>
        <button v-on:click="uploadFileWithUrl()">TEST</button>
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
            phpVariable:null
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
                ipfsMetadataUrl:null,
                ipfsImageUrl: null,
                file:null,
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
                console.log('addr: ',this.userData.metaMaskAddress);
                await this.decentralizedBankContract.methods.mint(this.userData.metaMaskAddress, 'https://nftcool.free.beeceptor.com/eminem6.json', this.token.id).send({
                    from: this.userData.metaMaskAddress,
                }).on("transactionHash");
            },
            async saveFile() {
                let isSuccess = await this.pinFileToIPFS();

                if(isSuccess == false){
                    return;
                }

                this.tokenData.image = 'https://dweb.link/ipfs/' + this.ipfsImageUrl;
                await this.pinJSONToIPFS();
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
                let response = await fetch('http://localhost/minted/public/uploads/60897636aa887_1619621430.png');
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