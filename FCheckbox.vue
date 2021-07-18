<template>
  <div :class="getCheckboxClass">
    <input
        :id="getCheckboxId"
        :name="getCheckboxId"
        type="checkbox"
        class="form-check-input"
    />
    <label class="form-check-label" :for="getCheckboxId">
      {{label}}
      <slot v-if="!label"/>
    </label>
  </div>

</template>

<script>
export default {
  name: "FCheckbox",
  props: {
    label: String,
    switch: Boolean,
    disabled: Boolean,
  },
  computed: {
    getCheckboxClass(){
      return "form-check" +
          (this.switch? " form-switch": "")
    },
    getCheckboxId(){
      if (this.label)
        return this.label.replaceAll(" ","-")
      else if (this.$slots.default.length !== 0)
        return this.$slots.default[0].text.replaceAll(" ","-")
      else
        return this._uid
    }
  }
}
</script>

<style scoped>

</style>