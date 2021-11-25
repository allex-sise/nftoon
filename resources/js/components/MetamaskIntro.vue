<template>
    <div id="demo">
        <div v-if="error">{{error}}</div>
        <div v-if="!account"><button @click="(connect())" type="button">Connect MetaMask</button></div>
        <div  v-if="nftStatus === 0 && account">
            <button @click="(onMintNft())">MINT NFT</button>
        </div>
        <div>Contract:{{contractAddress}}</div>
        <p v-if="loading" :style="{color: '#ff0000'}">LOADING...</p>
            <div v-if="nftStatus === 2">
                <div v-if="receiverAddress && account">
                    <p>Receiver address: {{ receiverAddress }} </p>
                    <p><button @click="(transferToken())" type="button">Transfer</button></p>
                </div>
                <a :href="'https://ropsten.etherscan.io/token/' + contractAddress + '?a=' + itemTokenid">
                    <div class="single-info-title  single-info-column">
                        <p><svg width="22" height="22" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-13o7eu2 svgclassicon">
                        <path d="M4.364 9.999a.89.89 0 01.895-.89l1.482.004a.891.891 0 01.891.892v5.607c.167-.05.381-.102.616-.157a.743.743 0 00.572-.723V7.776a.892.892 0 01.892-.892h1.485a.891.891 0 01.891.892v6.456s.372-.15.734-.304a.744.744 0 00.454-.685V5.547a.891.891 0 01.892-.891h1.485a.891.891 0 01.891.891v6.337c1.288-.933 2.593-2.056 3.628-3.406A1.496 1.496 0 0020.4 7.08 10.483 10.483 0 0010.632 0C4.811-.077 0 4.677 0 10.501a10.47 10.47 0 001.394 5.252 1.327 1.327 0 001.266.656c.28-.024.63-.06 1.046-.108a.742.742 0 00.659-.737V9.999M4.332 18.991a10.493 10.493 0 0016.641-9.21c-3.834 5.721-10.915 8.396-16.64 9.21" fill="#1A1A1A">
                            </path></svg> <span class="spansvg">Etherscan</span></p>
                    </div>
                </a>
                <a :href="nftImageFromMetadata">
                    <div class="single-info-title  single-info-column">
                        <p><svg viewBox="0 0 26 20" fill="none" xmlns="http://www.w3.org/2000/svg" width="25" height="19" class="css-13o7eu2 svgclassicon"><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M3.396 9.535a.814.814 0 000 .93c.749 1.06 2.03 2.657 3.71 3.98C8.791 15.77 10.788 16.75 13 16.75c2.211 0 4.208-.98 5.893-2.306 1.681-1.322 2.962-2.92 3.71-3.98a.814.814 0 000-.929c-.748-1.06-2.029-2.657-3.71-3.98C17.208 4.23 15.211 3.25 13 3.25c-2.212 0-4.209.98-5.894 2.306-1.68 1.322-2.961 2.92-3.71 3.98zM5.56 3.591C7.5 2.065 10.03.75 13 .75c2.97 0 5.499 1.315 7.439 2.84 1.943 1.53 3.384 3.339 4.209 4.506l.003.005a3.315 3.315 0 010 3.798l-.003.005c-.825 1.167-2.266 2.977-4.209 4.505-1.94 1.526-4.47 2.841-7.44 2.841-2.969 0-5.499-1.315-7.439-2.84-1.942-1.53-3.384-3.339-4.208-4.506l-.004-.005a3.314 3.314 0 010-3.798l.004-.005C2.176 6.929 3.618 5.119 5.56 3.59z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M13 7.25a2.75 2.75 0 100 5.5 2.75 2.75 0 000-5.5zM7.75 10a5.25 5.25 0 1110.5 0 5.25 5.25 0 01-10.5 0z" fill="currentColor"></path></svg> <span class="spansvg">IPFS</span></p>
                    </div>
                </a>
                <a :href="itemMetadataUrl">
                    <div class="single-info-title  single-info-column">
                        <p><svg width="22" height="22" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-13o7eu2 svgclassicon"><path d="M19.21 5.222L10.639.936a1.428 1.428 0 00-1.279 0L.789 5.222A1.431 1.431 0 000 6.5v10c0 .54.306 1.035.79 1.278l8.571 4.286a1.43 1.43 0 001.278 0l8.571-4.286A1.43 1.43 0 0020 16.5v-10a1.43 1.43 0 00-.79-1.278zM10 3.812L15.377 6.5 10 9.189 4.623 6.501 10 3.81zm-7.143 5l5.714 2.857v6.806l-5.714-2.857V8.812zm8.572 9.663v-6.806l5.714-2.857v6.806l-5.714 2.857z" fill="#000"></path></svg> <span class="spansvg"> Metadata </span></p>
                    </div>
                </a>
            </div>
        <p/>
    </div>
</template>


<script>
    import axios from 'axios'

    export default {
        props:{
            description:null,
            externalUrl:null,
            name:null,
            image:null,
            mintRoute:null,
            itemIdkey:null,
            itemTokenid:null,
            itemMetadataUrl:null,
            receiverAddress:null,
        },
        data(){
            return {
                tokenData:{
                    description: this.description,
                    background_color: "ffffff",
                    external_url: this.externalUrl,
                    image: null,
                    name:this.name,
                    animation_url:null
                },
                file:{
                    ipfsMetadataUrl:null,
                    ipfsImageHash: null,
                },
                loading: false,
                nftImageFromMetadata: "#",
            }
        },
        async mounted(){
            await this.$store.dispatch("loadContract");
            if(this.nftStatus === 2){
                this.getNftImageFromMetadata();
            }
        },
        computed:{
            account() {
                return this.$store.getters.account;
            },
            secrets() {
                return this.$store.getters.secrets;
            },
            contractAddress(){
                return this.$store.getters.contractAddress;
            },
            nftStatus(){
                if(this.itemTokenid && this.itemMetadataUrl) return 2;
                if(this.itemTokenid) return 1;
                return 0;
            },
            error(){
                return this.$store.getters.error;
            }
        },
        methods:{
            async connect(){
                await this.$store.dispatch("connect");
                const token={
                    name:this.name,
                    //itemIdkey= DB the key of an item
                    itemIdkey: this.itemIdkey,
                    //blockchain NFT id
                    itemTokenid: this.itemTokenid,
                    itemMetadataUrl: null,
                    description: this.description,
                    externalUrl: this.externalUrl,
                };
                if(this.nftStatus === 2){
                    token.itemMetadataUrl = this.itemMetadataUrl;
                }
                console.log("token", token);

                await this.$store.dispatch("storeTokenData",token);
                await this.$store.dispatch("setMintRoute",this.mintRoute);
            },
            onMintNft(){
                if(this.itemTokenid === null || this.itemTokenid === ''){
                    this.uploadAndMint();
                }
                else{
                    console.log("NFT already minted!");
                }
            },
            async transferToken(){
            const payload={
                'receiverUserAddress': this.receiverAddress,
                'tokenId': this.itemTokenid,
            };
            await this.$store.dispatch("transferToken",payload);
            },
            async uploadAndMint(){
                this.loading=true;
                await this.saveFile();
                await this.mintNft();
                this.loading=false;
            },
            async mintNft(){
                if(!this.nftHasNecessaryData()) {
                    console.log("Missing necessary data")
                    return;
                }
                const mintResponse = await this.$store.dispatch("mintNFT", this.file.ipfsMetadataUrl);
            },
            nftHasNecessaryData(){
                if(this.itemTokenid == null || 
                this.tokenData.background_color== null ||
                this.tokenData.external_url== null ||
                this.tokenData.image== null ||
                this.tokenData.name== null){
                    return false;
                }
                return true;
            },
            async getNftImageFromMetadata(){
                if(this.itemMetadataUrl != null){
                    let metadata = null;
                    await axios.get(this.itemMetadataUrl).then(response => (metadata = response.data));
                    this.nftImageFromMetadata = metadata.image;
                }
            },
            async saveFile() {
                this.loading=true;

                let isSuccess = await this.uploadFileWithUrl();
                if(isSuccess == false || this.file.ipfsImageHash == null){
                    this.loading=false;
                    return;
                }

                this.tokenData.image = this.createIpfsUrl(this.file.ipfsImageHash);
                await this.pinJSONToIPFS();
            },
            createIpfsUrl(imageHash){
                return 'https://dweb.link/ipfs/' + imageHash;
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
                        pinata_api_key: this.secrets.pinata_api_key,
                        pinata_secret_api_key: this.secrets.pinata_secret_api_key
                    },
                };

                let ipfsMetadataUrl = null;

                await axios.post(url, body, configUploadJson)
                    .then(response => (ipfsMetadataUrl = response.data.IpfsHash))
                    .catch(function (error) {
                        console.log(error);
                        return false;
                    });

                if(ipfsMetadataUrl == null){
                    return false
                }
                this.file.ipfsMetadataUrl = ipfsMetadataUrl;
                return true;
            },
            async getFileData(){
                let response = await fetch(this.image);
                return await response.blob();
            },
            async uploadFileWithUrl(){
                const url = `https://api.pinata.cloud/pinning/pinFileToIPFS`;
                
                let data = new FormData();
                data.append('file', await this.getFileData(), 'nft_'+this.itemTokenid);

                let configUploadFile = {
                    maxContentLength:'Infinity',
                    headers: {
                        'Content-Type': `multipart/form-data; boundary=${data._boundary}`,
                        pinata_api_key: this.secrets.pinata_api_key,
                        pinata_secret_api_key: this.secrets.pinata_secret_api_key
                    }
                };

                let ipfsImageHash = null;
                await axios.post(url, data, configUploadFile)
                    .then(response => (ipfsImageHash = response.data.IpfsHash))
                    .catch(function (error) {
                        console.log(error);
                        return false;
                    });

                if(ipfsImageHash == null){
                    return false;
                }
                this.file.ipfsImageHash = ipfsImageHash;
                return true;
            },
            // async saveToDB(){
            //     await this.$store.dispatch("saveToDB");
            // },
        }
    }
</script>