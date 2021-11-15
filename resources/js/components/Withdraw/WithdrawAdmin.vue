<template>
  <div id="withdraw-admin">
    <div v-if="account">
        <label>Transfer din contul: {{account}}</label>
        <p>
            <!-- todo: type submit/button -->
            <button @click="(plataOPlomo())" id="save-form-2" type="submit">PLATESTE</button>
        </p>
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
            routeTransactionHash:null,
            routeBlockchainStatus:null,
            withdrawId: null,
        },
  computed: {
    account() {
      return this.$store.getters.account;
    },
  },
  methods: {
      async plataOPlomo(){
          const payload = 
          {
            'routeTransactionHash': this.routeTransactionHash,
            'routeBlockchainStatus': this.routeBlockchainStatus,
            'withdraw_id':this.withdrawId,
            'requestorWalletAddress': this.requestorWalletAddress, 
            'requestorAmmount': this.requestorAmmount
          };
          await this.$store.dispatch("payUser", payload);
      },
  }
};
</script>