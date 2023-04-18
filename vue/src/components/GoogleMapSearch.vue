<template>
  <div>
    <gmap-place-input @place_changed="setPlace" />
    <GmapMap
      :center="{ lat: 39.97745, lng: -83.038221 }"
      :zoom="12"
      map-type-id="terrain"
      style="width: 500px; height: 300px"
    >
    <DirectionsRenderer
      :directions="directions"  />
      <GmapMarker :position="userPosition"> </GmapMarker>
      <GmapMarker
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        :clickable="true"
        :draggable="true"
        @click="center = m.position"
      />
    </GmapMap>
  </div>
</template>
<script>
import CoffeeShopServices from "../services/CoffeeShopServices";
import { gmapApi } from "vue2-google-maps";
import DirectionsRenderer from '../services/DirectionsRenderer';

export default {
  components: {DirectionsRenderer},
  data() {
    return {
      place: null,
      directions: null,
      //destination will need to be a selected shop, which will be a list that is its own component
    };
  },
  methods: {
    async setPlace(place) {
      this.place = place;
      this.directions = await this.getDirections();
    },
    async getDirections(){
        const directionsService = new this.google.maps.DirectionsService();
        const origin = new this.google.maps.LatLng(
          this.place.geometry.location.lat(),
          this.place.geometry.location.lng()
        )
        const route = await directionsService.route({
          destination:  new this.google.maps.LatLng(this.selectedShop.latitude, this.selectedShop.longitude),
          origin: origin,
          travelMode: 'DRIVING'
        });
        console.log(route);
        return route;
    },

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
    selectedShop(){
        return this.$store.state.coffeeShops[0]
        //will remove this from computed 
    },
    google: gmapApi,
    userPosition() {
      return (
        this.google &&
        this.place &&
        new this.google.maps.LatLng(
          this.place.geometry.location.lat(),
          this.place.geometry.location.lng()
        )
      );
    },
    markers() {
      if (!this.google) {
        return [];
      }
      console.log(this.google);
      return this.$store.state.coffeeShops.map((c) => {
        const obj = {
          position: new this.google.maps.LatLng(c.latitude, c.longitude),
        };
        // console.log(obj)
        // console.log(obj.position)
        return obj;
      });
    },
  },
};
</script>
<style>
</style>
