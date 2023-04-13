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

.page{
 
}
.map{
  
 
}
.card{
  flex-direction: column;

}
</style>
