<template>
  <div class="boxPosition" id="blockchain-loader">
      <p>This window will close automatically</p>
      <p>Please do NOT close this window!</p>
      <hr>
      <p>Aceasta fereastra se va inchide automat</p>
      <p>Va rugam sa NU inchideti aceasta fereastra!</p>
      <div style="display: block; margin: 0 auto;"><scale-loader color="#ffffff"/></div>
  </div>
</template>

<script>
import { ScaleLoader } from '@saeris/vue-spinners'

export default {
  components:{
    ScaleLoader,
  },
}
</script>

<style scoped>
.boxPosition {
  position: absolute;
  z-index: 999999999;
  text-align: center;
  top: 0px;
  height:100%;
  width: 100%;
  right: 0px;
  background: #21273E;
  color: #FFF!important;
}
</style>
