import { createApp } from 'vue';
import PrimeVue from 'primevue/config';
import { VueCookieNext } from 'vue-cookie-next';
import App from './App.vue';
import router from './router';
import store from './store';

createApp(App)
  .use(store)
  .use(router)
  .use(PrimeVue)
  .use(VueCookieNext)
  .mount('#app');
