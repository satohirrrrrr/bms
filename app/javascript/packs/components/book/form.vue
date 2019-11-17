<template>
  <div>
    <!-- name -->
    <div class="row">
      <div class="col s3">
        <span>name</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="name" name="book.name" v-model="sharedState.book.name" placeholder="name">
      </div>
    </div>
    <!-- subtitle -->
    <div class="row">
      <div class="col s3">
        <span>subtitle</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="subtitle" name="book.subtitle" v-model="sharedState.book.subtitle" placeholder="subtitle">
      </div>
    </div>
    <!-- isbn10 -->
    <div class="row">
      <div class="col s3">
        <span>isbn10</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="isbn10" name="book.isbn10" value="" placeholder="isbn10">
      </div>
    </div>
    <!-- isbn13 -->
    <div class="row">
      <div class="col s3">
        <span>isbn13</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="isbn13" name="book.isbn13" value="" placeholder="isbn13">
      </div>
    </div>
    <!-- asin -->
    <div class="row">
      <div class="col s3">
        <span>asin</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="asin" name="book.asin" value="" placeholder="asin">
      </div>
    </div>
    <!-- publicated_on -->
    <div class="row">
      <div class="col s3">
        <span>publicated_on</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="publicated_on" name="book.publicated_on" value="" placeholder="publicated_on">
      </div>
    </div>
    <!-- publisher -->
    <div class="row">
      <div class="col s3">
        <span>publisher</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="publisher" name="book.publisher" value="" placeholder="publisher">
      </div>
    </div>
    <!-- page_size -->
    <div class="row">
      <div class="col s3">
        <span>page_size</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="page_size" name="book.page_size" value="" placeholder="page_size">
      </div>
    </div>
    <!-- storage_loaction -->
    <div class="row">
      <div class="col s3">
        <span>storage_loaction</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="storage_loaction" name="book.storage_loaction" value="" placeholder="storage_loaction">
      </div>
    </div>
    <!-- control_number -->
    <div class="row">
      <div class="col s3">
        <span>control_number</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="control_number" name="book.control_number" value="" placeholder="control_number">
      </div>
    </div>
    <!-- amazon_url -->
    <div class="row">
      <div class="col s3">
        <span>amazon_url</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="amazon_url" name="book.amazon_url" value="" placeholder="amazon_url">
      </div>
    </div>
    <!-- image_url -->
    <div class="row">
      <div class="col s3">
        <span>image_url</span>
      </div>
    </div>
    <div class="row">
      <div class="col s9">
        <input id="image_url" name="book.image_url" value="" placeholder="image_url">
      </div>
    </div>
  </div>
</template>

<script>
  import store from './store'
  export default {
    name: 'form',
    data: function() {
      return {
        sharedState: store.state
      }
    },
    created: function() {
      this.fetchBookInfo()
    },
    watch: {
      '$route': 'registerBook'
    },
    methods: {
      fetchBookInfo: function() {
        store.fetchBookInfo(this.$route.params.id)
      },
      registerBook: function() {
        store.registerBook()
      },
    }
  }
</script>
