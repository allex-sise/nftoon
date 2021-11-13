<template>
  <div id="withdraw-admin">
    <div v-if="account">
        <label>Transfer din contul: {{account}}</label>
        <!-- todo: type submit -->
        <button @click="(plataOPlomo())" type="button">PlatesteETH</button>
    </div>  
  </div>
</template>

<script>
export default {
  async mounted() {
    await this.$store.dispatch("connect");
  },
  props:{
            requestorWalletAddress:null,
            requestorAmmount:null,
        },
  computed: {
    account() {
      return this.$store.getters.account;
    },
  },
  methods: {
      async plataOPlomo(){
          const payload = {'requestorWalletAddress': this.requestorWalletAddress, 'requestorAmmount': this.requestorAmmount}
          console.log(payload);
          await this.$store.dispatch("payUser", payload);
      }
  }
};
</script>