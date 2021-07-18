<template>
  <ul v-if="menu" class="d-flex ms-auto nav-tabs">
    <li
        v-for="(item, index) in menu"
        :class="getNavItemClass(item)"
        :key="item.id"
        :data-index="index"
    >
      <a v-if="item.link" :href="item.link" >
        <span v-if="item.icon">
          {{item.icon}}
        </span>
        {{item.text}}
      </a>
      <div v-else>
        <span v-if="item.icon">
          {{item.icon}}
        </span>
        {{item.text}}
      </div>
    </li>
  </ul>
  <div v-else class="d-flex ms-auto nav-tabs">
    <slot/>
  </div>
</template>
<script>
export default {
  name: "FNavTab",
  props: {
    menu: Array
  },
  methods: {
    getNavItemClass(item){
      return "nav-item nav-link" +
          (item && item.active? " active": "")
    }
  }
}
</script>

<style scoped>

</style>