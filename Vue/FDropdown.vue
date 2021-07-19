<template>
  <div :class="getButtonGroupClass">
    <button :class="getDropdownToggleClass" type="button" data-bs-toggle="dropdown">
      <slot/>
    </button>
    <ul :class="getDropdownMenuClass">
      <li
          v-for="(item, index) in menu"
          :key="item.id"
          :data-index="index"
      >
        <a v-if="item.href"
           :href="item.href"
           class="dropdown-item"
           @click="fireAction(item)"
        >
          {{item.text}}
        </a>
        <hr v-else-if="item.isDivider" class="dropdown-divider" />
        <div v-else
             class="dropdown-item"
             @click="fireAction(item)"
        >
          {{item.text}}
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "FDropdown",
  props: {
    lg: Boolean,
    sm: Boolean,
    variant: String,
    dark: Boolean,
    menu: Array,
  },
  methods: {
    fireAction(item){
      if(typeof item.action === "function"){
        item.action()
      } else {
        console.log("dummy")
      }
    }
  },
  computed: {
    getButtonGroupClass(){
      switch(true){
        case this.lg:
          return "btn-group-lg"
        case this.sm:
          return "btn-group-sm"
        default:
          return "btn-group"
      }
    },
    getDropdownToggleClass(){
      return "dropdown dropdown-toggle btn" +
          (this.variant ? " btn-" + this.variant : " btn-primary") +
          (this.lg ? " btn-lg" : "") +
          (this.sm ? " btn-sm" : "")
    },
    getDropdownMenuClass(){
      return "dropdown-menu" +
          ( this.dark? " dropdown-menu-dark" : "")
    }
  }
}
</script>

<style scoped>

</style>