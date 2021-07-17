<template>
  <div>
    <FNavBar brand="dachen" :menu="list"></FNavBar>
    <FContainer fluid class="mt-3">
      <FOffCanvas title="of 1">
        ok canvas off canvas
      </FOffCanvas>
      <FRow nog>
        <FCol n="3">
          <FCard title="firstcol" bg="warning">
            <div class="m-2">ok1</div>
            <FButton variant="success" :action="alertBang">this</FButton>
          </FCard>
        </FCol>
        <FCol n="3">
          <FCard title="secondcol" bg="primary">
            <div class="m-2">ok2</div>
            <FOffCanvasToggle target="of 1" variant="outline-dark" lg>
              Open Sidebar
            </FOffCanvasToggle>
          </FCard>
        </FCol>
        <FCol n="3">
          <FCard title="thirdcol" bg="success">
            <div class="m-2">ok3</div>
            <FDropdown dark :menu="list" sm>
              dropdown
            </FDropdown>
          </FCard>
        </FCol>
        <FCol n="3">
          <FCard title="this title is" fg="light" bg="dark" collapse>
            <div>thanks!</div>
          </FCard>
        </FCol>
      </FRow>
      <FIcon name="heart-fill"/>
      <FContainer class="mt-3">
        <FListGroup :list="list" numbered ul horizontal />
      </FContainer>
    </FContainer>
    <FContainer class="mt-3">
      <FProgress :value="progress" variant="warning" striped />
    </FContainer>
    <div class="d-flex justify-content-around mt-3">
      <FButtonBadged :action="alertPong" :item="list[0]"/>
      <FButtonBadged stacked accent="danger" :item="list[1]"/>
      <FButtonBadged variant="dark" accent="warning">
        next
      </FButtonBadged>
    </div>
  </div>
</template>

<script>
import FContainer from "@/../FContainer";
import FButton from "@/../FButton";
import FCard from "@/../FCard";
import FRow from "@/../FRow";
import FCol from "@/../FCol";
import FListGroup from "@/../FListGroup";
import FIcon from "@/../FIcon";
import FOffCanvas from "@/../FOffCanvas";
import FOffCanvasToggle from "@/../FOffCanvasToggle";
import FDropdown from "@/../FDropdown";
import FNavBar from "@/../FNavBar";
import FProgress from "@/../FProgress";
import FButtonBadged from "@/../FButtonBadged";
export default {
  name: "Demo",
  data: function(){
    return {
      list: [
        {text: "ok", count: 5, variant: "danger"},
        {text: "nok", count: 15},
        {text: "some", variant: "info"},
        {text: "dummy", isDivider: true},
        {text: "things", variant: "warning", action: this.alertBang},
        {text: "that", variant: "success"},
      ],
      progress: 30,
    }
  },
  mounted() {
    setInterval(this.renewProgress, 500)
  },
  methods: {
    alertBang(){
      console.log(this.list)
      alert("bang")
    },
    alertPong(){
      alert("pong")
    },
    renewProgress(){
      this.progress += 3
      if (this.progress > 100)
        this.progress = 1
    }
  },
  components: {
    FButtonBadged,
    FProgress,
    FNavBar,
    FDropdown, FOffCanvasToggle, FOffCanvas, FIcon, FListGroup, FCol, FRow, FCard, FButton, FContainer}
}
</script>

<style scoped>

</style>
