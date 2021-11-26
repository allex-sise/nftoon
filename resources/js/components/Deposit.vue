<template>
  <div id="deposit">
    <!-- <button class="btn btn-main" @click="(convertToEth())" type="button">Test</button>
    {{withdrawAmountEth}} -->
      <div v-if="!account"><button class="btn btn-main" style="display: block; margin: 0 auto;" @click="(connect())" type="button">Connect MetaMask</button></div>
        
      <input class="bank_deposit_input" v-if="account" name="account_number" :value="account">
      <div class="modal-footer d-flex justify-content-between">
        <button type="button" class="btn btn-main btn-white " data-dismiss="modal">Anuleaza</button>
        <button v-if="account" class="btn btn-main" @click="(pay())" type="button" style="float: right;">Adauga credit</button>
      </div>             
  </div>
</template>

<script>
// import axios from 'axios'

// axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*';

export default {
  props:{
    mintedWallet: null,
    ownerName: null,
    withdrawAmount: null,
    withdrawAmountEth: null,
    route: null,
    routeRedirect: null,
    routeBlockchainDeposit: null,
    routeBlockchainStorePayment: null,
  },
  // data(){
  //   return {
  //     withdrawAmountEth: null,
  //   }
  // },
  computed: {
    account() {
      return this.$store.getters.account;
    },
  },
  methods: {
    async connect(){
      await this.$store.dispatch("connect");
    },
    async convertToEth(){
      const url="https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=RON";
      await axios.get(url)
      .then(response => {
        const price = this.withdrawAmount / response.data;
        this.withdrawAmountEth = parseFloat(price).toFixed(4);
      })
      .catch(function (error) {
          console.log(error);
      });
    },
    async pay(){
      const payload = 
        {
          'mintedWallet': '0xc944E6b1bC87F54f390E19f83d7F0b35072aB375', 
          'userWallet': this.account,
          'ownerName': this.ownerName,
          'withdrawAmount': this.withdrawAmount,
          'withdrawAmountEth': this.withdrawAmountEth,
          'routeBlockchainDeposit': this.routeBlockchainDeposit,
          'routeBlockchainStorePayment': this.routeBlockchainStorePayment,
        };
      await this.$store.dispatch("userDepositFunds", payload);
      window.location.href = this.routeRedirect;
    }
  }
};
</script>