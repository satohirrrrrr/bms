<template>
  <div>
    <div class="loading" v-if="sharedState.loading">読み込み中...</div>
    <div v-if="sharedState.error" class="error">{{ sharedState.error }}</div>
    <ul class="collection with-header">
      <li class="collection-header"><img v-bind:src="sharedState.thumbnail"></li>
      <li class="collection-item">id: {{ sharedState.book.id }}</li>
      <li class="collection-item">name: {{ sharedState.book.name }}</li>
      <li class="collection-item">isbn_10: {{ sharedState.book.isbn_10 }}</li>
      <li class="collection-item">isbn_13: {{ sharedState.book.isbn_13 }}</li>
      <li class="collection-item">asin: {{ sharedState.book.asin }}</li>
      <li class="collection-item">publicated_on: {{ sharedState.book.publicated_on }}</li>
      <li class="collection-item">publisher: {{ sharedState.book.publisher }}</li>
      <li class="collection-item">page_size: {{ sharedState.book.page_size }}</li>
      <li class="collection-item">storage_location: {{ sharedState.book.storage_loaction }}</li>
      <li class="collection-item">control_number: {{ sharedState.book.control_number }}</li>
      <li class="collection-item">amazon_url: {{ sharedState.book.amazon_url }}</li>
      <li class="collection-item">image_url: {{ sharedState.book.image_url }}</li>
      <li class="collection-item">image_data: {{ sharedState.book.image_data }}</li>
    </ul>
  </div>
</template>

<script>
  import 'no_image.png'
  import store from './store'
  export default {
    name: 'info',
    data: function() {
      return {
        sharedState: store.state
      }
    },
    created: function() {
      this.fetchBookInfo()
    },
    watch: {
      '$route': 'fetchBookInfo'
    },
    methods: {
      fetchBookInfo: function () {
        store.fetchBookInfo(this.$route.params.id)
      },
    }
  }
</script>
