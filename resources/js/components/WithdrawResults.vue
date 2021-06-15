<template>
  <div>
    <WithdrawList v-if="filteredRequests.length">
      <WithdrawItem
        v-for="(withdrawRequest, index) in filteredRequests"
        :key="index"
        :withdrawRequest="withdrawRequest"
      />
    </WithdrawList>
    <div v-else>No pending transactions</div>
  </div>
</template>

<script>
import WithdrawList from './Withdraw/WithdrawList'
import WithdrawItem from './Withdraw/WithdrawItem'

export default {
  components:{
      WithdrawList,
      WithdrawItem
  },
  computed: {
    withdrawRequests() {
      return [
        {
            date:123,
            user:'User1',
            metamaskAddress:'0xc87F7b9f13699E743DF8530515F978327ed0CFc9',
            amount: 0.0001
        },
        {
            date:234,
            user:'User2',
            metamaskAddress:'0xc87F7b9f13699E743DF8530515F978327ed0CFc9',
            amount: 0.0002
        }
      ]
    },
    filteredRequests() {
      return this.withdrawRequests;//this.orderBy(this.withdrawRequests.date);
    },
  },
  methods: {
    orderBy: function(sorKey) {
        this.sortKey = sorKey
        this.sortSettings[sorKey] = !this.sortSettings[sorKey]
        this.desc = this.sortSettings[sorKey]
    }
  },
}
</script>