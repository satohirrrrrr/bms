import Vue from 'vue'
import VueRouter from 'vue-router'
import Top from './pages/top.vue'
import BookInfo from './pages/book_info.vue'

const routes = [
  { path: '/', name: 'Top', component: Top },
  { path: '/books/:id', name: 'BookInfo', component: BookInfo },
];
Vue.use(VueRouter)
export default new VueRouter({ routes })