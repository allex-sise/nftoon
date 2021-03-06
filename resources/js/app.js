/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('metamask-intro', require('./components/MetamaskIntro.vue').default);
Vue.component('withdraw', require('./components/Withdraw/Withdraw.vue').default);
Vue.component('withdraw-admin', require('./components/Withdraw/WithdrawAdmin.vue').default);
Vue.component('deposit', require('./components/Deposit.vue').default);
Vue.component('blockchain-loader', require('./components/BlockchainLoader.vue').default);
Vue.component('toggle-theme-color', require('./components/ToggleThemeColor.vue').default);
Vue.component('mint-nft', require('./components/MintNft.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// const app = new Vue({
//     el: '#app',
// });

import store from './store'
import { VueSpinners } from '@saeris/vue-spinners'

Vue.use(VueSpinners)

new Vue({
    el: '#app',
    store
});

new Vue({
    el: '#appHeader',
    store
})


// import App from './App.vue'
// import store from './store'
// const app = new Vue({
//     store,
//     render: h => h(App)
//   }).$mount('#app')
