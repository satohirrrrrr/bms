<template>
  <form>
    <div class="row">
      <div class="col s5">
        <input v-model="sharedState.condition" v-on:change="fetchBooks" class="form-control" placeholder="search by any keywords...">
      </div>
      <div class="col s2">
        <button type="submit" v-on:click="fetchBooks" class="btn-floating waves-effect waves-light">
          <i class="material-icons">search</i>
        </button>
      </div>
      <div class="col s5">
        <i id="modeBtnList" class="mode-btn material-icons right" v-on:click="setMode('list')">view_list</i>
        <i id="modeBtnHeadline" class="mode-btn material-icons right icon-active" v-on:click="setMode('headline')">view_headline</i>
      </div>
    </div>
  </form>
</template>

<script>
  import store from './store'
  export default {
    name: 'search_form',
    data: function() {
      return {
        sharedState: store.state
      }
    },
    created: function() {
      store.setMode('headline')
    },
    watch: {
      'sharedState.mode': 'fetchBooks',
    },
    methods: {
      fetchBooks: function () {
        store.fetchBooks()
      },
      setMode: function(mode) {
        store.setMode(mode)
        store.reflectModeClass()
      },
    },
  }
</script>

<style>
  .material-icons {
    font-size: 30px;
  }

  .icon-active {
    color: #A19600;
    font-size: 40px;
  }

  .mode-btn {
    cursor: pointer;
  }
</style>