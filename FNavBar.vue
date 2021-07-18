<template>
  <div :class="getNavBarClass">
    <img v-if="logo" :src="logo" alt="logo" />
    <div v-if="brand" :class="getBrandClass">
      {{brand}}
    </div>
    <slot/>
    <FNavTab v-if="menu" :menu="menu"/>
  </div>
</template>

<script>
import FNavTab from "./FNavTab";
export default {
  name: "FNavBar",
  components: {FNavTab},
  props: {
    brand: String,
    logo: String,
    menu: Array,
    top: Boolean,
    bottom: Boolean,
    sm: Boolean,
    lg: Boolean,
  },
  computed: {
    getNavBarClass(){
      return "nav navbar" +
          (this.top? " fixed-top": "") +
          (this.bottom? " fixed-bottom": "")
    },
    getBrandClass(){
      return "ms-3"
    }
  }
}
</script>

<style scoped>

</style>