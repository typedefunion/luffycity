import Vue from "vue"
import Router from "vue-router"

// 这里导入可以让让用户访问的组件
import Home from '../components/Home'
import Login from '../components/Login'
import Register from "../components/Register"
import Course from "../components/Course";
import Detail from "../components/Detail";
import Cart from "../components/Cart";
import Order from "../components/Order";
import Success from "../components/Success";

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
     {
       name:"Register",
       path:"/register",
       component:Register,
     },
     {
       name:"Course",
       path:"/course",
       component:Course,
     },
     {
       name:"Detail",
       path:"/course/:course",
       component:Detail,
     },
     {
       name:"Cart",
       path:"/cart",
       component:Cart,
     },
     {
       name:"Order",
       path:"/order",
       component:Order,
     },
     {
       name:"Success",
       path:"/pay/result",
       component:Success,
     },
  ]
})
