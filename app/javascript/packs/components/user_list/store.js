import axios from 'axios';
import commonStore from '../../common_store'

let store = {
  
  state: {
    users: [],
    userModalForm: {
      mode: 'create',
      id: '',
      lastName: '',
      firstName: '',
      email: '',
    }
  },

  isModeCreate() {
    console.log(this.state.userModalForm.mode)
    return this.state.userModalForm.mode == 'create'
  },

  pushUser(user) {
    this.state.users.push(user)
  },

  clearUsers() {
    this.state.users = []
  },

  fetchUsers() {
    commonStore.setLoading(true)
    axios.get('/api/users').then((response) => {
      this.clearUsers()
      for(let i = 0; i < response.data.users.length; i++) {
        this.pushUser(response.data.users[i])
      }
      commonStore.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },

  showUserModal(userId) {
    this.resetUserModalForm()
    if (!userId) {
      return false;
    }
    commonStore.setLoading(true)
    this.state.userModalForm.id = userId
    axios.get(`/api/users/${userId}`).then((response) => {
      this.state.userModalForm.mode = 'edit'
      this.state.userModalForm.lastName = response.data.user_profile.last_name
      this.state.userModalForm.firstName = response.data.user_profile.first_name
      this.state.userModalForm.email = response.data.user.email
      commonStore.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },

  resetUserModalForm() {
    console.log('resetUserModalForm')
    this.state.userModalForm.mode = 'create'
    this.state.userModalForm.lastName = ''
    this.state.userModalForm.firstName = ''
    this.state.userModalForm.email = ''
  },

  closeUserModal() {
    $('.modal').modal('close')
  },

  createUser() {
    commonStore.setLoading(true)
    axios.post(`/api/users/`,
      { user: {
          email: this.state.userModalForm.email
        },
        user_profile: {
          first_name: this.state.userModalForm.firstName,
          last_name: this.state.userModalForm.lastName
        }
      }
    ).then((response) => {
      this.fetchUsers()
      commonStore.setLoading(false)
      $('.modal').modal('close')
    }, (error) => {
      alert(error)
    })
  },

  updateUser() {
    commonStore.setLoading(true)
    axios.put(`/api/users/${this.state.userModalForm.id}`,
      { user: {
          email: this.state.userModalForm.email
        },
        user_profile: {
         first_name: this.state.userModalForm.firstName,
         last_name: this.state.userModalForm.lastName
        }
      }
    ).then((response) => {
      this.fetchUsers()
      commonStore.setLoading(false)
      $('.modal').modal('close')
    }, (error) => {
      alert(error)
    })
  },

  deleteUser(userId) {
    commonStore.setLoading(true)
    axios.post(`/api/users/delete/${userId}`).then((response) => {
      this.state.users = this.state.users.filter(user => user.id != response.data.user.id)
      commonStore.setLoading(false)
    }, (error) => {
      alert(error)
    })
  }
}

export default store