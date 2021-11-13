<template>
  <div id="withdraw">
      <input v-if="account" name="email" :value="account">
  </div>
</template>

<script>
export default {
  async mounted() {
    await this.$store.dispatch("connect");
  },
  computed: {
    account() {
      return this.$store.getters.account;
    },
  },
};
</script>