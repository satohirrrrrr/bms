let store = {
  state: {
    loading: false,
    error: false,
  },

  setLoading (flag) {
    this.state.loading = flag
  },
  
  setError (flag) {
    this.state.error = flag
  },
}

export default store
