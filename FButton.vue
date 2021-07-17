<template>
  <div :class="getButtonClass" @click="fireAction(action)">
    <slot/>
  </div>
</template>

<script>
export default {
  name: "FButton",
  props: {
    variant: String,
    action: Function,
  },
  methods:{
    fireAction(func){
      if(typeof func === "function"){
        func()
      } else if(this.item && this.item.action) {
        this.item.action()
      } else {
        console.log("dummy")
      }
    }
  },
  computed: {
    getButtonClass(){
      return "btn " + (this.variant ? "btn-" + this.variant : "")
    }
  }
}
</script>

<style scoped>

</style>