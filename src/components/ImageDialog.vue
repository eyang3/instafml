<template>
  <Dialog
    header="Upload Image"
    v-model:visible="p_visible"
    :style="{ width: '35vw' }"
    @show="func"
  >
    <VueCropper
      ref="cropper"
      :src="option.img1"
      :outputType="option.outputType"
      :autoCrop="option.autoCrop"
      :autoCropWidth="option.autoCropWidth"
      :autoCropHeight="option.autoCropHeight"
      :cropBoxResizable="false"
      :canScale="false"
      :aspectRatio="4 / 3"
      dragMode="none"
      :fixed="true"
      :style="{ width: '450px' }"
      class="vuecropper"
    />
    <FileUpload
      mode="basic"
      :customUpload="true"
      @uploader="local_upload"
      :auto="true"
      ref="uploader"
    />
    <br />
    <InputText
      v-model="imgtags"
      type="text"
      placeholder="Tags"
      :style="{ width: '70%' }"
    />

    <template #footer>
      <Button label="No" icon="pi pi-times" @click="close" />
      <Button label="Yes" icon="pi pi-check" @click="save" autofocus />
    </template>
  </Dialog>
</template>

<script lang="ts">
// Doesn't really do anything important, but
// just trying to figure out Vue Semantics
import { defineComponent } from 'vue';
import Button from 'primevue/button';
import axios from 'axios';
import Dialog from 'primevue/dialog';
import FileUpload from 'primevue/fileupload';
import InputText from 'primevue/inputtext';
import VueCropper, { VueCropperMethods } from 'vue-cropperjs';
import 'cropperjs/dist/cropper.css';

export default defineComponent({
  name: 'ImageDialog',
  components: {
    Button,
    Dialog,
    FileUpload,
    VueCropper,
    InputText,
  },
  props: {
    visible: Boolean,
  },
  data() {
    return {
      imgData: null,
      imgtags: '',
      option: {
        img1: 'https://fakeimg.pl/450x300/',
        outputType: 'png',
        autoCrop: true,
        autoCropWidth: 350,
        autoCropHeight: 220,
        cropBoxResizable: false,
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
    async save() {
      this.p_visible = !this.p_visible;
      const formData = new FormData();
      const cropper = (this.$refs.cropper as VueCropperMethods);
      const img = cropper.getCroppedCanvas().toDataURL();
      formData.append('tags', this.imgtags);
      formData.append('image', img);
      const response = await axios.post('/api/upload_image', formData);
    },
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
          const m: any = this.$refs.uploader;
          m.clear();
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
