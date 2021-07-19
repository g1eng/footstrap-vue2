<template>
  <table v-if="list && list.length !== 0" class="table">
    <thead>
    <tr>
      <th
          v-for="(seq, index) in getListIndex"
          :key="seq.id"
          :data-index="index"
          :class="getTableHeaderClass"
          scope="col"
      >
        {{ seq }}
      </th>
    </tr>
    </thead>
    <tbody>
    <tr
          v-for="(item, rowId) in list"
          :key="item.id"
          :data-index="rowId"
    >
      <td
          v-for="(col, colIndex) in getListIndex"
          :key="col.id"
          :data-index="colIndex"
          :class="getTableClass(item)"
      >
        <span v-if="item[col]!==undefined">
          {{ item[col] }}
        </span>
        <span v-else></span>
      </td>

    </tr>
    </tbody>
  </table>
</template>

<script>
export default {
  name: "FTable",
  props: {
    list: Array,
    variant: String,
    accent: String,
  },
  methods: {
    getTableClass(item){
      return (item && item.variant)? "table-" + item.variant: "table-light"
    }
  },
  computed: {
    getListIndex(){
      let indices = []
      for (let i in this.list) {
        for (let j in this.list[i]) {
          if(indices.indexOf(j) === -1)
            indices.push(j)
        }
      }
      return indices
    },
    getTableHeaderClass(){
      return this.accent? "table-" + this.accent : "table-light"
    },
  }
}
</script>

<style scoped>

</style>