<template>
  <section class="page">
      <p class="map-button"><span class="text-list-map">Coffee Shops</span> <router-link v-bind:to="{ name: 'mapview' }" 
              ><button class="viewmap"><i class="fas fa-map-marked-alt"></i> Map</button>
            </router-link></p> 
      
  
      <div class="cards">
        <div  v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId">
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
.map-button{
  margin-top: 100px;
  padding-left: 10px;
  color: white;
}

.viewmap{
  margin-left: 15px;
  padding: 0 5px 0 5px;
  border: none;
  border-radius: 10px;

}
.text-list-map{
  font-size: 30px;
}
.viewmap:hover{
  background-color: #8fc1d4;
  color: white;
  transition: .5s;
  border: none;
 box-shadow: 7px 7px 15px rgb(36, 35, 35);
}
iframe{
  padding: 1% ;
  border-radius: 20px;
}



</style>
