import Vue from "vue"
import Router from "vue-router"

// 这里导入可以让让用户访问的组件
import Home from '../components/Home'
import Login from '../components/Login'

Vue.use(Router);

export default new Router({
  // 设置路由模式为‘history’，去掉默认的#
  mode: "history",
  routes:[
    // 路由列表
      {
       name:"Home",
       path:"/",
       component:Home,
     },
     {
       name:"Home",
       path:"/home",
       component:Home,
     },
     {
       name:"Login",
       path:"/login",
       component:Login,
     },
  ]
})
