<template>
  <nav>
    <ul :class="getPaginationClass">
      <li
          v-for="(item, index) in list"
          :key="item.id"
          :data-index="index"
          :class="getPaginationItemClass(item)"
      >
        <a v-if="item.text" :href="getPageLink(item)" class="page-link">
          {{ item.text }}
        </a>
        <a v-else :href="getPageLink(item)" class="page-link">
          {{ item }}
        </a>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  name: "FPagination",
  props: {
    list: Array,
    icon: Boolean,
    sm: Boolean,
    lg: Boolean,
    active: Number,
  },
  computed:{
    getPaginationClass(){
      return "pagination" +
          (this.sm? " pagination-sm": "") +
          (this.lg? " pagination-lg": "")
    },
  },
  methods: {
    getPaginationItemClass(item){
      return "page-item" +
          (item && item.active? " active": "") +
          (this.active && item.id === this.active? " active": "")
    },
    getPageLink(item){
      // console.log("pag item", item)
      if (item && typeof item.link === "string")
        return item.link
      else
        return "#"
    },
  }
}
</script>

<style scoped>

</style>