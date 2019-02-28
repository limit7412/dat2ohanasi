import axios from 'axios'

export default {
  getStory: (id, callback, errCallback) => {
    axios.get(`https://dat2.api.newgenerations.im/dev/ohanasi?id=${id}`, headers)
      .then(response => {
        cb(response)
      })
      .catch(error => {
        err_cb(error)
      })
  }
}