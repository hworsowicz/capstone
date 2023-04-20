<template>
  <section class="page">
    <div class="list-banner">

      <p class="map-button"><span class="text-list-map">Coffee Shops</span> <router-link v-bind:to="{ name: 'mapview' }" 
              ><button class="viewmap"><i class="fas fa-map-marked-alt"></i> Map</button>
            </router-link></p> 
    </div>
      
  
      <div class="cards">
        <div v-scrollanimation v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId">
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
/* .list-banner{
  background-color:rgb(218, 193, 171);
  margin: 0 40% 0 40%;
  border-radius: 20px;
  box-shadow: 2px 2px black;
} */
.cards {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    row-gap: 10px;
    column-gap: 1rem;
    padding: 15px 10px 30px 0px;
   
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

.map-button{
  text-align: center;
  margin-top: 100px;
  padding-left: 20px;
  color: white;
 
  
}

.viewmap{
  margin-left: 15px;
  padding: 0 5px 0 5px;
  border: none;
  border-radius: 10px;
   box-shadow: 2px 2px 2px black;
}
.text-list-map{
  font-size: 30px;
  text-shadow: 2px 2px black
}
.viewmap:hover{
  background-color: #8fc1d4;
  color: white;
  transition: .5s;
  border: none;
 box-shadow: 2px 2px 2px black;
}
iframe{
  padding: 1% ;
  border-radius: 20px;
}
/* Scroll animation below. Check directives/scrollanimation for js */
.before-enter{
  opacity: 0;
  transform: translateX(100px);
  transition: all 2s ease-out;
}

.enter{
  opacity: 1;
  transform: translateX(0px)
}




</style>
