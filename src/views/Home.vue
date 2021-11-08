<template>
  <div id="landing">
    <div id="splash">
      <p>Life isn't perfect. Lets stop pretending that it is.</p>
      <p>Seriously, #FML</p>
    </div>
    <div
      style="
        height: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
      "
    >
      <Button label="View Gallery" class="default" @click="enter" />
    </div>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';
import Button from 'primevue/button';

import 'primeflex/primeflex.css';

import MyHeader from '@/components/MyHeader.vue'; // @ is an alias to /src

@Options({
  components: {
    MyHeader,
    Button,
  },
})
export default class Home extends Vue {
  enter() {
    console.log(this);
    console.log('do something');
    this.$router.push('gallery');
  }
}
</script>

<style scoped>
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
