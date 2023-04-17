<template>
 <GmapMap
  :center="{lat:39.9612, lng:-82.9988}"
  :zoom="7"
  map-type-id="terrain"
  style="width: 500px; height: 300px"
>
  <GmapMarker
    :key="index"
    v-for="(m, index) in markers"
    :position="m.position"
    :clickable="true"
    :draggable="true"
    @click="center=m.position"
  />
</GmapMap>

</template>
<script>
import CoffeeShopServices from "../services/CoffeeShopServices";
import {gmapApi} from 'vue2-google-maps'

export default {
  methods: {
    
    getCoffeeShops() {
      CoffeeShopServices.getAllCoffeeShops()
        .then((response) => {
          console.log(response.data);
          this.$store.commit("SET_COFFEE_SHOPS", response.data);
        })
        .catch((err) => console.error("Sorry could not load shops", err));
    },
  },
     created() {
    this.getCoffeeShops();

  },
  computed: {
    google: gmapApi,
    markers(){
      if(!this.google)
      {
        return []
      }
      console.log(this.google)
     return this.$store.state.coffeeShops.map((c)=>{
       const obj = {position: new this.google.maps.LatLng(c.latitude, c.longitude)}
       // console.log(obj)
       // console.log(obj.position)
      return obj
     })
    }
  }
}
</script>
<style>

</style>