<template>
  <Dialog
    header="Sign up"
    v-model:visible="p_visible"
    :style="{ width: '35vw' }"
    @show="func"
  >
    <div style="color: red">
      {{ error }}
    </div>
    <br>
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
      <div style="padding-top: 25px">
        <span class="p-float-label">
          <InputText id="password" size="26" type="password" v-model="samepw" />
          <label for="password"
            ><div v-bind:style="doesNotMatch">Verify Password</div></label
          >
        </span>
      </div>
    </div>
    <template #footer>
      <Button label="Cancel" icon="pi pi-times" @click="close" />
      <Button label="Create" icon="pi pi-check" @click="save" autofocus />
    </template>
  </Dialog>
</template>

<script lang="ts">
import Dialog from 'primevue/dialog';
import { defineComponent } from 'vue';
import InputText from 'primevue/inputtext';
import Button from 'primevue/button';
import axios from 'axios';
import { signup } from '@/backendApi';

export default defineComponent({
  name: 'SignUp',
  components: {
    InputText,
    Button,
    Dialog,
  },
  data() {
    return {
      email: '', password: '', samepw: '', error: ' ',
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
      if (this.password === this.samepw) {
        try {
          await axios.post(signup, { email: this.email, password: this.password });
          this.p_visible = !this.p_visible;
          this.error = '';
        } catch (e) {
          this.error = 'User Already Exists';
        }
      }
    },
  },
  emits: ['update:visible'],
  computed: {
    doesNotMatch() {
      if (this.samepw !== this.password) {
        return { color: 'red' };
      }
      return {};
    },
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
