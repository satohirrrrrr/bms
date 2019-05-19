<template>
  <form>
    <div class="row">
      <div class="col s8">
        <input v-model="searchKeywords" v-on:keyup="$emit('search', searchKeywords)" class="form-control" placeholder="search by any keywords...">
      </div>
      <div class="col s4">
        <button type="submit" v-on:click="$emit('search', searchKeywords)" class="btn-floating waves-effect waves-light">
          <i class="material-icons">search</i>
        </button>
      </div>
    </div>
  </form>
</template>

<script>
  export default {
    name: 'search_form',
    data: function() {
      return {
        searchKeywords: ""
      }
    }
  }
</script>
