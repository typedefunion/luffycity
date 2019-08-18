// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'

// 引入路由
import router from './routers/index'
// 引入vuex，共享数据
import store from './store/index'

//自定义配置，url统一从后端过来
import settings from './settings'
Vue.prototype.$settings = settings;

// 引入elementui
import Element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(Element);

// 内置axios到vue中
import axios from 'axios'; // 从node_modules目录中导入包
// 允许ajax发送请求时附带cookie
axios.defaults.withCredentials = false;
Vue.prototype.$axios = axios; // 把对象挂载vue中

// 注册加载vue-vidio视频播放插件
require('video.js/dist/video-js.css');
require('vue-video-player/src/custom-theme.css');
import VideoPlayer from 'vue-video-player'
Vue.use(VideoPlayer);


Vue.config.productionTip = false;

// 导入极验验证码的js文件
import '../static/js/gt.js'

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
});
