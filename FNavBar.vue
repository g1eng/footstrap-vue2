<template>
  <div class="nav nav-fill">
    <div v-if="brand" class="navbar-brand">
      {{brand}}
    </div>
    <slot/>
    <div v-if="menu" class="d-flex ms-auto">
      <div
          class="nav-tabs nav-link"
          v-for="(item, index) in listMenu"
          :key="item.id"
          :data-index="index"
      >
        <div v-if="item.icon">
          {{item.icon}}
        </div>
        {{item.text}}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "FNavBar",
  props: {
    brand: String,
    menu: Array,
  },
  computed: {
    listMenu(){
      console.log("list: ", this.menu)
      return this.menu
    }
  }
}
</script>

<style scoped>

</style>