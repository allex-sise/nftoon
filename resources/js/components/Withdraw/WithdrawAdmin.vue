<template>
  <div id="withdraw-admin">
    <div v-if="error">{{error}}</div>
    <div v-if="!show">
      <blockchain-loader />
    </div>
    <div style="visibility: hidden"><scale-loader/></div>

    <div v-if="account && show">
        <label>Transfer din contul: {{account}}</label>
        <p>
            <button @click="(plataOPlomo())" type="button">PLATESTE</button>
        </p>
    </div>  
    <div v-if="!account"><button @click="(connect())" type="button">Connect MetaMask</button></div>
  </div>
</template>

<script>
import { ScaleLoader } from '@saeris/vue-spinners'
import BlockchainLoader from '../BlockchainLoader.vue';

function copyStyles(sourceDoc, targetDoc) {
  Array.from(sourceDoc.styleSheets).forEach(styleSheet => {
    if (styleSheet.cssRules) {
      // for <style> elements
      const newStyleEl = sourceDoc.createElement("style");

      Array.from(styleSheet.cssRules).forEach(cssRule => {
        // write the text of each rule into the body of the style element
        newStyleEl.appendChild(sourceDoc.createTextNode(cssRule.cssText));
      });

      targetDoc.head.appendChild(newStyleEl);
    } else if (styleSheet.href) {
      // for <link> elements loading CSS from a URL
      const newLinkEl = sourceDoc.createElement("link");

      newLinkEl.rel = "stylesheet";
      newLinkEl.href = styleSheet.href;
      targetDoc.head.appendChild(newLinkEl);
    }
  });
}

export default {
  components: {
    BlockchainLoader,
    ScaleLoader
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
  data(){
    return{
      show:true
    }
  },
  methods: {
    async connect(){
      await this.$store.dispatch("connect");
    },
    async plataOPlomo(){
        this.show = false;

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

        this.windowRef = window.open("", "", "width=300,height=400,left=200,top=200");
        this.windowRef.document.body.appendChild(this.$el);
        copyStyles(window.document, this.windowRef.document);

        await this.$store.dispatch("payUser", payload);

        this.windowRef.close();
        window.location.reload();
    },
  }
};
</script>