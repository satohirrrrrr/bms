<template>
  <div id="app">
    <navbar />
    <div class="section container">
      <div v-if="sharedState.error" class="error">{{ sharedState.error }}</div>
      <div class="loading" v-if="sharedState.loading">読み込み中...</div>
      <router-view />
    </div>
  </div>
</template>

<script>
  import Header from './packs/components/header'
  import store from 'packs/common_store'
  export default {
    components: {
      'navbar': Header,
    },
    data: function() {
      return {
        sharedState: store.state
      }
    },
  }
</script>

<style>
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
  }
</style>