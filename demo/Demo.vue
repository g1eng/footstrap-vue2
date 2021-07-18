<template>
  <div>
    <!--navbar-->
    <FNavBar brand="Duck2Go" class="bg-theme" top lg>
      <FNavTab :menu="list"></FNavTab>
    </FNavBar>

    <!--sidebar (offcanvas)-->
    <FOffCanvas title="offcanvas demo" placement="end">
      This is so called "Offcanvas" on Bootstrap 5.x
    </FOffCanvas>

    <!-- contents container -->
    <FContainer fluid class="margin-nav">
      <FRow nog>
        <!--column 1-->
        <FCol id="ok1" sm="12" md="6" lg="3" class="mt-2">
          <FCard title="first col" bg="warning">
            <div class="m-2">ok1</div>
            <FButton variant="success" :action="alertBang">fire event</FButton>
          </FCard>
        </FCol>
        <!--column 2-->
        <FCol id="ok2" sm="12" md="6" lg="3" class="mt-2">
          <FCard title="second col" bg="primary">
            <div class="m-2">ok2</div>
            <FOffCanvasToggle target="offcanvas demo" variant="outline-dark" lg>
              Open Sidebar
            </FOffCanvasToggle>
          </FCard>
        </FCol>
        <!--column 3-->
        <FCol id="ok3" sm="12" md="6" lg="3" class="mt-2">
          <FCard title="third col" bg="success">
            <div class="m-2">ok3</div>
            <FDropdown dark :menu="list" sm>
              dropdown
            </FDropdown>
          </FCard>
        </FCol>
        <!--column 4-->
        <FCol sm="12" md="6" lg="3" class="mt-2">
          <FCard title="collapse" fg="light" bg="dark" collapse>
            <div>thanks!</div>
          </FCard>
        </FCol>
      </FRow>

      <!--vertical list documentation-->
      <div class="mt-3 px-3">
        <FListGroup :list="getDocumentation" />
      </div>

      <!-- button and button group -->
      <div class="d-flex justify-content-around mt-3">
        <FButtonBadged :action="alertPong" :item="list[0]"/>
        <FButtonBadged stacked accent="danger" :item="list[1]"/>
        <FButtonBadged :action="toggleAlert" variant="outline-info" accent="warning">
          <span v-if="alertShown"> hide alert </span>
          <span v-else> pop alert</span>
        </FButtonBadged>
      </div>

      <!--horizontal list-->
      <div class="d-flex justify-content-center mt-3">
        <FListGroup :list="list" numbered ul horizontal />
      </div>
    </FContainer>

    <FContainer class="mt-2">
      <FCard title="input form" collapse>
        <FCheckbox>sample check</FCheckbox>
        <FCheckbox label="sample toggle" switch></FCheckbox>
        <FInput type="text" label="sample text input" placeholder="input something" />
        <FInput type="email" label="email input" placeholder="john.doe@example.com" sm/>
        <FInput type="password" label="password input" value="gozilla" sm/>
        <FInput type="range" min="1" max="10" value="5.0" step="0.5" label="range input" />
        <FInput type="text" label="disabled input" placeholder="hogefuga" lg disabled/>
        <FInput type="color" label="theme color" value="#293580" />
        <FInput type="file" label="upload file" />
        <FInput type="text" label="input from list" placeholder="search" :list="list" />
      </FCard>
    </FContainer>

    <FContainer class="mt-3">
      <FProgress :value="progress" variant="warning" striped />
    </FContainer>

    <div class="d-flex text-center p-2">
      <FAlert
          v-if="alertShown"
          :visible="alertShown"
          variant="danger"
      >
        dangerous snake comes from the river!
      </FAlert>
    </div>

    <FContainer>
      <FPagination :list="list" sm />
      <FPagination :list="[
          {text: 1, link: '#ok1'},
          {text: 2, link: '#ok2'},
          {text: 3, link: '#ok3'},
      ]" active="2" />
    </FContainer>

  </div>
</template>

<script>
import FContainer from "../FContainer";
import FButton from "../FButton";
import FCard from "../FCard";
import FRow from "../FRow";
import FCol from "../FCol";
import FListGroup from "../FListGroup";
import FOffCanvas from "../FOffCanvas";
import FOffCanvasToggle from "../FOffCanvasToggle";
import FDropdown from "../FDropdown";
import FNavBar from "../FNavBar";
import FProgress from "../FProgress";
import FButtonBadged from "../FButtonBadged";
import FAlert from "../FAlert";
import FNavTab from "../FNavTab";
import FCheckbox from "../FCheckbox";
import FInput from "../FInput";
import FPagination from "../FPagination";
export default {
  name: "Demo",
  data: function(){
    return {
      list: [
        {text: "pong", count: 5, variant: "danger", accent: "secondary"},
        {text: "increment", link: "#ok1", count: 15, action: function(){ this.count++; }},
        {text: "some", link:"#ok3", variant: "info", active: true},
        {text: "dummy", isDivider: true, disabled: true},
        {text: "yellow", variant: "warning", action: this.alertBang},
      ],
      documentation : {
        pong: "has no action but makes alert on the button below",
        increment: "increments number it holds",
        some: "does nothing, but it has a link to #ok3 on navbar",
        dummy: "does nothing, but it appears as a border at the dropdown",
        yellow: "is yellow. that's all.",
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
            accent: e.accent,
            variant: e.variant
          })
      })
      return body
    }
  },
  components: {
    FPagination,
    FInput,
    FCheckbox,
    FNavTab,
    FAlert,
    FButtonBadged,
    FProgress,
    FNavBar,
    FDropdown,
    FOffCanvasToggle,
    FOffCanvas,
    FListGroup,
    FCol,
    FRow,
    FCard,
    FButton,
    FContainer
  }
}
</script>

<style scoped>

.bg-theme {
  background: #fdc8a0;
}
.margin-nav {
  margin-top: 3.5rem;
}

@media (max-width: 420px) {
  .margin-nav {
    margin-top: 5.5rem;
  }
}

</style>
