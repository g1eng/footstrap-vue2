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
    variant: String,
  },
  computed: {
    getOffCanvasId(){
      return (this.title ? this.title.replaceAll(" ","-") : "unknown-off-canvas")
    },
    getOffCanvasClass(){
      return "offcanvas offcanvas-" +
          (this.placement ? this.placement : "start") +
          (this.variant ? " bg-" + this.variant : "")
    }
  }
}
</script>

<style scoped>

.bg-dark {
  color: #f0f0f0;
  background: #2c3e50 !important;
}
.bg-danger {
  background: #ffdd80 !important;
}
.bg-warning {
  background: #ffdd80 !important;
}
.bg-success {
  background: #80ffaa !important;
}
.bg-danger {
  background: #ffa080 !important;
}
.bg-primary {
  background: #80a0ff !important;
}

</style>