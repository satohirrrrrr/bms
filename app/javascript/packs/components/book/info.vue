<template>
  <div>
    <div class="loading" v-if="sharedState.loading">読み込み中...</div>
    <div v-if="sharedState.error" class="error">{{ sharedState.error }}</div>
    <router-link class="btn-floating btn-large waves-effect waves-light red right" v-bind:to="{ name: 'BookForm', params: { id: sharedState.book.id } }">
      <i class="material-icons left">edit</i>
    </router-link>
    <div class="row">
      <div class="col s3">
        <img v-bind:src="sharedState.thumbnail">
      </div>
      <div class="col s9">
        <div class="row"><span class="float-text title">{{ sharedState.book.name }}</span></div>
        <div class="row"><span class="">{{ sharedState.book.publisher }} {{ dateFormat(sharedState.book.publicated_on) }}</span></div>
      </div>
    </div>
    <ul class="collection with-header">
      <li class="collection-item">isbn_10: {{ sharedState.book.isbn_10 }}</li>
      <li class="collection-item">isbn_13: {{ sharedState.book.isbn_13 }}</li>
      <li class="collection-item">publicated_on: {{ sharedState.book.publicated_on }}</li>
      <li class="collection-item">publisher: {{ sharedState.book.publisher }}</li>
      <li class="collection-item">page_size: {{ sharedState.book.page_size }}</li>
      <li class="collection-item">storage_location: {{ sharedState.book.storage_loaction }}</li>
      <li class="collection-item">control_number: {{ sharedState.book.control_number }}</li>
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
      dateFormat: function (yyyymmdd) {
        const formatted = `${yyyymmdd.substring(0, 4)}/${yyyymmdd.substring(4, 6)}`
        return formatted
      }
    }
  }
</script>

<style>
  .title {
    font-size: 25px !important;
  }
</style>