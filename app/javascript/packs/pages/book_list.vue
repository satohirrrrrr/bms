<template>
  <div>
    <search-form />
    <list />
  </div>
</template>

<script>
import SearchForm from '../components/book_list/search_form'
import List from '../components/book_list/list'
export default {
  name: 'book_list',
  components: { SearchForm, List },
}
</script>
