<template>
  <div id="mintnft">
      <div v-if="account">Account: {{account}}</div>
      <div v-if="error">{{error}}</div>
      <div>
          <button @click="(mint())" type="button">MINT NFT MULTIPLU</button>
          <button @click="(getMetadata())" type="button">getMetadata</button>
          <!-- Sign allows to mint multiple contracts with one signature -->
          <button @click="(sign())" type="button">SIGN</button>
          <button @click="(consoleShow())" type="button">consoleShow</button>
      </div>
       
  </div>
</template>

<script>
export default {
  props:{
    mintRoute:null,
    items:null,
  },
  computed:{
    error(){
      return this.$store.getters.error;
    },
    account() {
      return this.$store.getters.account;
    },
  },
  methods:{
    consoleShow(){
      const nfts = this.transformToJson(this.items);
      nfts.forEach(nft => {
        console.log(nft.isImage)
      });
    },
    transformToJson(text){
      var itemsConverted = text.replaceAll("\"", "");
      itemsConverted = itemsConverted.replaceAll("'", "\"");
      return JSON.parse(itemsConverted);
    },
    async getMetadata(){
      const nfts = this.transformToJson(this.items);
      for (const nft of nfts) {
        let tokenId = await this.$store.dispatch("getTokenIdFromTxHash", nft.txHash);
        console.log('TokenId:',tokenId);

        const payload = {
          tokenId : tokenId,
          contractAddress : nft.contract,
        };
        // console.log('payload:',payload);

        let metadata = await this.$store.dispatch("getMetadata", payload);
        // nft are isImage
        //store in DB tokenId
        //metadata_url
        //salveaza "icon" dc e poza(file: img/video); "main_file" dc e video
          //prima data nu trebuie ca avem deja placeholder
        // ipfs_url
        // etherscan_url
        //status = 1



        // console.log('metadata:',metadata)
      }
    },
    async sign(){
      await this.$store.dispatch("connect");
      await this.$store.dispatch("getMetamaskSignature");
    },
    async mint(){
      const nfts = this.transformToJson(this.items);
      for (const nft of nfts) {
        const payload = {
          route : this.mintRoute,
          itemIdkey : nft.id,
          contractAddress : nft.contract,
        };
        await this.$store.dispatch("toonMintNftMultiple", payload);
      }
      //todo: window.location.reload();

      //init for setting up event listeners, maybe other way?
      // await this.$store.dispatch("init");
    },
  },
};
</script>