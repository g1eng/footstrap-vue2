<template>
  <i :class="getIconClass"></i>
</template>

<script>
export default {
  name: "FIcon",
  props: {
    size: Number,
    name: String,
    fill: String,
  },
  computed: {
    getIconClass(){
      return "bi-" + (this.name ? this.name : "bootstrap" )
    },
    getFill(){
      return (this.fill ? this.fill : "currentColor" )
    },
    getSize(){
      return (this.size ? this.size : 32 )
    },
    getName(){
      return (this.name ? this.name : "bootstrap" )
    }
  }
}
</script>

<style scoped>

</style>