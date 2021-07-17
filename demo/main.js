import Vue from 'vue'
import App from './App.vue'

import "@popperjs/core"
import "bootstrap/dist/js/bootstrap"
import "bootstrap/dist/css/bootstrap.css"
import "bootstrap-icons/bootstrap-icons.svg"

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
