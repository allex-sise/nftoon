<template>
  <div id="withdraw-admin">
    <div v-if="account">
        <label>Transfer din contul: {{account}}</label>
        <!-- todo: type submit -->
        <p>
            <button @click="(plataOPlomo())" type="button">PLATESTE</button>
        </p>
        <p>
            <button @click="(checkTransaction())" type="button">Verifica tranzactie</button>
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
        },
  computed: {
    account() {
      return this.$store.getters.account;
    },
  },
  methods: {
      async plataOPlomo(){
          const payload = {'requestorWalletAddress': this.requestorWalletAddress, 'requestorAmmount': this.requestorAmmount}
          await this.$store.dispatch("payUser", payload);
      },
      async checkTransaction(){
          await this.$store.dispatch("isTransactionMined", "0x2b4d46956d3b17c1f54ade8a0e375ed1e09b9c8e7d7adfe17d18db7ff10f0f81");
      }
  }
};
</script>