<template>
  <div id="app">
    <navbar />
    <div class="section container">
      <router-view />
    </div>
  </div>
</template>

<script>
  import Header from './packs/components/header'
  export default {
    components: {
      'navbar': Header,
    }
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