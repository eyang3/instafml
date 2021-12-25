<template>
  <div class="header">
    <div class="p-grid">
      <div class="p-col-2">
        <img
          id="imagebackground"
          src="logo.png"
          height="64"
          style="float: left"
        />
      </div>
      <div class="p-col-8">
        <p style="vertical-align: middle">
          <span class="p-input-icon-left">
            <i class="pi pi-search" style="position: relative; left: 22px" />
            <InputText
              :style="{ width: '70%' }"
              type="text"
              v-model="searchTerm"
              placeholder="Search"
            />
          </span>
        </p>
      </div>
      <div class="p-col-1">
        <p style="vertical-align: middle; float: right">
          <Button style="white-space: nowrap" label="Sign-up" class="default" @click="signup" />
        </p>
      </div>
      <div class="p-col-1">
        <p style="vertical-align: middle; float: left; min-width: 100px">
          <Button label="Login" class="default" />
        </p>
      </div>
    </div>
  </div>
</template>

<script lang="ts">

import { defineComponent } from 'vue';
import Button from 'primevue/button';
import InputText from 'primevue/inputtext';

import 'primeicons/primeicons.css';
import '@/assets/custom.css';

export default defineComponent({
  name: 'Header',
  components: {
    Button,
    InputText,
  },
  methods: {
    signup() {
      this.$emit('login', 'login');
    },
  },
  data() {
    return {
      searchTerm: '',
      test: '',
      entry: '',
    };
  },
});

</script>

<style scoped>
#imagebackground {
  background: #eee;
  height: 64px;
  top: 0px;
}
.header {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  background: rgba(17, 17, 17, 0.5);
  height: 64px;
  width: 100%;
  position: absolute;
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

.header-content {
  vertical-align: middle;
  padding-left: 20px;
  padding-right: 20px;
}

#logo {
  padding-left: 10px;
  float: left;
  height: 64px;
  justify-content: left;
}
#search {
  position: absolute;
  width: 100%;
}

#user {
  float: right;
}

p > img {
  transform: translate(-31px, -18px);
  height: 64px;
}
</style>
