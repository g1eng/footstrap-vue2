<template>
  <div id="app">
    <Demo/>
  </div>
</template>

<script>

import Demo from "@/../demo/Demo";
export default {
  name: 'App',
  components: {Demo},
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  background: #212529;
}
html {
  background: #212529;
}
</style>
