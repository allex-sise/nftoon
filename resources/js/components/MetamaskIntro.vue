<template>
    <div id="demo">
        <div v-if="token.id">
            <p>TokenId: {{token.id}}</p>
            <button @click="(updateDBWithMetadata())">STORE NFT</button>
        </div>
        <div v-else>
            <button @click="(onMintNft())">MINT NFT</button>
        </div>
        <div>Contract:{{contractAddress}}</div>
        <p v-if="loading" :style="{color: '#ff0000'}">LOADING...</p>

        <div v-if="provider">
            <label>Wallet address:</label>{{provider.selectedAddress}}
        </div>

        <div v-if="token.metadata">
            <label>Metadata:</label>{{token.metadata}}
        </div>
        <p/>
    </div>
</template>


<script>
    import detectEthereumProvider from '@metamask/detect-provider';
    import {createAlchemyWeb3} from "@alch/alchemy-web3";
    import contract from "../assets/contracts/MintedNFT721.json"
    import axios from 'axios'

    export default {
        props:{
            description:null,
            externalUrl:null,
            name:null,
            image:null,
            mintRoute:null,
            itemIdkey:null,
            itemTokenid:null
        },
        data(){
            return {
                contractAddress: null,
                provider: null,
                decentralizedContract: null,
                token:{
                    id: this.itemTokenid,
                    mintResponse: null,
                    metadata: null,
                    metadataFields: null,
                    itemIdkey: this.itemIdkey
                },
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
                pinata_api_key:null,
                pinata_secret_api_key:null,
                alchemy_api_key: null,
                loading: false,
                
            }
        },
        async mounted(){
            this.pinata_api_key = process.env.MIX_PUSHER_PINATA_API_KEY;
            this.pinata_secret_api_key = process.env.MIX_PUSHER_PINATA_SECRET_API_KEY;
            this.contractAddress = process.env.MIX_PUSHER_MASTER_CONTRACT;
            this.alchemy_api_key = process.env.MIX_PUSHER_ALCHEMY_SECRET_API_KEY;
            await this.loadBlockchainData();
            this.provider = await detectEthereumProvider();
            console.log("provider: ",this.provider);
        },
        methods:{
            async loadBlockchainData(){
                const API_KEY ="https://eth-ropsten.alchemyapi.io/v2/"+this.alchemy_api_key;
                const alchWeb3 = createAlchemyWeb3(API_KEY);
                this.decentralizedContract = new alchWeb3.eth.Contract(
                    contract.abi,
                    this.contractAddress
                );
            },
            //onMintNft = async() =>{
            onMintNft(){
                if(this.itemTokenid === null || this.itemTokenid === ''){
                    this.uploadAndMint();
                }
                else{
                    console.log("NFT already minted!");
                }
            },
            onGetNftMetadata(){
                this.getNftMetadata();
            },
            async updateDBWithMetadata(){
                console.log("Store metadata to DB");
                await this.getNftMetadata();
                this.saveToDB();
            },
            async uploadAndMint(){
                await this.getNextAvailableId();
                console.log('save file...');
                await this.saveFile();
                console.log('mint nft ...');
                await this.mintNft();
            },
            async getNextAvailableId(){
                await this.decentralizedContract.methods.getNextTokenId().call()
                    .then(response => 
                    this.token.id=response);
            },
            async mintNft(){
                if(!this.nftHasNecessaryData()) {
                    console.log("Missing necessary data")
                    return;
                }

                const transactionParameters = {
                    to: this.contractAddress,
                    from: this.provider.selectedAddress,
                    'data': this.decentralizedContract.methods.mint(this.file.ipfsMetadataUrl).encodeABI()
                };
                try {
                    this.token.mintResponse = await this.provider.request({
                        method: 'eth_sendTransaction',
                        params: [transactionParameters],
                    });
                    console.log("saving to db...")
                    this.saveToDB();
                } catch (error) {
                    console.log("error:",error.message);
                }
            },
            nftHasNecessaryData(){
                if(this.token.id == null || 
                this.tokenData.background_color== null ||
                this.tokenData.external_url== null ||
                this.tokenData.image== null ||
                this.tokenData.name== null){
                    return false;
                }
                return true;
            },
            async getNftMetadata(){
                if(this.token.id == null) return;
                this.token.metadata = null;
                this.token.metadataFields = null;

                await this.decentralizedContract.methods.tokenURI(this.token.id).call()
                    .then(response => 
                    this.token.metadata=response);

                //https://stackoverflow.com/questions/28001722/how-to-catch-uncaught-exception-in-promise
                if(this.token.metadata != null){
                    await axios.get(this.token.metadata).then(response => (this.token.metadataFields = response.data));
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

                this.loading=false;
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
                        pinata_api_key: this.pinata_api_key,
                        pinata_secret_api_key: this.pinata_secret_api_key
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
                data.append('file', await this.getFileData(), 'nft_'+this.token.id);

                let configUploadFile = {
                    maxContentLength:'Infinity',
                    headers: {
                        'Content-Type': `multipart/form-data; boundary=${data._boundary}`,
                        pinata_api_key: this.pinata_api_key,
                        pinata_secret_api_key: this.pinata_secret_api_key
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
            saveToDB(){
                axios.post(this.mintRoute,this.token).then(res => {
                    if(res.data.status === 'ok'){
                        toastr.success(res.data.message);
                    }else{
                        toastr.error(res.data.message);
                    }
                    }).catch(error=>{
                       toastr.error(error.response.data.errors);
                });
            }
        }
    }
</script>