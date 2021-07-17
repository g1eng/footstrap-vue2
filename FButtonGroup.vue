<template>
  <div :class="getButtonGroupClass">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "FButtonGroup",
  props: {
    lg: Boolean,
    sm: Boolean,
  },
  computed: {
    getButtonGroupClass(){
      switch(true){
        case this.lg:
          return "btn-group-lg"
        case this.sm:
          return "btn-group-sm"
        default:
          return "btn-group"
      }
    }
  }
}
</script>

<style scoped>

</style>