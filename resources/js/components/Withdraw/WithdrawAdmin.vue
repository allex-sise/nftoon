<template>
  <div id="withdraw-admin">
    <div v-if="error">{{error}}</div>
    <div v-if="account">
        <label>Transfer din contul: {{account}}</label>
        <p>
            <button @click="(plataOPlomo())" type="button">PLATESTE</button>
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
            withdrawAmount:null,
            withdrawAmountEth: null,
            routeTransactionHash:null,
            routeBlockchainStatus:null,
            routePaymentAuthor: null,
            withdrawId: null,
            payoutUserId: null,
            payoutId: null,
        },
  computed: {
    account() {
      return this.$store.getters.account;
    },
    error(){
        return this.$store.getters.error;
    }
  },
  methods: {
      async plataOPlomo(){
          const payload = 
          {
            'requestorWalletAddress': this.requestorWalletAddress, 
            'withdrawAmount': this.withdrawAmount,
            'withdrawAmountEth': this.withdrawAmountEth,
            'routeTransactionHash': this.routeTransactionHash,
            'routeBlockchainStatus': this.routeBlockchainStatus,
            'routePaymentAuthor': this.routePaymentAuthor,
            'withdraw_id':this.withdrawId,
            'payoutUserId':this.payoutUserId,
            'payoutId':this.payoutId,
          };
          await this.$store.dispatch("payUser", payload);
      },
  }
};
</script>