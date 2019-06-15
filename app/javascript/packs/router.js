import Vue from 'vue'
import VueRouter from 'vue-router'
import TopPage from './pages/top.vue'
import BookPage from './pages/book.vue'

const routes = [
  { path: '/',               name: 'Top',      component: TopPage  },
  { path: '/books/edit/:id', name: 'BookForm', component: BookPage },
  { path: '/books/new',      name: 'BookForm', component: BookPage }, // /books/:idを先に書くと、{ id: 'register' }にマッチしてしまう
  { path: '/books/:id',      name: 'BookRef',  component: BookPage },
];
Vue.use(VueRouter)
export default new VueRouter({ routes })