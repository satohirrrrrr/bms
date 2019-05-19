<template>
  <div>
    <!-- 子コンポーネントにプロパティを渡す -->
    <SearchForm :books="books" :loading="loading" :error="error" v-on:search="fetchBooks" />
    <div class="divider"></div>
    <div class="loading" v-if="loading">読み込み中...</div>
    <div v-if="error" class="error">{{ error }}</div>
    <ul class="collection">
      <div v-for="book in books" :key="book.id">
        <li class="collection-item"><router-link v-bind:to="{ name: 'Book', params: { id: book.id }}">{{ book.name }}</router-link></li>
      </div>
    </ul>
  </div>
</template>

<script>
  import SearchForm from './search_form'
  import axios from 'axios'
  export default {
    name: 'book_list',
    components: { SearchForm },
    data: function() {
      return {
        loading: false,
        books: [], // 初期値の空配列
        error: null,
      }
    },
    // 初期化時にデータを取得
    created: function() {
      this.fetchBooks()
    },
    // $routeの変更をwatchすることでルーティングが変更された時に再度データを取得
    watch: {
      '$route': 'fetchBooks'
    },
    methods: {
      fetchBooks: function(condition) {
        console.log("fetchBooks")
        this.loading = true
        axios.get('/api/books', {
          params: { q: condition }
        }).then((response) => {
          this.books = []
          for(var i = 0; i < response.data.books.length; i++) {
            this.books.push(response.data.books[i])
          }
          this.loading = false
        }, (error) => {
          alert(error)
        })
      },
    }
  }
</script>
