<template>
  <Dialog
    header="Login"
    v-model:visible="p_visible"
    :style="{ width: '35vw' }"
    @show="func"
  >
    <div style="color: red">
      {{ error }}
    </div>
    <br />
    <div class="loginform">
      <div style="padding-top: 25px">
        <span class="p-float-label">
          <InputText id="username" size="26" type="text" v-model="email" />
          <label for="username">E-mail</label>
        </span>
      </div>
      <div style="padding-top: 25px">
        <span class="p-float-label">
          <InputText
            id="password"
            size="26"
            type="password"
            v-model="password"
          />
          <label for="password">Password</label>
        </span>
      </div>
    </div>
    <template #footer>
      <Button label="Cancel" icon="pi pi-times" @click="close" />
      <Button label="Login" icon="pi pi-check" @click="save" autofocus />
    </template>
  </Dialog>
</template>

<script lang="ts">
import Dialog from 'primevue/dialog';
import { defineComponent } from 'vue';
import { VueCookieNext } from 'vue-cookie-next';

import InputText from 'primevue/inputtext';
import Button from 'primevue/button';
import axios, { AxiosError } from 'axios';
import { login } from '@/backendApi';

export default defineComponent({
  name: 'Login',
  components: {
    InputText,
    Button,
    Dialog,
  },
  data() {
    return {
      email: '', password: '', error: ' ',
    };
  },
  props: {
    visible: Boolean,
  },
  methods: {
    close() {
      this.p_visible = !this.p_visible;
    },
    async save() {
      try {
        const response = await axios.post(login, { email: this.email, password: this.password });
        axios.defaults.headers.common.Authorization = 'Bearer '.concat(response.data.message);
        VueCookieNext.setCookie('auth', response.data.message);
        this.p_visible = !this.p_visible;
        this.error = '';
      } catch (e) {
        const error = e as AxiosError;
        this.error = error.response?.data.message;
      }
    },
  },
  emits: ['update:visible'],
  computed: {
    p_visible: {
      get(): boolean {
        return this.visible;
      },
      set(value: boolean): void {
        this.$emit('update:visible', value);
      },
    },
  },
});
</script>
<style scoped>
.loginform {
  display: block;
  padding-left: 20%;
}
</style>
