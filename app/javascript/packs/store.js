import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {/* */}
const mutations = {/* */}

let store = {
  state: {
    loading: false,
    error: false,
  }
}

export default new Vuex.Store({
  state,
  mutations
})