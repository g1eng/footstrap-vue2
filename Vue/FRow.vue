<template>
  <div :class="getRowClass">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "FRow",
  props: {
    nog: Boolean
  },
  computed: {
    getRowClass(){
      return "row" + (this.nog ? " no-gutter" : "")
    }
  }
}
</script>

<style scoped>

</style>