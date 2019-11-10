import Vue from 'vue'
import VueRouter from 'vue-router'
import TopPage from './pages/top.vue'
import BookListPage from './pages/book_list.vue'
import BookPage from './pages/book.vue'
import UserListPage from './pages/user_list.vue'

const routes = [
  { path: '/',               name: 'Top',      component: TopPage },
  { path: '/books',          name: 'BookList', component: BookListPage },
  { path: '/books/edit/:id', name: 'BookForm', component: BookPage },
  { path: '/books/new',      name: 'BookForm', component: BookPage },
  { path: '/books/:id',      name: 'BookRef',  component: BookPage },
  { path: '/users',          name: 'UserList', component: UserListPage },
  // { path: '/users/edit/:id', name: 'UserForm', component: UserPage },
  // { path: '/users/new',      name: 'UserForm', component: UserPage },
];
Vue.use(VueRouter)
export default new VueRouter({ routes })