<template>
  <div style="padding-top: 80px; height: 85vh; background-color: #777777">
    <Button @click="upload" class="default">Do Something</Button>
    <Button @click="test" class="default">Test Auth</Button>

    <ImageDialog v-model:visible="vis2"> Content </ImageDialog>
    {{ vis2 }}
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import Button from 'primevue/button';
import axios, { AxiosError } from 'axios';
import 'primeflex/primeflex.css';

import ImageDialog from '@/components/ImageDialog.vue'; // @ is an alias to /src
import { test } from '@/backendApi';

export default defineComponent({
  name: 'Gallery',
  components: {
    Button,
    ImageDialog,

  },
  data() {
    return {
      vis2: false,
    };
  },
  methods: {
    upload(): void {
      this.vis2 = true;
    },
    async test() {
      await axios.get(test, { withCredentials: true }).then((response) => {
        console.log(response);
      });
    },
  },
});
</script>
