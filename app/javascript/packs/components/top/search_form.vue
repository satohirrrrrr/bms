<template>
  <form>
    <div class="row">
      <div class="col s5">
        <input v-model="searchKeywords" v-on:keyup="$emit('search', searchKeywords)" class="form-control" placeholder="search by any keywords...">
      </div>
      <div class="col s2">
        <button type="submit" v-on:click="$emit('search', searchKeywords)" class="btn-floating waves-effect waves-light">
          <i class="material-icons">search</i>
        </button>
      </div>
      <div class="col s5">
        <i class="material-icons right">view_module</i>
        <i class="material-icons right">view_list</i>
        <i class="material-icons right icon-active">view_headline</i>
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

<style>
  .material-icons {
    font-size: 30px;
  }

  .icon-active {
    color: #A19600;
    font-size: 45px;
  }
</style>