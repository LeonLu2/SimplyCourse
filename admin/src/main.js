import Vue from 'vue'
import App from './app.vue'
import router from './router'
import axios from 'axios'
import filter from './filter/filter'

Vue.config.productionTip = false;
Vue.prototype.$ajax = axios;

// solve each ajax request have a different sessionId
axios.defaults.withCredentials = true;

/**
 * axios interceptor
 */
axios.interceptors.request.use(function (config) {
  console.log("request：", config);
  let token = Tool.getLoginUser().token;
  if (Tool.isNotEmpty(token)) {
    config.headers.token = token;
    console.log("request for headers to add token:", token);
  }
  return config;
}, error => {});
axios.interceptors.response.use(function (response) {
  console.log("return result：", response);
  return response;
}, error => {
  console.log("return interception：", error.response);
  let response = error.response;
  const status = response.status;
  if (status === 401) {
    // if status code is 401, jump to login
    console.log("have not login yet, jump to login: ");
    Tool.setLoginUser(null);
    router.push('/login');
  }
  return {
    data: {
      success: false,
      message: "please relogin"
    }
  };
});
// global filter
Object.keys(filter).forEach(key => {
  Vue.filter(key, filter[key])
});

// router login interception
router.beforeEach((to, from, next) => {
  // whether do interception on meta.loginRequire
  if (to.matched.some(function (item) {
    return item.meta.loginRequire
  })) {
    let loginUser = Tool.getLoginUser();
    if (Tool.isEmpty(loginUser)) {
      next('/login');
    } else {
      next();
    }
  } else {
    next();
  }
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')

console.log("环境：", process.env.NODE_ENV);