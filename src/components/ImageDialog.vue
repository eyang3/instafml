<template>
  <Dialog
    header="Upload Image"
    v-model:visible="p_visible"
    :style="{ width: '30vw' }"
    @show="func"
  >
    <VueCropper
      ref="cropper"
      :src="option.img1"
      :outputType="option.outputType"
      :autoCrop="option.autoCrop"
      :autoCropWidth="option.autoCropWidth"
      :autoCropHeight="option.autoCropHeight"
      class="vuecropper"
    />
    <FileUpload
      mode="basic"
      :customUpload="true"
      @uploader="local_upload"
      :auto="true"
    />
    <br />

    <template #footer>
      <Button label="No" icon="pi pi-times" @click="close" />
      <Button label="Yes" icon="pi pi-check" @click="close" autofocus />
    </template>
  </Dialog>
</template>

<script lang="ts">
// Doesn't really do anything important, but
// just trying to figure out Vue Semantics
import { defineComponent } from 'vue';
import Button from 'primevue/button';
import Dialog from 'primevue/dialog';
import FileUpload from 'primevue/fileupload';
import VueCropper, { VueCropperMethods } from 'vue-cropperjs';
import 'cropperjs/dist/cropper.css';

export default defineComponent({
  name: 'ImageDialog',
  components: {
    Button,
    Dialog,
    FileUpload,
    VueCropper,
  },
  props: {
    visible: Boolean,
  },
  data() {
    return {
      imgData: null,
      option: {
        img1: 'https://fakeimg.pl/450x300/',
        outputType: 'png',
        autoCrop: true,
        autoCropWidth: 350,
        autoCropHeight: 220,
      },
    };
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
  methods: {
    close() {
      this.p_visible = !this.p_visible;
    },
    func() {
      console.log('this');
    },
    local_upload(event: HTMLInputElement): void {
      if (event != null) {
        const file = event!.files![0];
        const reader = new FileReader();
        reader.onload = (fileEvent) => {
          this.option.img1 = fileEvent!.target!.result! as string;
          (this.$refs.cropper as VueCropperMethods).replace(fileEvent!.target!.result as string);
        };
        reader.readAsDataURL(file);
      }
    },
  },
});

</script>

<style scoped>
.vuecropper {
  height: 300px;
  margin: 20px 0 20px 0;
}
</style>
