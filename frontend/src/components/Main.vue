<template>
  <div class="main">
    <p>{{ msg }}</p>
    <b-input-group>
      <b-form-input
        id="inputFrom"
        v-model="form"
        type="text"></b-form-input>
    </b-input-group>
    <b-button type="submit" @click="submitFrom" variant="primary">生成</b-button>
  </div>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  name: 'main',
  data () {
    return {
      msg: '該当スレのIDを入力してください'
    }
  },

  computed: {
    form: {
      get () {
        return this.$store.state.store.form
      },
      set (value) {
        this.$store.dispatch('store/updateForm', value)
      }
    },
    err: {
      get () {
        return this.$store.state.store.err
      }
    },
    story: {
      get () {
        return this.$store.state.store.story
      }
    },
  },

  methods: mapActions('store', [
    'submitFrom',
  ]),
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #35495E;
}
</style>
