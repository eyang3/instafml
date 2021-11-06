<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <Row class="flex" justify="center">
      <Col class="flex flex-col mx-14 mb-8" lg="3" sm="3" xs="3">
        <Button>Hello</Button>
      </Col>
      <Col class="flex flex-col mx-14 mb-8" lg="6" sm="6" xs="6"> stuff </Col>

      <Col class="flex flex-col my-3" lg="3" sm="3" xs="3"> Other </Col>
    </Row>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component';
import MyHeader from '@/components/MyHeader.vue'; // @ is an alias to /src
import Row from '@/components/Row.vue'; // @ is an alias to /src
import Col from '@/components/Col.vue'; // @ is an alias to /src

@Options({
  components: {
    MyHeader,
    Row,
    Col,
  },
})
export default class Home extends Vue { }
</script>
