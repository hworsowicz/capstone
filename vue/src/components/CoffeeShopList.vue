<template>
  <section class="page">
      <h2></h2>
      <router-link :to="{ name: 'home' }"> </router-link>
      <div class="cards">
        <div class="flex-card" v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId">
      <coffee-shop-card v-bind:coffeeShop="c" /> 
        </div>
       
      </div>
      <iframe src="https://my.atlistmaps.com/map/2c9cf803-873d-4c73-b722-d3ead35a7629?share=true" allow="geolocation 'self' https://my.atlistmaps.com" width="100%" height="400px" frameborder="0" scrolling="no" allowfullscreen></iframe>
      <!-- <coffee-shop-details v-bind:coffeeShop="c" v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId"/>-->
      <!--<div class="map">
        <img  src="../Images/Columbus-Map.jpg" alt="Columbus Map" />
      </div>-->
  </section>
  
</template>

<script>
import CoffeeShopServices from "../services/CoffeeShopServices";
import CoffeeShopCard from "../components/CoffeeShopCard.vue";
import UserServices from "../services/UserServices.js";
//import CoffeeShopDetails from "../views/CoffeeShopDetails.vue";

export default {
  name: "coffee-shops",
  components: {
    CoffeeShopCard,
  },

  methods: {
    getCoffeeShops() {
      CoffeeShopServices.getAllCoffeeShops()
        .then((response) => {
          console.log(response.data);
          this.$store.commit("SET_COFFEE_SHOPS", response.data);
        })
        .catch((err) => console.error("Sorry could not load shops", err));
    },
    getUserFavorites() {
      UserServices.getUserFavorites()
        .then((response) => {
          this.$store.commit("SET_USER_FAVORITES_STATUS", response.data);
        })
        .catch((err) => console.error("Sorry could not load favorites", err));
    },
    
  },
  computed: {
    coffeeShops() {
      return this.$store.state.coffeeShops;
    },
  },
  created() {
    this.getCoffeeShops();
  },
};
</script>

<style>
.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    row-gap: 5rem;
    column-gap: 1rem;
}
/*.page{
  margin-top: 100px;
  background: url("../Images/splash.jpg");
  width: 100%;
  height: 100%;
  border: 5px solid none;
  box-sizing: border-box;
  background-size: contain;
}
*/

body{
  margin-top: 100px;
  background: #FCDEC0;
  width: 100%;
  height: 100%;
  border: 5px solid none;
  box-sizing: border-box;
  background-size: contain;
}

iframe{
  padding: 1% ;
  border-radius: 20px;
}



</style>
