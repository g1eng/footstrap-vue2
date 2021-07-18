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
          v-for="(item, rowId) in getNormalizedList"
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
    getNormalizedList(){
      // let tmpList = []
      // this.list.forEach((e)=>{
      //   tmpList.push(e)
      // })
      // this.getListIndex.forEach((e)=>{
      //   for (let i in tmpList){
      //     // set blank string to undefined field
      //     if(tmpList[i][e]===undefined)
      //       tmpList[i][e] = " "
      //   }
      // })
      // let newList = []
      // for (let i in tmpList) {
      //   let tmpItem = {}
      //   this.getListIndex.forEach((e)=>{
      //     tmpItem[e] = tmpList[i][e]
      //   })
      //   newList.push(tmpItem)
      // }
      return this.list
    }
  }
}
</script>

<style scoped>

</style>