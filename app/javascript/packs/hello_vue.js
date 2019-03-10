import Vue from 'vue/dist/vue.esm'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ja'
import 'element-ui/lib/theme-chalk/index.css'
import App from '../app.vue'
import axios from 'axios'

Vue.use(ElementUI, { locale })
Vue.config.productionTip = false

const app = new Vue({
  el: '#hotel-search',
  data:function(){
    return {
      selected_pref : "",
      pref:  [{"no":"1","name":"\u5317\u6d77\u9053"},{"no":"2","name":"\u9752\u68ee\u770c"},{"no":"3","name":"\u5ca9\u624b\u770c"},{"no":"4","name":"\u5bae\u57ce\u770c"},{"no":"5","name":"\u79cb\u7530\u770c"},{"no":"6","name":"\u5c71\u5f62\u770c"},{"no":"7","name":"\u798f\u5cf6\u770c"},{"no":"8","name":"\u8328\u57ce\u770c"},{"no":"9","name":"\u6803\u6728\u770c"},{"no":"10","name":"\u7fa4\u99ac\u770c"},{"no":"11","name":"\u57fc\u7389\u770c"},{"no":"12","name":"\u5343\u8449\u770c"},{"no":"13","name":"\u6771\u4eac\u90fd"},{"no":"14","name":"\u795e\u5948\u5ddd\u770c"},{"no":"15","name":"\u65b0\u6f5f\u770c"},{"no":"16","name":"\u5bcc\u5c71\u770c"},{"no":"17","name":"\u77f3\u5ddd\u770c"},{"no":"18","name":"\u798f\u4e95\u770c"},{"no":"19","name":"\u5c71\u68a8\u770c"},{"no":"20","name":"\u9577\u91ce\u770c"},{"no":"21","name":"\u5c90\u961c\u770c"},{"no":"22","name":"\u9759\u5ca1\u770c"},{"no":"23","name":"\u611b\u77e5\u770c"},{"no":"24","name":"\u4e09\u91cd\u770c"},{"no":"25","name":"\u6ecb\u8cc0\u770c"},{"no":"26","name":"\u4eac\u90fd\u5e9c"},{"no":"27","name":"\u5927\u962a\u5e9c"},{"no":"28","name":"\u5175\u5eab\u770c"},{"no":"29","name":"\u5948\u826f\u770c"},{"no":"30","name":"\u548c\u6b4c\u5c71\u770c"},{"no":"31","name":"\u9ce5\u53d6\u770c"},{"no":"32","name":"\u5cf6\u6839\u770c"},{"no":"33","name":"\u5ca1\u5c71\u770c"},{"no":"34","name":"\u5e83\u5cf6\u770c"},{"no":"35","name":"\u5c71\u53e3\u770c"},{"no":"36","name":"\u5fb3\u5cf6\u770c"},{"no":"37","name":"\u9999\u5ddd\u770c"},{"no":"38","name":"\u611b\u5a9b\u770c"},{"no":"39","name":"\u9ad8\u77e5\u770c"},{"no":"40","name":"\u798f\u5ca1\u770c"},{"no":"41","name":"\u4f50\u8cc0\u770c"},{"no":"42","name":"\u9577\u5d0e\u770c"},{"no":"43","name":"\u718a\u672c\u770c"},{"no":"44","name":"\u5927\u5206\u770c"},{"no":"45","name":"\u5bae\u5d0e\u770c"},{"no":"46","name":"\u9e7f\u5150\u5cf6\u770c"},{"no":"47","name":"\u6c96\u7e04\u770c"}],
      searchFormData: {
        placeName: '',
        checkInDate: '',
        checkOutDate: ''
      }
    }
  },
  computed: {
      getPref: {
          get: function () {
              var self = this;
              return self.pref.filter(function (item) {
                  return item;
              });
          },
          set: function (v) {
              this.pref = pref[v];
          }
      }
  },
  methods: {
    search_hotels: function(){
        axios.create({
          baseURL: 'https://app.rakuten.co.jp/services/api',
          timeout: 3000,
          method: 'GET',
          responseType: 'json', // レスポンスはjsonオブジェクト固定
          params: params
        })
        .then(response => response.data)
    }
  }

})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
