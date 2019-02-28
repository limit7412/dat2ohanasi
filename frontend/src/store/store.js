import api from "../lib/api";

// initial state
const initialState = () =>  ({
  form: '',
  err: '',
  story: []
})

// getters
const getters = {
}

// actions
const actions = {
  submitFrom ({ state, dispatch }) {
    api.getStory(
      state.form,
      res => {
        dispatch('updateStory', res)
      },
      err => {
        dispatch('updateErr', err)
      })
  },

  updateForm ({ commit }, val) {
    commit('updateForm', val)
  },
  updateErr ({ commit }, val) {
    commit('updateErr', val)
  },
  updateStory ({ commit }, val) {
    commit('updateStory', val)
  },
}

// mutations
const mutations = {
  updateForm (state, val) {
    state.form = val
  },

  updateErr (state, val) {
    state.err = val
  },

  updateStory (state, val) {
    state.story = val
  },

  stateReset (state) {
    Object.assign(state, initialState())
  },
}

export default {
  namespaced: true,
  state: initialState(),
  getters,
  actions,
  mutations
}
