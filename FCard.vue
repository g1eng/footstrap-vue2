<template>
  <div
      :id="getCardId"
      :class="getCardClass"
  >
    <div v-if="title && !collapse"
         :class="getCardHeaderClass"
    >
      {{ title }}
    </div>
    <a v-else
       :href="'#' + getCardBodyId"
       :class="getCardHeaderClass"
       data-bs-toggle="collapse"
       role="button"
       :data-bs-target="'#' + getCardBodyId"
    >
      {{title}}
    </a>
    <div :id="getCardBodyId" :class="getCardBodyClass">
      <br v-if="collapse" />
      <slot/>
      <br v-if="collapse" />
    </div>
    <div v-if="footer"> {{ footer }}  </div>
  </div>
</template>

<script>
export default {
  name: "FCard",
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
    getCardClass(){
      return "card" +
          ( this.fluid ? " container-fluid" : "" ) +
          ( this.bg ? " bg-" + this.bg : "" ) +
          ( this.fg ? " text-" + this.fg: "") +
          ( this.collapse ? " accordion accordion-flush" : "")
    },
    getCardId(){
      return this.cardId
    },
    getCardHeaderClass(){
      return "" +
          ( this.collapse ?
              (this.bg ? " btn-" + this.bg: "") + " btn accordion-header accordion-button" : "card-header"
          )
    },
    getCardBodyClass(){
      return "" +
          ( this.collapse ? " collapse accordion-collapse" : "card-body")
    },
    getCardBodyId(){
      return this.cardId + "-body"
    }
  }
}
</script>

<style scoped>


.bg-dark {
  color: #f0f0f0;
  background: #2c3e50 !important;
}
.bg-danger {
  background: #ffdd80 !important;
}
.bg-warning {
  background: #ffdd80 !important;
}
.bg-success {
  background: #80ffaa !important;
}
.bg-danger {
  background: #ffa080 !important;
}
.bg-primary {
  background: #80a0ff !important;
}

.accordion-header {
  border-radius: 0.2rem;
}
.btn-dark.accordion-button {
  color: #f0f0f0;
  background: #2c3e50;
}
.btn-dark.accordion-button:not(.collapsed){
  color: #fff;
}
.accordion-button::after {
  color: #fff !important;
}

</style>