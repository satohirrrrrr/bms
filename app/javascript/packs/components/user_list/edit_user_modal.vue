<template>
  <div id="editUserModal" class="modal">
    <div class="modal-content">
      ユーザ情報変更
      <div class="row">
        <div class="input-field col s6">
          <input v-model="sharedState.editUserModalForm.lastName" placeholder="" id="first_name" type="text">
          <label class="active" for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input v-model="sharedState.editUserModalForm.firstName" placeholder="" id="last_name" type="text">
          <label class="active" for="last_name">Last Name</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input v-model="sharedState.editUserModalForm.email" placeholder="" id="email" type="email">
          <label class="active" for="email">email</label>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn-small grey" @click="$emit('close')">Cancel</button>
        <button class="btn-small" @click="updateUser">OK</button>
      </div>
    </div>
  </div>
</template>

<script>
  import store from './store'
  export default {
    name: 'edit_user_modal',
    data: function() {
      return {
        sharedState: store.state,
      }
    },
    methods: {
      updateUser: function() {
        store.updateUser()
      }
    },
    mounted: function() {
      $('.modal').modal()
    },
  }
</script>
