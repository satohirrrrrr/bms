import Vue from 'vue'
import VueRouter from 'vue-router'
import Page1 from './books/page1.vue'
import Page2 from './books/page2.vue'

const routes = [
  { path: '/', component: Page1 },
  { path: '/page2', component: Page2 }
];
Vue.use(VueRouter)
export default new VueRouter({ routes })