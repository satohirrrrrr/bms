import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from './pages/index.vue'
import Book from './pages/book.vue'

const routes = [
  { path: '/', name: 'Index', component: Index },
  { path: '/books/:id', name: 'Book', component: Book },
];
Vue.use(VueRouter)
export default new VueRouter({ routes })