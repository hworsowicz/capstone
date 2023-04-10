<template>
  <div>
    <h1>Hi {{ coffeeShop.shopName }}</h1>
  
    <coffee-shop-card :coffeeShop="coffeeShop" v-if="coffeeShop" />

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
      CoffeeShopServices.getSingleCoffeeShop(+this.$route.params.ShopId)
      .then(response=> {
          this.coffeeShop = response.data;
      })
      .catch (error => console.error('Could not load Coffee Shop', error))
  }
}
</script>

<style>
</style>