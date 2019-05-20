<template>
  <div>
    <div class="divider"></div>
    <div class="loading" v-if="sharedState.loading">読み込み中...</div>
    <div v-if="sharedState.error" class="error">{{ sharedState.error }}</div>
    <ul class="collection">
      <div v-for="book in sharedState.books" :key="book.id">
        <li class="collection-item"><router-link v-bind:to="{ name: 'BookInfo', params: { id: book.id }}">{{ book.name }}</router-link></li>
      </div>
    </ul>
  </div>
</template>

<script>
  import store from './store'
  export default {
    name: 'book_list',
    data: function() {
      return {
        sharedState: store.state
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
      fetchBooks: function () {
        store.fetchBooks()
      }
    }
  }
</script>
