<template>
  <div :class="getColClass">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "FCol",
  props: {
    sm: String,
    md: String,
    lg: String,
    xl: String,
    n: String,
  },
  computed: {
    getColClass(){
      return (this.n ? "col-" + this.n : "") +
          (this.sm ? " col-sm-" + this.sm : "") +
          (this.md ? " col-md-" + this.md : "") +
          (this.lg ? " col-lg-" + this.lg : "") +
          (this.xl ? " col-xl-" + this.xl : "")
    }
  }
}
</script>

<style scoped>

</style>