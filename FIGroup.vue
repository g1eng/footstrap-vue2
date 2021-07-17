<template>
  <div :class="getInputGroupClass">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "FIGroup",
  props: {
    lg: Boolean,
    sm: Boolean,
  },
  computed: {
    getInputGroupClass(){
      switch(true){
        case this.lg:
          return "input-group-lg"
        case this.sm:
          return "input-group-sm"
        default:
          return "input-group"
      }
    }
  }
}
</script>

<style scoped>

</style>