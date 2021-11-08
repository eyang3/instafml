<template>
  <div id="landing">
    <div id="splash">
      <p>Life isn't perfect. Lets stop pretending that it is.</p>
      <p>Seriously, #FML</p>
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';
import InputText from 'primevue/inputtext';

import 'primeflex/primeflex.css';

import MyHeader from '@/components/MyHeader.vue'; // @ is an alias to /src

@Options({
  components: {
    MyHeader,
    InputText,
  },
})
export default class Home extends Vue { }
</script>

<style scoped>
#landing {
  background: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2)),
    url("../assets/homepage_images/city.jpg");
}
#splash {
  padding-top: 100px;
  max-width: 38rem;
  line-height: 1.5rem;
  font-size: 24px;
  color: #fff;
   margin: 0 auto;
  text-align: center;
}
</style>
