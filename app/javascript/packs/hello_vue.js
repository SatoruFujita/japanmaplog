import Vue from 'vue/dist/vue.esm'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/ja'
import 'element-ui/lib/theme-chalk/index.css'
import App from '../app.vue'
import axios from 'axios'
import HotelList from './components/hotelList.vue'

Vue.use(ElementUI, { locale })
Vue.config.productionTip = false

document.addEventListener('DOMContentLoaded', () => {
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
      },
      vacantHotelData:[]
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
  created: function(){
    this.search()
  },
  //楽天トラベルAPI呼び出しパラメータを分離して撮るようにする
  methods:{

     search(){
       require('dotenv').config();


        axios.get(`https://app.rakuten.co.jp/services/api/Travel/VacantHotelSearch/20170426
          ?applicationId=1011661123368946334&format=xml
&checkinDate=2019-03-15
&checkoutDate=2019-03-16
&latitude=128440.51
&longitude=503172.21
&searchRadius=1`
)
        .then((response) => {
          console.log(response);
          console.log(process.env.VUE_APP_GOOGLE_MAP_API_KEY);
          this.vacantHotelData = response.data.vacantHotelData;
        })
      }
    },
    components:{
      HotelList
    }
  })
})
