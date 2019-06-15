<template>
  <div>
    <div class="divider"></div>
    <div class="loading" v-if="sharedState.loading">読み込み中...</div>
    <div v-if="sharedState.error" class="error">{{ sharedState.error }}</div>
    <ul v-if="isHeadlineMode()" class="collection">
      <div v-for="book in sharedState.books" :key="book.id">
        <li class="collection-item"><router-link v-bind:to="{ name: 'BookRef', params: { id: book.id } }">{{ book.name }}</router-link></li>
      </div>
    </ul>
    <div v-if="isListMode()">
      <div v-for="book in sharedState.books" :key="book.id">
        <div class="row">
          <div class="col s4">
            <img :src="require('no_image.png')">
          </div>
          <div class="col s8">
            <router-link v-bind:to="{ name: 'BookRef', params: { id: book.id } }">
              <span class="float-text title">{{ book.name }}</span>
            </router-link>
          </div>
        </div>
      </div>
    </div>
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
      },
      isHeadlineMode: function () {
        return store.isHeadlineMode()
      },
      isListMode: function () {
        return store.isListMode()
      }
    }
  }
</script>

<style>
  .title {
    font-size: 25px !important;
  }
</style>