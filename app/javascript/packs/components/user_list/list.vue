<template>
  <div>
    <div class="divider"></div>
    <div class="loading" v-if="sharedState.loading">読み込み中...</div>
    <div v-if="sharedState.error" class="error">{{ sharedState.error }}</div>
    <template>
      <v-data-table
        :headers="sharedState.headers"
      ></v-data-table>
    </template>
  </div>
</template>

<script>
  import store from './store'
  export default {
    name: 'list',
    data: function() {
      return {
        sharedState: store.state
      }
    },
    // 初期化時にデータを取得
    created: function() {
      this.fetchUsers()
    },
    // $routeの変更をwatchすることでルーティングが変更された時に再度データを取得
    watch: {
      '$route': 'fetchUsers'
    },
    methods: {
      fetchUsers: function() {
        store.fetchUsers()
      },
    }
  }
</script>
