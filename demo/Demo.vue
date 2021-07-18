<template>
  <div>
<!--    <FNavBar brand="dachen" class="bg-wakakusa" :menu="list"></FNavBar>-->
    <FNavBar brand="duck2go" class="bg-wakakusa">
      <FNavTab :menu="list"></FNavTab>
    </FNavBar>
    <FContainer fluid class="mt-3">
      <FOffCanvas title="offcanvas demo" placement="end">
        This is so called "Offcanvas" on Bootstrap 5.x
      </FOffCanvas>
      <FRow nog>
        <FCol n="3">
          <FCard title="first col" bg="warning">
            <div class="m-2">ok1</div>
            <FButton variant="success" :action="alertBang">fire event</FButton>
          </FCard>
        </FCol>
        <FCol n="3">
          <FCard title="second col" bg="primary">
            <div class="m-2">ok2</div>
            <FOffCanvasToggle target="offcanvas demo" variant="outline-dark" lg>
              Open Sidebar
            </FOffCanvasToggle>
          </FCard>
        </FCol>
        <FCol n="3">
          <FCard title="third col" bg="success">
            <div class="m-2">ok3</div>
            <FDropdown dark :menu="list" sm>
              dropdown
            </FDropdown>
          </FCard>
        </FCol>
        <FCol n="3">
          <FCard title="collapse" fg="light" bg="dark" collapse>
            <div>thanks!</div>
          </FCard>
        </FCol>
      </FRow>
      <FIcon name="heart-fill"/>
      <div class="mt-3">
        <FListGroup :list="getDocumentation" ul />
      </div>
      <div class="d-flex justify-content-around mt-3">
        <FButtonBadged :action="alertPong" :item="list[0]"/>
        <FButtonBadged stacked accent="danger" :item="list[1]"/>
        <FButtonBadged :action="toggleAlert" variant="outline-info" accent="warning">
          <span v-if="alertShown"> hide alert </span>
          <span v-else> pop alert</span>

        </FButtonBadged>
      </div>
      <div class="mt-3">
        <FListGroup :list="list" numbered ul horizontal />
      </div>
    </FContainer>

    <FContainer class="mt-3">
      <FProgress :value="progress" variant="warning" striped />
    </FContainer>
    <FAlert
        v-if="alertShown"
        class="mx-5 mt-3"
        :visible="alertShown"
        variant="danger"
    >
      dangerous snake comes from the river!
    </FAlert>
  </div>
</template>

<script>
import FContainer from "../FContainer";
import FButton from "../FButton";
import FCard from "../FCard";
import FRow from "../FRow";
import FCol from "../FCol";
import FListGroup from "../FListGroup";
import FIcon from "../FIcon";
import FOffCanvas from "../FOffCanvas";
import FOffCanvasToggle from "../FOffCanvasToggle";
import FDropdown from "../FDropdown";
import FNavBar from "../FNavBar";
import FProgress from "../FProgress";
import FButtonBadged from "../FButtonBadged";
import FAlert from "../FAlert";
import FNavTab from "../FNavTab";
export default {
  name: "Demo",
  data: function(){
    return {
      list: [
        {text: "pong", count: 5, variant: "danger", active: true},
        {text: "increment", link: "#ok", count: 15, action: function(){ this.count++ }},
        {text: "some", link:"#nok", variant: "info"},
        {text: "dummy", isDivider: true},
        {text: "yellow", variant: "warning", action: this.alertBang},
        {text: "tip", variant: "success"},
      ],
      documentation : {
        pong: "has no action but makes alert on the button below",
        increment: "increments number it holds",
        some: "does nothing, but it has a link to #nok on navbar",
        dummy: "does nothing, but it appears as a border at the dropdown",
        yellow: "is yellow. that's all.",
        tip: "under working"
      },
      progress: 30,
      alertShown: false,
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
    },
    toggleAlert(){
      this.alertShown=!this.alertShown
    }
  },
  computed: {
    getDocumentation(){
      let body = []
      this.list.forEach((e)=>{
        if (typeof this.documentation[e.text] === "string")
          body.push({
            text: `[${e.text}] ${this.documentation[e.text]}`,
            variant: e.variant
          })
      })
      return body
    }
  },
  components: {
    FNavTab,
    FAlert,
    FButtonBadged,
    FProgress,
    FNavBar,
    FDropdown, FOffCanvasToggle, FOffCanvas, FIcon, FListGroup, FCol, FRow, FCard, FButton, FContainer}
}
</script>

<style scoped>

.bg-wakakusa{
  background: #70a050;
}

</style>
