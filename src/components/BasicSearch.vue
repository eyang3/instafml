<template>
  <div>
    <input
      id="searchbox"
      :value="modelValue"
      :placeholder="defaultValue"
      @input="$emit('update:modelValue', $event.target.value)"
    />
  </div>
</template>

<script lang="ts">
// Doesn't really do anything important, but
// just trying to figure out Vue Semantics
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'BasicSearch',
  props: {
    defaultValue: String,
    modelValue: String,
  },
  emits: ['update:modelValue'],
});

</script>

<style scoped>
#searchbox {
  height: 30px;
  width: 300px;
}
</style>
