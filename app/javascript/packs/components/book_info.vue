<template>
  <div>
    <div class="loading" v-if="loading">読み込み中...</div>
    <div v-if="error" class="error">{{ error }}</div>
    <ul class="collection with-header">
      <li class="collection-header"><h4>book info</h4></li>
      <li class="collection-item">id: {{ book.id }}</li>
      <li class="collection-item">name: {{ book.name }}</li>
      <li class="collection-item">isbn_10: {{ book.isbn_10 }}</li>
      <li class="collection-item">isbn_13: {{ book.isbn_13 }}</li>
      <li class="collection-item">asin: {{ book.asin }}</li>
      <li class="collection-item">publicated_on: {{ book.publicated_on }}</li>
      <li class="collection-item">publisher: {{ book.publisher }}</li>
      <li class="collection-item">page_size: {{ book.page_size }}</li>
      <li class="collection-item">storage_location: {{ book.storage_loaction }}</li>
      <li class="collection-item">control_number: {{ book.control_number }}</li>
      <li class="collection-item">amazon_url: {{ book.amazon_url }}</li>
      <li class="collection-item">image_url: {{ book.image_url }}</li>
      <li class="collection-item">image_data: {{ book.image_data }}</li>
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
        book: {}, 
        error: null,
      }
    },
    // 初期化時にデータを取得
    created: function() {
      this.fetchBookInfo()
    },
    // $routeの変更をwatchすることでルーティングが変更された時に再度データを取得
    watch: {
      '$route': 'fetchBookInfo'
    },
    methods: {
      fetchBookInfo: function() {
        this.loading = true
        axios.get(`/api/books/${this.$route.params.id}`).then((response) => {
          this.book = response.data.book
          this.loading = false
        }, (error) => {
          alert(error)
        })
      },
    }
  }
</script>
