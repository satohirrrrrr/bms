<template>
  <div>
    <div v-if="this.isPathBookRef()">
      <book-info />
    </div>
    <div v-if="this.isPathBookForm()">
      <book-form />
    </div>
  </div>
</template>

<script>
import BookInfo from '../components/book/info'
import BookForm from '../components/book/form'
export default {
  name: 'book',
  components: { BookInfo, BookForm },
  methods: {
    isPathBookRef: function () {
      return this.$route.name == 'BookRef'
    },
    isPathBookForm: function () {
      return this.$route.name == 'BookForm'
    },
  }
}
</script>
