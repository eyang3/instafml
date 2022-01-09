<template>
  <Header @signup="signup" @login="login" />
  <sign-up v-model:visible="signupVisible" />
  <login v-model:visible="loginVisible" />
  <router-view class="port" />
  <div id="nav" style="padding: 60px">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link> |
    <router-link to="/wtf">WTF</router-link>

  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import { VueCookieNext } from 'vue-cookie-next';
import axios from 'axios';

import Header from '@/components/Header.vue'; // @ is an alias to /src
import SignUp from '@/components/SignUp.vue';
import Login from '@/components/Login.vue';

export default defineComponent({
  name: 'App',
  components: {
    Header,
    SignUp,
    Login,
  },
  data() {
    return {
      loginVisible: false,
      signupVisible: false,
    };
  },
  mounted() {
    const token = VueCookieNext.getCookie('auth');
    axios.defaults.headers.common.Authorization = 'Bearer '.concat(token);
  },
  methods: {
    signup() {
      this.signupVisible = !this.signupVisible;
    },
    login() {
      this.loginVisible = !this.loginVisible;
    },
  },
});

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
