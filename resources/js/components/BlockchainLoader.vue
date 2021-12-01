<template>
  <div id="blockchain-loader">
      <p>This window will close automatically</p>
      <p>Please do NOT close this window!</p>
      <hr>
      <p>Aceasta fereastra se va inchide automat</p>
      <p>Va rugam sa NU inchideti aceasta fereastra!</p>
      <div style="display: block; margin: 0 auto;"><scale-loader/></div>
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