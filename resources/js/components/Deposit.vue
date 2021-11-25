<template>
  <div id="deposit">
      <div v-if="!account"><button class="btn btn-main" @click="(connect())" type="button">Connect MetaMask</button></div>
        
      <input class="bank_deposit_input" v-if="account" name="account_number" :value="account">
      <button type="button" class="boxed-btn-white " data-dismiss="modal">Anuleaza</button>
      <button class="btn btn-main" @click="(pay())" type="button">Adauga credit</button>
                   
  </div>
</template>

<script>
export default {
//   async mounted() {
//     await this.$store.dispatch("connect");
//   },
  props:{
    mintedWallet: null,
    ownerName: null,
    // userId:null,
    withdrawAmount: null,
    route: null,
    routeBlockchainDeposit: null,
    routeBlockchainStorePayment: null,
  },
  computed: {
    account() {
      return this.$store.getters.account;
    },
  },
  // data(){
  //   return{
  //     mintedWallet:null
  //   }
  // },
  methods: {
    async connect(){
      await this.$store.dispatch("connect");
    },
    async pay(){
      const payload = 
        {
          'mintedWallet': '0xc944E6b1bC87F54f390E19f83d7F0b35072aB375', 
          'userWallet': this.account,
          'ownerName': this.ownerName,
          // 'userId': this.userId,
          'withdrawAmount': this.withdrawAmount,
          'withdrawAmountEth': '0.00001',//this.withdrawAmountEth,
          'routeBlockchainDeposit': this.routeBlockchainDeposit,
          'routeBlockchainStorePayment': this.routeBlockchainStorePayment,
        };
        console.log("payload", payload);
      await this.$store.dispatch("userDepositFunds", payload);
    }
  }
};
</script>