<template>
  <ul v-if="menu" class="d-inline-flex nav-tabs">
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
  <div v-else class="d-inline-flex ms-auto nav-tabs">
    <slot/>
  </div>
</template>
<script>
export default {
  name: "FNavTab",
  props: {
    menu: Array,
  },
  methods: {
    getNavItemClass(item){
      return "nav-item nav-link" +
          (item && item.active? " active": "") +
          (item && item.disabled? " disabled": "")
    }
  }
}
</script>

<style scoped>
.nav-link {
  padding: 0.3rem 0.5rem;
  max-width: 25vw;
  font-size: 0.8rem;
}
ul {
  margin-bottom: 0.2rem;
}

</style>