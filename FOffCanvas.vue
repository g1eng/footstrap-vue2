<template>
  <div :id="getOffCanvasId" :class="getOffCanvasClass" tabindex="-1" >
    <div class="offcanvas-header">
      <div v-if="title" class="offcanvas-title"> {{title}} </div>
      <button
          type="button"
          class="btn-close text-reset"
          data-bs-dismiss="offcanvas"
          aria-label="Close"/>
    </div>
    <div class="offcanvas-body">
      <slot/>
    </div>
  </div>
</template>

<script>
export default {
  name: "FOffCanvas",
  props: {
    placement: String,
    title: String,
  },
  computed: {
    getOffCanvasId(){
      return (this.title ? this.title.replaceAll(" ","-") : "unknown-off-canvas")
    },
    getOffCanvasClass(){
      return "offcanvas offcanvas-" +
          (this.placement ? this.placement : "start")
    }
  }
}
</script>

<style scoped>

</style>