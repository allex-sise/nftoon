<template>
  <div id="deposit">
    <div v-if="error">{{error}}</div>
    <div v-if="loading">
        <blockchain-loader />
    </div>
    <div v-if="!loading">
    <!-- <button class="btn btn-main" @click="(convertToEth())" type="button">Test</button>
    {{withdrawAmountEth}} -->
      <div v-if="!account"><button class="btn btn-main" style="display: block; margin: 0 auto;" @click="(connect())" type="button">Connect MetaMask</button></div>
        
      <input class="bank_deposit_input" v-if="account" name="account_number" :value="account">
      <div class="modal-footer d-flex justify-content-between">
        <button type="button" class="btn btn-main btn-white " data-dismiss="modal">Anuleaza</button>
        <button v-if="account" class="btn btn-main" @click="(pay())" type="button" style="float: right;">Adauga credit</button>
      </div>  
    </div>           
  </div>
</template>

<script>
import BlockchainLoader from './BlockchainLoader.vue';
// import axios from 'axios'

// axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*';

export default {
  components: {
      BlockchainLoader,
  },
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
  data(){
    return {
      loading: false,
      // withdrawAmountEth: null,
    }
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
      
      this.loading=true;
      this.windowRef = window.open("", "", "width=300,height=400,left=200,top=200");
      this.windowRef.document.body.appendChild(this.$el);

      await this.$store.dispatch("userDepositFunds", payload);

      this.loading=false;
      this.windowRef.close();

      window.location.href = this.routeRedirect;
    }
  }
};
</script>