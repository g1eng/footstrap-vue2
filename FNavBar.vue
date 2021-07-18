<template>
  <div class="nav nav-fill">
    <div v-if="brand" class="navbar-brand">
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
    menu: Array,
  },
}
</script>

<style scoped>

</style>