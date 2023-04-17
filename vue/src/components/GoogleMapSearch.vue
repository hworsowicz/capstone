<template>

  <div class="container">
    

      <div id="content">
        <form class='form-inline'>
          <div class="input-group">
             <GmapAutocomplete  id='search' class="form-control search-form"  @place_changed="setPlace" />
            <span class="input-group-btn" style="width:39px">
              <button id="search-this" type="button" class="pull-right btn btn-default search-btn" @click="addMarker">Search
              </button>
            </span>
          </div>
        </form>
        <p class="text-center">Find coffee near you!</p>
        <GmapMap :center="center" :zoom="12" style="width:100%; height: 400px;">
      <GmapMarker
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        @click="center = m.position"
      />
      <GmapMarker
        :key="'coffee-shop-' + index"
        v-for="(coffeeShopMarker, index) in coffeeShopMarkers"
        :position="coffeeShopMarker.position"
        @click="center = coffeeShopMarker.position"
        icon="https://maps.google.com/mapfiles/ms/icons/red-dot.png"
      />
    </GmapMap>
    <coffee-shop-card />
  </div>
    </div>
</template>
<script>
import CoffeeShopCard from "../components/CoffeeShopCard.vue"
import { mapGetters } from "vuex";
import CoffeeShopServices from "../services/CoffeeShopServices";
export default {
  components: { CoffeeShopCard },
  name: "GoogleMap",
  computed: {
    ...mapGetters({
      coffeeShops: "coffeeShops",
    }),
  },
  data() {
    return {
      center: { lat: 39.99796, lng: -83.04213 },
      currentPlace: null,
      markers: [],
      coffeeShopMarkers: [],
      places: [],
    };
  },
  mounted() {
    this.geolocate();
    // Retrieve persisted markers and coffee shop markers from local storage
  const persistedMarkers = JSON.parse(localStorage.getItem('markers')) || [];
  const persistedCoffeeShopMarkers = JSON.parse(localStorage.getItem('coffeeShopMarkers')) || [];
  this.markers = persistedMarkers;
  this.coffeeShopMarkers = persistedCoffeeShopMarkers;
  },
  created() {
    this.getCoffeeShops();
    this.addCoffeeShopMarkers();
  },
  methods: {
    getCoffeeShops() {
      CoffeeShopServices.getAllCoffeeShops()
        .then((response) => {
          console.log(response.data);
          this.$store.commit("SET_COFFEE_SHOPS", response.data);
        })
        .catch((err) =>
          console.error("Sorry could not load shops", err)
        );
    },
    setPlace(place) {
      this.currentPlace = place;
    },
    addMarker() {
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng(),
        };
        this.markers.push({ position: marker });
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
        // Persist markers in local storage
        localStorage.setItem('markers', JSON.stringify(this.markers));
      }
    },
    addCoffeeShopMarkers() {
      const coffeeShops = this.$store.state.coffeeShops;
      for (let i = 0; i < coffeeShops.length; i++) {
        const coffeeShop = coffeeShops[i];
        const coffeeShopMarker = {
          position: { lat: coffeeShop.latitude, lng: coffeeShop.longitude },
        }
        this.coffeeShopMarkers.push(coffeeShopMarker);
        // Persist coffee shop markers in local storage
        localStorage.setItem('coffeeShopMarkers', JSON.stringify(this.coffeeShopMarkers));
      }
    },
    geolocate: function() {
      navigator.geolocation.getCurrentPosition(position => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };
      });
    }
  }
}
</script>
<style scoped>
.well {
  background-color: #FFFFEE
}
.search-form {
  border-radius: 30px 0 0 30px;
}
.input-group {
  width:100%;
}
input-group-btn {
  max-width:38px;
}
#search {
  border: 1px;
}
.search-btn {
  cursor:pointer;
  border-radius: 0 30px 30px 0;
  background-color:#fff;
  border-color:#669;
  padding-top: 6.5px;
}
.text-center {
  color: #fff;
}
</style>
