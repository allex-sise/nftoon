<template>
  <div id="withdraw-admin">
    <div v-if="error">{{error}}</div>
    <div v-if="account && show">
        <label>Transfer din contul: {{account}}</label>
        <p>
            <button @click="(plataOPlomo())" type="button">PLATESTE</button>
            <button @click="(payUserV2())" type="button">PLATESTE-V2</button>
        </p>
    </div>  
    <div v-if="!account"><button @click="(connect())" type="button">Connect MetaMask</button></div>
  </div>
</template>

<script>
export default {
  // async mounted() {
  //   await this.$store.dispatch("connect");
  // },
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
  data(){
    return{
      show:true
    }
  },
  methods: {
    async connect(){
      await this.$store.dispatch("connect");
    },
    async payUserV2(){
      await this.$store.dispatch("payUserV2", this.requestorWalletAddress);
    },
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

        this.show = false;
        this.windowRef = window.open("", "", "width=200,height=200,left=200,top=200");
        let alerta = document.createElement("P"); 
        alerta.innerText = "NU inchide aceasta pagina!";
        let info = document.createElement("P"); 
        info.innerText = "(pagina se va inchide automat)";
        this.windowRef.document.body.appendChild(this.$el);
        this.windowRef.document.body.appendChild(alerta);
        this.windowRef.document.body.appendChild(info);
        
        await this.$store.dispatch("payUser", payload);

        this.windowRef.close();
        window.location.reload();
    },
  }
};
</script>