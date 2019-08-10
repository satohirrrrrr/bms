import axios from 'axios';

let store = {
  state: {
    loading: false,
    error: false,
    condition: '',
    books: [],
    mode: ''
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

  pushBook(book) {
    this.state.books.push(book)
  },

  clearBooks() {
    this.state.books = []
  },

  setMode(mode) {
    this.state.mode = mode
  },

  isHeadlineMode() {
    return this.state.mode === 'headline'
  },

  isListMode() {
    return this.state.mode === 'list'
  },

  reflectModeClass() {
    if (this.isHeadlineMode()) {
      $("#modeBtnHeadline").addClass("icon-active")
      $("#modeBtnList").removeClass("icon-active")
    }
    if (this.isListMode()) {
      $("#modeBtnList").addClass("icon-active")
      $("#modeBtnHeadline").removeClass("icon-active")
    }
  },

  fetchBooks() {
    this.setLoading(true)
    axios.get('/api/books', {
      params: { q: this.state.condition }
    }).then((response) => {
      this.clearBooks()
      for(let i = 0; i < response.data.books.length; i++) {
        const description = response.data.books[i].description
        response.data.books[i].description = this.omitStringLimitLength(description, 200)
        this.pushBook(response.data.books[i])
      }
      this.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },

  syncGoogle() {
    this.setLoading(true)
    axios.put('/api/books/sync', {
      q: this.state.condition
    }).then((response) => {
      alert("Google Books Apiとの同期が完了しました")
      this.fetchBooks()
    }, (error) => {
      alert("Google Books Apiとの同期に失敗しました")
    })
    this.setLoading(false)
  },

  omitStringLimitLength(str, limit) {
    if (str && str.length > limit) {
      return str.slice(0, limit) + '...'
    }
    return str
  },
  
}
export default store