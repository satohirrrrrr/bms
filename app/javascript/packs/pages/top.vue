<template>
  <div>
    <!-- 子コンポーネントにプロパティを渡す -->
    <search-form />
    <book-list />
  </div>
</template>

<script>
import SearchForm from '../components/top/search_form'
import BookList from '../components/top/book_list'
export default {
  name: 'top',
  components: { SearchForm, BookList },
}
</script>
