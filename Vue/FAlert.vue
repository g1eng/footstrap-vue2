<template>
  <div v-if="visible" :class="getAlertClass" role="alert">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "FAlert",
  props: {
    variant: String,
    visible: Boolean,
    dismissible: Boolean,
  },
  computed: {
    getAlertClass(){
      return "alert" +
          (this.variant? " alert-" + this.variant: " alert-primary")
    }
  }

}
</script>

<style scoped>

</style>