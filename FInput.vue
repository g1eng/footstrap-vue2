<template>
  <div class="mt-2">
    <label class="form-label" :for="getInputId">
      {{label}}
      <slot v-if="!label"/>
    </label>
    <input :id="getInputId"
           :name="getInputId"
           :type="type"
           :min="min? min: undefined"
           :max="max? max: undefined"
           :step="step? step: undefined"
           :placeholder="placeholder"
           :class="getInputClass"
           :value="localValue"
           :readonly="disabled"
           :list="getDatalistId + '-datalist'"
           v-model="localValue"
    />
    <datalist v-if="hasDatalist" :id="getInputId + '-datalist'" >
      <option v-for="(item, index) in list"
              :key="item.id"
              :data-index="index"
              :value="item.text"
      />
    </datalist>
    <div v-if="type === 'range'" class="d-flex justify-content-end">
      <div class="ms-auto me-1 badge bg-secondary">
        {{localValue || "no value" }}
      </div>
    </div>
  </div>

</template>

<script>
export default {
  name: "FInput",
  props: {
    label: String,
    placeholder: String,
    type: String,
    disabled: Boolean,
    sm: Boolean,
    lg: Boolean,
    value: String,
    list: Array,
    min: String,
    max: String,
    step: String,
  },
  data: function(){
    return {
      localValue: this.value
    }
  },
  computed: {
    getInputId(){
      if (this.label)
        return this.label.replaceAll(" ","-")
      else if (this.$slots.default.length !== 0)
        return this.$slots.default[0].text.replaceAll(" ","-")
      else
        return this._uid
    },
    getInputClass(){
      return (this.type === "range"? " form-range": "form-control ms-2" ) +
          (this.sm? " form-control-sm": "") +
          (this.lg? " form-control-lg": "") +
          (this.type === "color"? " form-control-color": "")
    },
    hasDatalist(){
      return this.list &&
          typeof this.list === "object" &&
          this.list.length !== 0;
    },
    getDatalistId(){
      if (!this.list || typeof this.list !== "object" || this.list.length === 0)
        return undefined
      else if (this.label)
        return this.label.replaceAll(" ","-")
      else if (this.$slots.default.length !== 0)
        return this.$slots.default[0].text.replaceAll(" ","-")
      else
        return this._uid
    },
  },
}
</script>

<style scoped>
</style>