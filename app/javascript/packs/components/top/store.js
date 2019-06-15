import axios from 'axios'

var store = {
  state: {
    loading: false,
    error: false,
    books: []
  },

  setLoading (flag) {
    this.state.loading = flag
  },

  setError (flag) {
    this.state.error = flag
  },

  pushBook (book) {
    this.state.books.push(book)
  },

  clearBooks () {
    this.state.books = []
  },

  fetchBooks (condition) {
    this.setLoading(true)
    axios.get('/api/books', {
      params: { q: condition }
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