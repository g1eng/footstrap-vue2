<template>
  <a
      :class="getToggleClass"
      data-bs-toggle="offcanvas"
      :href="getTarget"
      role="button"
      :aria-controls="target.replaceAll(' ','-')"
  >
    <slot/>
  </a>
</template>

<script>
export default {
  name: "FOffCanvasToggle",
  props:{
    target: String,
    variant: String,
    lg: Boolean,
    sm: Boolean
  },
  computed: {
    getTarget(){
      return "#" + (this.target ? this.target.replaceAll(" ","-") : "unknown-off-canvas")
    },
    getToggleClass(){
      return "btn " +
          (this.variant ? "btn-" + this.variant: "btn-primary") +
          (this.lg ? " btn-lg": "") +
          (this.sm ? " btn-sm": "")
    }
  }
}
</script>

<style scoped>

</style>