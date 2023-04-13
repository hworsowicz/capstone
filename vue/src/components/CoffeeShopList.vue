<template>
  <section class="page">
    <div class="coffee-shop-list">
      <h2>Coffee Shops</h2>
      <router-link :to="{ name: 'home' }"> </router-link>
      <div class="card">
      <coffee-shop-card
        v-bind:coffeeShop="c"
        v-for="c in this.$store.state.coffeeShops"
        v-bind:key="c.coffeeShopId"
      /> </div>
      <!-- <coffee-shop-details v-bind:coffeeShop="c" v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId"/>-->
      <div class="map">
        <img  src="../Images/Columbus-Map.jpg" alt="Columbus Map" />
      </div>
    </div>
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
<<<<<<< HEAD
.page {
  display: grid;
  grid-template-areas: "card card map";
  grid-template-columns: 1fr 1fr 2fr;
=======
.page{
 

>>>>>>> 92cbe6fefff62fd932c78aa198fcc69f13830b3c
}
.map{
  
 
}
.card{
  flex-direction: column;

  
}
</style>
