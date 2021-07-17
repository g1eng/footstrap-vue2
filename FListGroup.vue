<template>
  <ul v-if="ul" :class="getListGroupStyle">
    <li
        :class="getListItemStyle(item)"
        v-for="(item, index) in getList"
        :key="item.id"
        :data-index="index"
    >
      {{ item.text }}
      <div
          v-if="item.count!==undefined || item.variant"
          :class="getListCounterStyle(item)"
      >
        {{item.count}}
      </div>
    </li>
  </ul>
  <div v-else :class="getListGroupStyle">
    <div
        :class="getListItemStyle(item)"
        v-for="(item, index) in getList"
        :key="item.id"
        :data-index="index"
    >
      {{ item.text }}
      <div
          v-if="item.count!==undefined || item.variant"
          :class="getListCounterStyle(item)"
      >
        {{item.count}}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "FListGroup",
  props: {
    ul: Boolean,
    xxl: Boolean,
    xl: Boolean,
    lg: Boolean,
    md: Boolean,
    sm: Boolean,
    list: Array,
    flush: Boolean,
    numbered: Boolean,
    horizontal: Boolean,
    equalWidth: Boolean,
  },
  methods: {
    getListItem(item){
      return "list-group-item" +
          (item.active ? " active" : "" ) +
          (item.disabled ? " disabled" : "" ) +
          (item.action ? " action" : "" )
    },
    getListItemStyle(item){
      return "list-group-item" +
          (item.active ? " active" : "" ) +
          (item.disabled ? " disabled" : "" ) +
          (item.action ? " action" : "" ) +
          (item.variant ? " list-group-item-" + item.variant : "")
    },
    getListCounterStyle(item){
      if (item.variant) {
        return "badge" +
            (item.variant ? " bg-" + item.variant : " bg-primary")
      } else {
        return "badge" +
            (item.bg ? " bg-" + item.bg : " bg-primary")
      }
    }
  },
  computed: {
    getListGroupStyle(){
      let breakpoint;
      switch(true){
        case this.xxl: breakpoint = "-xxl"
              break
        case this.xl: breakpoint = "-xl"
          break
        case this.lg: breakpoint = "-lg"
          break
        case this.md: breakpoint = "-md"
          break
        case this.sm: breakpoint = "-sm"
              break
        default: breakpoint = ""
      }
      return "list-group" +
          (this.numbered ? " list-group-numbered" : "") +
          (this.horizontal? " list-group-horizontal" + breakpoint: "")
    },
    getList(){
      return this.list
    },
  }
}
</script>

<style scoped>

</style>