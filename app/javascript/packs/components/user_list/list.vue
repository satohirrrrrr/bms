<template>
  <div>
    <div class="divider"></div>
    <table id="striped">
      <thead>
        <tr>
          <th>id</th>
          <th>first_name</th>
          <th>last_name</th>
          <th>email</th>
          <th>last_login_at</th>
          <th>last_logout_at</th>
          <th>last_activity_at</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in sharedState.users" :key="user.id">
          <td class="float-text">{{ user.id }}</td>
          <td class="float-text">{{ user.first_name }}</td>
          <td class="float-text">{{ user.last_name }}</td>
          <td class="float-text">{{ user.email }}</td>
          <td class="float-text">{{ user.last_login_at }}</td>
          <td class="float-text">{{ user.last_logout_at }}</td>
          <td class="float-text">{{ user.last_activity_at }}</td>
          <td>
            <i data-target="editUserModal" class="material-icons mode-btn small icon-gray modal-trigger" v-on:click="fetchUser(user.id)">edit</i>
            <i class="material-icons mode-btn small icon-gray" v-on:click="deleteUser(user.id)">delete_forever</i>
          </td>
        </tr>
      </tbody>
    </table>
    <edit-user-modal @close="closeEditUserModal"/>
  </div>
</template>

<script>
  import store from './store'
  import EditUserModal from './edit_user_modal'
  export default {
    name: 'list',
    components: { EditUserModal },
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
      fetchUser: function(userId) {
        store.fetchUser(userId)
      },
      closeEditUserModal: function() {
        store.closeEditUserModal()
      },
      deleteUser: function(userId) {
        if(window.confirm('削除しますか？')) {
          store.deleteUser(userId)
        }
      },
    }
  }
</script>

<style>
  i.icon-red {
    color: red;
  }
  i.icon-gray {
    color: gray;
  }
</style>
