<template>
  <div>
    <ul v-if="isHeadlineMode()" class="collection">
      <div v-for="book in sharedState.books" :key="book.id">
        <li class="collection-item">
          <span v-if="book.is_sync_gba">sync </span>
          <router-link v-bind:to="{ name: 'BookRef', params: { id: book.id } }">{{ book.name }}</router-link></li>
      </div>
    </ul>
    <div v-if="isListMode()">
      <div v-for="book in sharedState.books" :key="book.id">
        <div class="row">
          <div class="col s3">
            <div v-if="hasImage(book)">
              <router-link v-bind:to="{ name: 'BookRef', params: { id: book.id } }">
                <img :src="book.image_url">
              </router-link>
            </div>
            <div v-else>
              <router-link v-bind:to="{ name: 'BookRef', params: { id: book.id } }">
                <img :src="require('no_image.png')">
              </router-link>
            </div>
          </div>
          <div class="col s9">
            <router-link v-bind:to="{ name: 'BookRef', params: { id: book.id } }">
              <span class="float-text title">{{ book.name }}</span>
              <span class="float-text subtitle">{{ book.subtitle }}</span>
            </router-link>
              <br><br><span class="float-text description">{{ book.description }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import store from './store'
  export default {
    name: 'list',
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
      fetchBooks: function() {
        store.fetchBooks()
      },
      isHeadlineMode: function() {
        return store.isHeadlineMode()
      },
      isListMode: function() {
        return store.isListMode()
      },
      hasImage: function(book) {
        return book.image_url != null
      }
    }
  }
</script>

<style>
  .title {
    font-size: 25px !important;
  }
  .subtitle {
    font-size: 15px !important;
  }
</style>