<template>
  <div>
        <p class="homeSearchAddress" v-if="selectedShop != null">
      Here is the closest shop near you: <router-link
        class="list-coffee"
        v-bind:to="{
          name: 'details',
          params: { coffeeShopId: findShop.shopId },
        }"
      >{{ findShop.shopName }}!</router-link>
      <br> Want something different? <router-link class="list-coffee" v-bind:to="{ name: 'coffeeShops' }">See all coffee shops</router-link>
    </p>
    <gmap-place-input  class="map-search"
      @place_changed="setPlace"
      placeholder="Enter your location"
    />
    <GmapMap
      :center="{ lat: 39.97745, lng: -83.038221 }"
      :zoom="12"
      map-type-id="terrain"
      style="width: 1000px; height: 650px"
    >
      <DirectionsRenderer :directions="directions" />
      <GmapMarker :position="userPosition" />
      <GmapMarker
        v-if="closestShop"
        :position="closestShop.position"
        :clickable="true"
        :draggable="true"
        @click="
          center = closestShop.position;
          selectedShop = closestShop;
          displayDirections();
        "
      />
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
import DirectionsRenderer from "../services/DirectionsRenderer";
export default {
  components: { DirectionsRenderer },
  data() {
    return {
      place: null,
      directions: null,
      selectedShop: null,
      //destination will need to be a selected shop, which will be a list that is its own component
    };
  },
  methods: {
    setPlace(place) {
      this.place = place;
      const distances = this.markers.map((marker) => {
        const lat = marker.position.lat();
        const lng = marker.position.lng();
        const distance = this.distance(
          lat,
          lng,
          this.place.geometry.location.lat(),
          this.place.geometry.location.lng()
        );
        return { marker, distance };
      });
      distances.sort((a, b) => a.distance - b.distance);
      this.closestShop = distances[0].marker;
      this.selectedShop = this.closestShop;
      this.displayDirections(); // call the displayDirections() method here
    },
    async displayDirections() {
      const route = await this.getDirections();
      this.directions = route;
    },
    distance(lat1, lng1, lat2, lng2) {
      const R = 6371e3; // metres
      const φ1 = (lat1 * Math.PI) / 180;
      const φ2 = (lat2 * Math.PI) / 180;
      const Δφ = ((lat2 - lat1) * Math.PI) / 180;
      const Δλ = ((lng2 - lng1) * Math.PI) / 180;
      const a =
        Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
        Math.cos(φ1) * Math.cos(φ2) * Math.sin(Δλ / 2) * Math.sin(Δλ / 2);
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      const d = R * c;
      return d;
    },
    async getDirections() {
      const directionsService = new this.google.maps.DirectionsService();
      const origin = new this.google.maps.LatLng(
        this.place.geometry.location.lat(),
        this.place.geometry.location.lng()
      );
      const destination = new this.google.maps.LatLng(
        this.selectedShop.position.lat(),
        this.selectedShop.position.lng()
      );
      return new Promise((resolve, reject) => {
        directionsService.route(
          {
            origin: origin,
            destination: destination,
            travelMode: "DRIVING",
          },
          (result, status) => {
            if (status === "OK") {
              resolve(result);
            } else {
              reject(status);
            }
          }
        );
      });
    },
    getCoffeeShops() {
      CoffeeShopServices.getAllCoffeeShops()
        .then((response) => {
          this.$store.commit("SET_COFFEE_SHOPS", response.data);
        })
        .catch((err) => console.error("Sorry could not load shops", err));
    },
  },
  created() {
    this.getCoffeeShops();
  },
  computed: {
    findShop() {
      console.log(this.$store.state.coffeeShops[5].latitude);
      console.log(this.selectedShop.position.lat());
      let foundShop = this.$store.state.coffeeShops.find(
        (s) => s.latitude === this.selectedShop.position.lat()
      );
      console.log(foundShop);
      return foundShop;
    },
    closestShop() {
      if (!this.place) {
        return null;
      }
      const distances = this.markers.map((marker) => {
        const lat = marker.position.lat();
        const lng = marker.position.lng();
        const distance = this.distance(
          lat,
          lng,
          this.place.geometry.location.lat(),
          this.place.geometry.location.lng()
        );
        return { marker, distance };
      });
      distances.sort((a, b) => a.distance - b.distance);
      return distances[0].marker;
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
.homeSearchAddress {
  color: white;
  font-size: 30px;
}
.list-coffee{
  color: #fff;
  position: relative;
}
.list-coffee:hover{
  color: rgb(151, 196, 223);
}
/*
.map-search{
    width: 100%;
    border-radius: 30px 0 0 30px;
     background-color: #FFFFEE
}*/
</style>