<template>
  <div :class="getContainerClass">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "FContainer",
  props: {
    fluid: Boolean
  },
  computed: {
    getContainerClass(){
      return (this.fluid ? "container-fluid" : "container" )
    }
  }
}
</script>

<style scoped>

</style>