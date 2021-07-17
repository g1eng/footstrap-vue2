<template>
  <button type="button" :class="getButtonClass" @click="fireAction(action)">
    <span v-if="item && item.text">
      {{item.text}}
    </span>
    <span v-else>
      <slot/>
    </span>
    <span v-if="item && item.count!==undefined" :class="getBadgeClass">
      {{ item.count }}
    </span>
    <span v-else-if="accent" :class="getPointBadgeClass">
      <span class="visually-hidden">accented</span>
    </span>
  </button>
</template>

<script>
export default {
  name: "FButtonBadged",
  props: {
    variant: String,
    stacked: Boolean,
    accent: String,
    action: Function,
    item: Object,
  },
  methods: {
    fireAction(func){
      if(typeof func === "function"){
        func()
      } else if(this.item && typeof this.item.action === "function") {
        this.item.action()
      } else {
        console.log("dummy")
      }
    }
  },
  computed: {
    getButtonClass(){
      if (this.item){
        return "btn position-relative " +
            (this.item.variant ? "btn-" + this.item.variant : "btn-primary")
      } else {
        return "btn position-relative " +
            ( this.variant ? "btn-" + this.variant: " btn-primary")
      }
    },
    getBadgeClass(){
      return "badge" +
          (this.accent ? " bg-" + this.accent: " bg-secondary") +
          (this.stacked ? " position-absolute top-0 start-100 translate-middle rounded-pill" : "")
    },
    getPointBadgeClass(){
      return "badge position-absolute " +
          "top-0 start-100 translate-middle p-2 border border-light rounded-circle" +
          (this.accent ? " bg-" + this.accent: " bg-warning")
    }

  }
}
</script>

<style scoped>

</style>
