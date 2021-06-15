<template>
    <div id="demo">
        <vue-metamask 
            @onComplete="onComplete"
        >
        </vue-metamask>
        <p v-if="loading" :style="{color: '#ff0000'}">LOADING...</p>

        <div v-if="userData">
            <label>Wallet address:</label>{{userData.metaMaskAddress}}
        </div>
        {{file.ipfsMetadataUrl}}
        <p/>
        <label>TokenId</label>
        <input type="number" v-model="token.id"/>
        <button @click="(onMintNft())">MINT NFT</button>
        <div v-if="token.id">
            <p>Minting tokenId: {{token.id}}</p>
        </div>
        <p><button @click="(onGetNftMetadata())">GET METADATA</button></p>
        <p>{{token.metadata}}</p>
        <p>{{token.metadataFields}}</p>
        <img :src=this.tokenData.image />
    </div>
</template>


<script>
    import VueMetamask from 'vue-metamask';
    // import {loadBlockchainData} from '../api/loadBlockchain';
    import {createAlchemyWeb3} from "@alch/alchemy-web3";
    import contract from "../assets/Master.json"
    import axios from 'axios'

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
                    mintResponse: null,
                    metadata: null,
                    metadataFields: null
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
                loading: false,
                
            }
        },
        async mounted(){
            await this.loadBlockchainData();
            this.pinata_api_key=process.env.MIX_PUSHER_PINATA_API_KEY;
            this.pinata_secret_api_key=process.env.MIX_PUSHER_PINATA_SECRET_API_KEY;
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
            onMintNft(){
                this.uploadAndMint();
            },
            onGetNftMetadata(){
                this.getNftMetadata();
            },
            async uploadAndMint(){
                await this.saveFile();
                await this.mintNft();
            },
            async mintNft(){
                if(!this.nftHasNecessaryData()) return;
                this.token.mintResponse = await this.decentralizedBankContract.methods.mint(this.userData.metaMaskAddress, this.file.ipfsMetadataUrl, this.token.id).send({
                    from: this.userData.metaMaskAddress,
                }).on("transactionHash")
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

                await this.decentralizedBankContract.methods.tokenURI(this.token.id).call()
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
                this.file.ipfsMetadataUrl = 'https://dweb.link/ipfs/' + ipfsMetadataUrl
                return true;
            },
            async getFileData(){
                let response = await fetch(this.image);
                return await response.blob();

            },
            async uploadFileWithUrl(){
                //todo: temporary:
                // this.ipfsImageHash='QmUvS2AbXi4dchK9giDR2JtBwB8JPysjoAY1b7cnoCBRju';
                // return true;


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
            }
        }
    }
</script>