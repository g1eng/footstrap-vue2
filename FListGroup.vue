<template>
  <ul v-if="ul" :class="getListGroupStyle">
    <li
        :class="getListItemStyle(item)"
        v-for="(item, index) in list"
        :key="item.id"
        :data-index="index"
    >
      {{ item.text }}
      <div
          v-if="item.count!==undefined || item.variant || item.accent"
          :class="getListCounterStyle(item)"
      >
        {{item.count}}
      </div>
    </li>
  </ul>
  <div v-else :class="getListGroupStyle">
    <div
        :class="getListItemStyle(item)"
        v-for="(item, index) in list"
        :key="item.id"
        :data-index="index"
    >
      {{ item.text }}
      <div
          v-if="item.count!==undefined || item.variant || item.accent"
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
    getListItemStyle(item){
      return "list-group-item" +
          (item.active ? " active" : "" ) +
          (item.disabled ? " disabled" : "" ) +
          (item.action ? " action" : "" ) +
          (item.variant ? " list-group-item-" + item.variant : "")
    },
    getListCounterStyle(item){
      console.log("item",item)
      if (item.variant) {
        console.log("badge" + (item.accent? " bg-" + item.accent : " bg-" + item.variant))
        return "badge" +
            (item.accent? " bg-" + item.accent : " bg-" + item.variant)
      } else {
        console.log( "badge" + (item.accent? " bg-" + item.accent : " bg-warning"))
        return "badge" +
            (item.accent? " bg-" + item.accent : " bg-warning")
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
  }
}
</script>

<style>
.bg-warning {
  color: #111;
}
</style>