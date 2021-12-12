<template>
  <Header />
  <router-view class="port" />
  <div id="nav" style="padding: 60px">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';
import Header from '@/components/Header.vue'; // @ is an alias to /src

@Options({
  components: {
    Header,
  },
})
export default class App extends Vue { }
</script>

<style>
body,
html {
  height: 100%;
  background-color: #eee;
}
.port {
  height: 85vh;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding-top: 0px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

.default {
  color: #ffffff;
  border: 1px solid #fff;
  background: rgba(0, 0, 0, 0);
}

.default:hover {
  border: 2px solid #fff;
  background: rgba(0, 0, 0, 0);
}

.default:focus {
  border: 2px solid #fff;
  background: rgba(0, 0, 0, 0);
}

</style>
