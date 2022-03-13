<template>
  <div id="mintnft">
      <!-- <div v-if="account">{{account}}</div> -->
      <div>
          <button @click="(mint())" type="button">MINT NFT MULTIPLU</button>
      </div>
       
  </div>
</template>

<script>
export default {
//   async mounted() {
//     await this.$store.dispatch("connect");
//   },
//   computed: {
//     account() {
//       return this.$store.getters.account;
//     },
//   },

//itemIdkey <- nft id
//itemNumberkey <- nft cloned number (incremental)
  props:{
    mintRoute:null,
    itemIdkey:null,
    itemNumberkey:null,
    contractAddress:null,
    ipfsPath: null,
  },
  methods:{
    async mint(){
      const payload = {
        route : this.mintRoute,
        itemIdkey : this.itemIdkey,
        contractAddress : this.contractAddress,
        ipfsPath : this.ipfsPath + '/' + this.itemNumberkey + '.json',
      };
      //init for setting up event listeners, maybe other way?
      // await this.$store.dispatch("init");
      await this.$store.dispatch("toonMintNftMultiple", payload);
    },
  },
};
</script>