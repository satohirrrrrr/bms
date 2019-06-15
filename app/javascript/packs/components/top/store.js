import axios from 'axios'

var store = {
  state: {
    loading: false,
    error: false,
    condition: '',
    books: [],
    mode: ''
  },

  setLoading (flag) {
    this.state.loading = flag
  },

  setError (flag) {
    this.state.error = flag
  },

  setCondition (condition) {
    this.state.condition = condition
  },

  pushBook (book) {
    this.state.books.push(book)
  },

  clearBooks () {
    this.state.books = []
  },

  setMode (mode) {
    this.state.mode = mode
  },

  isHeadlineMode () {
    return this.state.mode === 'headline'
  },

  isListMode () {
    return this.state.mode === 'list'
  },

  reflectModeClass () {
    if (this.isHeadlineMode()) {
      $("#modeBtnHeadline").addClass("icon-active")
      $("#modeBtnList").removeClass("icon-active")
    }
    if (this.isListMode()) {
      $("#modeBtnList").addClass("icon-active")
      $("#modeBtnHeadline").removeClass("icon-active")
    }
  },

  fetchBooks (condition) {
    this.setLoading(true)
    axios.get('/api/books', {
      params: { q: this.state.condition }
    }).then((response) => {
      this.clearBooks()
      for(var i = 0; i < response.data.books.length; i++) {
        this.pushBook(response.data.books[i])
      }
      this.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },
}

export default store