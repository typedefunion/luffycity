import Vue from 'vue'

import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
  // 数据仓库,类似vue里面的data
  state: {
    total: 0,
  },
  // 数据操作方法,类似vue里面的methods
  mutations: {
    get_total(state, data){
      // 提取更改购物车的总数
      state.total = data;
    }

  }
});
