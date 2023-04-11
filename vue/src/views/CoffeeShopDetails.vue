<template>
  <div>
    <h1 class="subheader">{{coffeeShop.shopName}}</h1>
    <h2>{{coffeeShop.hoursWeekdays}}</h2>
    <p class="about">{{coffeeShop.about}}</p>
     <p class="price">{{coffeeShop.priceRange}}</p>
    <coffee-shop-card/>


  </div>
</template>


<script>
import CoffeeShopServices from "../services/CoffeeShopServices.js";
import CoffeeShopCard from "../components/CoffeeShopCard.vue";

export default {
  components: {  CoffeeShopCard },
  data(){
      return{
          coffeeShop: undefined
      }
  },
  created(){
      CoffeeShopServices.getSingleCoffeeShop(this.$route.params.coffeeShopId)
      .then(response => {
          this.coffeeShop = response.data;
      })
      .catch (error => console.error('Could not load Coffee Shop', error))
  },
  methods: {

  }
}
</script>

<style>
.subheader {
    height: 50vh;
    width: 100%;
    background-image: linear-gradient(rgba(4,9,30,0.5),rgba(4,9,30,0.5)),url(../Images/staufscoffee.jpg);
    background-position:center;
    background-size: cover;
    text-align: center;
    color: white;
    
}

</style>