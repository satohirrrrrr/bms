<template>
  <div>
    <div v-if="this.isPathUserList()">
      <book-info />
    </div>
    <div v-if="this.isPathUserCreate()">
      <book-form />
    </div>
    <div v-if="this.isPathUserEdit()">
      <book-form />
    </div>
  </div>
</template>

<script>
import UserList from '../components/user/list'
import UserForm from '../components/user/form'
export default {
  name: 'user',
  components: { UserList, UserForm },
  methods: {
    isPathUserList: function() {
      return this.$route.name == 'UserList'
    },
    isPathUserCreate: function() {
      return this.$route.name == 'UserCreate'
    },
    isPathUserEdit: function() {
      return this.$route.name == 'UserEdit'
    },
  }
}
</script>
