<template>
  <div
      :id="getAccordionId"
      :class="getAccordionClass"
  >
    <div v-if="title && !collapse"
         :class="getAccordionHeaderClass"
    >
      {{ title }}
    </div>
    <a v-else
       :href="'#' + getAccordionBodyId"
       :class="getAccordionHeaderClass"
       data-bs-toggle="collapse"
       role="button"
       :data-bs-target="'#' + getAccordionBodyId"
    >
      {{title}}
    </a>
    <div :id="getAccordionBodyId" :class="getAccordionBodyClass">
      <slot/>
    </div>
    <div v-if="footer"> {{ footer }}  </div>
  </div>
</template>

<script>
export default {
  name: "FCollapse",
  props: {
    title: String,
    footer: String,
    fg: String,
    bg: String,
    color: String,
    collapse: Boolean,
    fluid: Boolean
  },
  data: function(){
    return {
      cardId: this.title.replaceAll(" ", "-")
    }
  },
  computed: {
    getAccordionClass(){
      return "card" +
          ( this.fluid ? " container-fluid" : "" ) +
          ( this.bg ? " bg-" + this.bg : "" ) +
          ( this.fg ? " text-" + this.fg: "") +
          ( this.collapse ? " accordion" : "")
    },
    getAccordionId(){
      return this.cardId
    },
    getAccordionHeaderClass(){
      return "card-header" +
          ( this.color ? " bg-" + this.color: "" ) +
          ( this.collapse ? " btn accordion-header accordion-button": "" )
    },
    getAccordionBodyClass(){
      return "card-body" +
          ( this.collapse ? " collapse accordion-collapse" : "")
    },
    getAccordionBodyId(){
      return this.cardId + "-body"
    }
  }
}
</script>

<style scoped>
.bg-dark {
  background: #2c3e50 !important;
}
</style>