<template>
  <div id="toggleColor" class="col-md-12">        
      <div class="col-md-2 float-left">
          <span>Dark Mode <i class="fa fa-moon-o"></i></span>
      </div>
      <div class="col-md-2 float-left">
          <label class="switch2">
              <input type="checkbox" id="icon2" name="style_id" :checked="darkMode" @click="(setThemeColor())">
              <span class="slider round"></span>
          </label>
      </div>
  </div>
</template>

<script>

export default {
  props:{
    styleId: null,
    route: null,
    userId: null
  },
  data(){
    return {
      darkMode: this.styleId,
    }
  },
  // mounted(){
  //   this.darkMode = this.styleId;
  // },
  // computed: {
  //   styleTranslator() {
  //     if(this.styleId === true){
  //       return 1;
  //     }
  //     return null;
  //   },
  // },
  methods: {
    styleTranslator() {
      if(this.darkMode === true){
        return 1;
      }
      return null;
    },
    async setThemeColor(){
      this.darkMode = !this.darkMode
      let style = this.styleTranslator();

      let payload = {
        'route': this.route,
        'id': this.userId,
        'style_id': style,
      }
      console.log(payload);
      await this.$store.dispatch("setThemeColor", payload);
    },
  }
};
</script>

<style scoped>
.switch2 {
    position: relative;
    display: inline-block;
    width: 55px;
    height: 24px;
}

.switch2 input { 
  opacity: 0;
  width: 0;
  height: 0;
}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
    position: absolute;
    content: "";
    height: 18px;
    width: 18px;
    left: 5px;
    bottom: 3px;
    background-color: white;
    -webkit-transition: .4s;
    transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>