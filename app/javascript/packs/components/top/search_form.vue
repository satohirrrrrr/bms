<template>
  <form>
    <div class="row">
      <div class="col s5">
        <input v-model="sharedState.condition" v-on:change="fetchBooks" class="form-control" placeholder="search by any keywords...">
      </div>
      <div class="col s1">
        <button type="submit" v-on:click="fetchBooks" class="btn-floating waves-effect waves-light">
          <i class="material-icons">search</i>
        </button>
      </div>
      <div class="col s1">
        <button type="submit" v-on:click="syncGoogle" class="btn waves-effect waves-light sync-btn">
          <i class="material-icons">sync</i><span class="vertical-center">Google</span>
        </button>
      </div>
      <div class="col s5">
        <i id="modeBtnList" class="mode-btn material-icons right" v-on:click="setMode('list')">view_list</i>
        <i id="modeBtnHeadline" class="mode-btn material-icons right" v-on:click="setMode('headline')">view_headline</i>
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
    beforeCreate: function() {
        store.setMode('list')
    },
    mounted: function() {
        store.reflectModeClass()
    },
    watch: {
      'sharedState.mode': 'fetchBooks',
    },
    methods: {
      fetchBooks: function() {
        store.fetchBooks()
      },
      setMode: function(mode) {
        store.setMode(mode)
        store.reflectModeClass()
      },
      syncGoogle: function() {
        store.syncGoogle()
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

  .sync-btn {
    width: 120px;
  }

  .vertical-center {
    vertical-align: top;
    margin-left: 5px;
  }
</style>