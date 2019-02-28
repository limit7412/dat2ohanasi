import axios from 'axios'
const client = axios.create({
  baseURL: 'https://dat2.api.newgenerations.im',
  headers: {
    'Content-Type': 'application/json',
  },
  responseType: 'json',
})


export default {
  getStory: (id, callback, errCallback) => {
    client.get(`/dev/ohanasi?id=${id}`)
      .then(response => {
        callback(response)
      })
      .catch(error => {
        errCallback(error)
      })
  }
}