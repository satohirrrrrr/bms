import axios from 'axios'
import commonStore from '../../common_store'

let store = {
  state: {
    book: {},
    thumbnail: ''
  },

  setBook (book) {
    this.state.book = book
  },

  setThumbnail (thumbnail) {
    this.state.thumbnail = thumbnail
  },

  fetchBookInfo (id) {
    commonStore.setLoading(true)
    this.setThumbnail('')
    axios.get(`/api/books/${id}`).then((response) => {
      this.setBook(response.data.book)
      // this.callGoogleBookApi(this.createApiParams(response.data.book))
      commonStore.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },

  /** 
   * params = { title: 'タイトル', author: '著者', publisher: '出版社', isbn: '1234567890123' }
   */
  callGoogleBookApi (params) {
    commonStore.setLoading(true)
    let q = []
    params.title     ? q.push(`intitle:${params.title}`)         : null
    params.author    ? q.push(`inauthor:${params.author}`)       : null
    params.publisher ? q.push(`inpublisher:${params.publisher}`) : null
    params.isbn ? q.push(`isbn:${params.isbn}`) : null
    axios.get(`https://www.googleapis.com/books/v1/volumes?q=${q.join('+')}`).then((response) => {
      if (response.data.totalItems > 0 && response.data.items[0].volumeInfo.imageLinks) {
        this.setThumbnail(response.data.items[0].volumeInfo.imageLinks.thumbnail)
      } else {
        this.setThumbnail(require('no_image.png'))
      }
      commonStore.setLoading(false)
    }, (error) => {
      alert(error)
    })
  },

  createApiParams (book) {
    let params = new Object()
    book.name      ? params.title = book.name    : null
    book.isbn_10   ? params.isbn  = book.isbn_10.replace(/-/g, '') : null
    book.isbn_13   ? params.isbn  = book.isbn_13.replace(/-/g, '') : null
    return params
  }
}

export default store