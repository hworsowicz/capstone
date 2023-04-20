<template>
  <section v-scrollanimation class="page">
    <h1 class="hasNoFavs" v-if="favoriteShops.length === 0">Looks like you haven't favorited any shops, <router-link v-bind:to="{ name: 'coffeeShops' }" class="link"><span>let's check some out!</span>
            </router-link> </h1>
    <h1 class="hasFavs" v-if="favoriteShops.length >= 1">{{$store.state.user.username}}, Great Choices!</h1>
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
.hasFavs{
  padding-top: 100px;
  color: #fff;
  text-transform: capitalize; /* this will capitalize the first letter*/
  text-align: center;
  text-shadow: 2px 2px black;
}


.hasNoFavs{
 padding-top: 100px;
 color: #fff;
 text-transform: capitalize;
 text-shadow: 2px 2px black;
 text-align: center;
 
}
.link{
  color: #fff;
  position: relative;
 
  
}
.link:hover{
  color: rgb(151, 196, 223);
}


</style>