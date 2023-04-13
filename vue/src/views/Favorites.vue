<template>
  <section class="page">
      <router-link :to="{ name: 'home' }"> </router-link>
      <div class="cards">
        <div class="flex-card" v-for="c in favoriteShops" v-bind:key="c.coffeeShopId">
      <coffee-shop-card v-bind:coffeeShop="c" v-if="c.isFavorite"/> 
        </div>
      </div>
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
    favoriteShops() {
        return this.$store.state.coffeeShops.filter (c => {
            return c.isFavorite === true;
        })
    }
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
    row-gap: 1rem;
    column-gap: 1rem;
}