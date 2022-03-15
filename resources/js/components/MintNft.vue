<template>
  <div id="mintnft">
      <!-- <div v-if="account">{{account}}</div> -->
      <div>
          <button @click="(mint())" type="button">MINT NFT MULTIPLU</button>
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
  methods:{
    consoleShow(){
      const nfts = this.transformToJson(this.items);
      nfts.forEach(nft => {
        console.log(nft.contract)
      });
    },
    transformToJson(text){
      var itemsConverted = text.replaceAll("\"", "");
      itemsConverted = itemsConverted.replaceAll("'", "\"");
      return JSON.parse(itemsConverted);
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
      //init for setting up event listeners, maybe other way?
      // await this.$store.dispatch("init");
    },
  },
};
</script>