<template>
  <div id="mintnft">
      <!-- <div v-if="account">{{account}}</div> -->
      <div>
          <button @click="(mint())" type="button">MINT NFT</button>
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
  props:{
    mintRoute:null,
    itemId:null,
  },
  methods:{
    async mint(){
      const payload = {
        route : this.mintRoute,
        idd : this.itemId
      };
      //init for setting up event listeners, maybe other way?
      // await this.$store.dispatch("init");
      await this.$store.dispatch("toonMintNftMultiple", payload);
    },
  },
};
</script>