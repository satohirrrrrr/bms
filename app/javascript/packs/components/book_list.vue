<template>
  <div>
    <div class="loading" v-if="loading">読み込み中...</div>
    <div v-if="error" class="error">{{ error }}</div>
    <!-- booksがロードされたら各Book名を表示する -->
    <div class="row">
      <div class="col s8">
        <input v-model="searchKeywords" class="form-control" placeholder="search by any keywords...">
      </div>
      <div class="col s4">
        <div v-on:click="fetchBooks" class="btn-floating waves-effect waves-light">
          <i class="material-icons">search</i>
        </div>
      </div>
    </div>
    <div class="divider"></div>
    <ul class="collection">
      <div v-for="book in books" :key="book.id">
        <li class="collection-item"><router-link v-bind:to="{ name: 'Book', params: { id: book.id }}">{{ book.name }}</router-link></li>
      </div>
    </ul>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
    name: 'book_list',
    data: function() {
      return {
        loading: false,
        books: [], // 初期値の空配列
        error: null,
        searchKeywords: ""
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
      fetchBooks: function() {
        console.log("fetchBooks")
        this.loading = true
        axios.get('/api/books', {
          params: { q: this.searchKeywords }
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
