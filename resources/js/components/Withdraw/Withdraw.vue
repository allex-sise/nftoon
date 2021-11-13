<template>
  <div id="withdraw">
      <div v-if="account">
        <label>Wallet address:</label>{{account}}
      </div>
      <p><button @click="connect">Connect</button></p>
      <p><button @click="mint">mint</button></p>
  </div>
</template>

<script>
export default {
  data() {
  },
  methods: {
    async connect() {
      await this.$store.dispatch("connect", 1);
    },
    async test() {
      await this.$store.dispatch("loadSecrets");
    },
    async mint(){
      const payload = "QmSTnjJQH3L1YLKsFcCnWC7htGEvVKL3rs623E4tbn5wVs";
      await this.$store.dispatch("mintNFT", payload);
    }
  },
  async mounted() {
    await this.$store.dispatch("connect");
  },
  computed: {
    account() {
      return this.$store.getters.account;
    },
    secrets() {
      return this.$store.getters.secrets;
    },
    contract() {
      return this.$store.getters.contractAddress;
    }
  },
};
</script>