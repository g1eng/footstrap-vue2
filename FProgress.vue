<template>
  <div class="progress">
    <div
        :class="getProgressClass"
        role="progressbar"
        :style="getProgressStyle"
        :aria-valuenow="value"
        aria-valuemin="0"
        aria-valuemax="100">
    </div>
  </div>
</template>

<script>
export default {
  name: "FProgress",
  props: {
    value: Number,
    variant: String,
    striped: Boolean
  },
  computed: {
    getProgressStyle(){
      return "width: " + this.value + "%"
    },
    getProgressClass(){
      return "progress-bar" +
          ( this.variant ? " bg-" + this.variant : " bg-primary") +
          ( this.striped ? " progress-bar-striped" : "")
    }
  }
}
</script>

<style scoped>

</style>