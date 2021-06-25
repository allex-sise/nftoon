<template>
  <div>
    <vue-metamask @onComplete="onComplete" />
    <p>{{withdrawRequest.user}}</p>
    <p>{{withdrawRequest.amount}}</p>
    <p>{{withdrawRequest.metamaskAddress}}</p>
    <p>{{withdrawRequest.date}}</p>
    <button @click="(onTransferCredit())">Transfer</button>
  </div>
</template>

<script>
import VueMetamask from 'vue-metamask';
import {createAlchemyWeb3} from "@alch/alchemy-web3";
import contract from "../../assets/Master.json"

export default {
  components: {
    VueMetamask,
  },
  data(){
    return {
      contractAddress: null,
      userData: null,
      alchWeb3: null,
      decentralizedContract: null,
    }
  },
  props: {
    withdrawRequest: {
      type: Object,
      required: true,
    },
  },
  async mounted(){
    this.contractAddress = process.env.MIX_PUSHER_MASTER_CONTRACT;
    await this.loadBlockchainData();
  },
  methods:{
    onComplete(responseData){
      this.userData = responseData;
    },
    async loadBlockchainData(){
      const API_KEY ="https://eth-ropsten.alchemyapi.io/v2/X3ZvuZL6NkgWOL2Rws8iN7-GO_8qTNSC";
      this.alchWeb3 = createAlchemyWeb3(API_KEY);
      this.decentralizedContract = new this.alchWeb3.eth.Contract(
          contract.abi,
          this.contractAddress
      );
    },
    onTransferCredit(){
      this.transferCredit();
    },
    async transferCredit(){
      let valueEth = this.alchWeb3.utils.toWei(String(this.withdrawRequest.amount), 'ether');
      await this.decentralizedContract.methods
        .transfer(this.withdrawRequest.metamaskAddress)
        .send({
          from: this.userData.metaMaskAddress,
          value: valueEth
        })
        .on('transactionHash')
    }
  }
}
</script>