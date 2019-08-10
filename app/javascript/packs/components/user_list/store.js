import axios from 'axios';

let store = {
  state: {
    loading: false,
    error: false,
    users: [],
    headers: [
      { text: 'email', value: 'email'},
    ]
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
      this.clearUsers()
      for(let i = 0; i < response.data.users.length; i++) {
      }
      this.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },  
}

export default store