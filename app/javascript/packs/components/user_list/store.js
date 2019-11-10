import axios from 'axios';

let store = {
  state: {
    loading: false,
    error: false,
    users: [],
    showEditUserModal: false,
    editUserModalForm: {
      id: '',
      lastName: '',
      firstName: '',
      email: '',
    }
  },

  setLoading(flag) {
    this.state.loading = flag
  },

  setError(flag) {
    this.state.error = flag
  },

  setCondition(condition) {
    this.state.condition = condition
  },

  pushUser(user) {
    this.state.users.push(user)
  },

  clearUsers() {
    this.state.users = []
  },

  fetchUsers() {
    this.setLoading(true)
    axios.get('/api/users').then((response) => {
      console.log(response)
      this.clearUsers()
      for(let i = 0; i < response.data.users.length; i++) {
        this.pushUser(response.data.users[i])
      }
      this.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },

  fetchUser(userId) {
    this.setLoading(true)
    this.state.editUserModalForm.id = userId
    axios.get(`/api/users/${userId}`).then((response) => {
      this.state.editUserModalForm.lastName = response.data.user_profile.last_name
      this.state.editUserModalForm.firstName = response.data.user_profile.first_name
      this.state.editUserModalForm.email = response.data.user.email
    }, (error) => {
      alert(error)
      this.state.editUserModalForm.id = ''
      this.state.editUserModalForm.lastName = ''
      this.state.editUserModalForm.firstName = ''
      this.state.editUserModalForm.email = ''
    })
    this.setLoading(false)
  },

  closeEditUserModal() {
    $('.modal').modal('close');
  },

  updateUser() {
    this.setLoading(true)
    axios.put(`/api/users/${this.state.editUserModalForm.id}`,
      { user: {
        email: this.state.editUserModalForm.email
      },
      user_profile: {
        first_name: this.state.editUserModalForm.firstName,
        last_name: this.state.editUserModalForm.lastName }
      }
    ).then((response) => {
      this.fetchUsers()
    }, (error) => {
      alert(error)
    })
    this.setLoading(false)
    $('.modal').modal('close');
  },

  deleteUser(userId) {
    this.setLoading(true)
    axios.post(`/api/users/delete/${userId}`).then((response) => {
      this.state.users = this.state.users.filter(user => user.id != response.data.user.id)
      this.setLoading(false)
    }, (error) => {
      alert(error)
    })
  }
}

export default store