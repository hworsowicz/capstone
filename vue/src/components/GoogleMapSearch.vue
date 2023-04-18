<template>
  <div>
    <gmap-place-input @place_changed="setPlace" />
    <GmapMap
      :center="{ lat: 39.97745, lng: -83.038221 }"
      :zoom="12"
      map-type-id="terrain"
      style="width: 500px; height: 300px"
    >
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

export default {
  data() {
    return {
      place: null,
    };
  },
  methods: {
    setPlace(place) {
      this.place = place;
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