<template>
  <section class="page">
      <h2>Coffe Shop List</h2>
       <router-link v-bind:to="{ name: 'mapview' }" 
              ><button>View on Map</button>
            </router-link>
  
      <div class="cards">
        <div class="flex-card" v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId">
      <coffee-shop-card v-bind:coffeeShop="c" /> 
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
    CoffeeShopCard 
 
  },
  data() {
    return{
      toggle: false,
      selectDisplayType() {
        this.toggle = !this.toggle;

      }
    }
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
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    row-gap: 100rem;
    column-gap: 1rem;
    padding: 25px 10px 10px 0px;
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

.page{
  margin-top: 100px;
  background-image: url('../Images/hands.jpg');
  min-width: 100%;
  height: 140vh;
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  opacity: .8;
      background-size: cover;
  

}

iframe{
  padding: 1% ;
  border-radius: 20px;
}



</style>
