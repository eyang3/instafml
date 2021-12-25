<template>
  <Dialog
    header="Sign up"
    v-model:visible="p_visible"
    :style="{ width: '35vw' }"
    @show="func"
  >
    Hello World
    <template #footer>
      <Button label="No" icon="pi pi-times" @click="close" />
      <Button label="Yes" icon="pi pi-check" @click="save" autofocus />
    </template>
  </Dialog>
</template>

<script lang="ts">
import Dialog from 'primevue/dialog';
import { defineComponent } from 'vue';
import InputText from 'primevue/inputtext';
import Button from 'primevue/button';

export default defineComponent({
  name: 'ImageDialog',
  components: {
    Button,
    Dialog,
  },
  props: {
    visible: Boolean,
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
