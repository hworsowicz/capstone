<template>
  <section>
      <coffee-shop-list />
      <img src="Images/Filler.jpg" alt="Coffee Cups">
      <h2>{{coffeeShopObject.shopName}}</h2>
      <p>{{coffeeShopObject.shopLocation}}</p>
      <p>{{coffeeShopObject.hasSpirits === true ? "This shop serves alcohol": "This shop does not serve alcohol"}}</p>
  </section>
</template>

<script>
import CoffeeShopList from '../components/CoffeeShopList.vue';

export default {
    components: {
        CoffeeShopList
    },
    computed: {
        coffeeShopObject(){
            let id = this.$route.params.coffeeShopId;
            let shop = {}
            shop = this.$store.state.coffeeShops.find(c => {
                if (c.coffeeeShopId == id){
                    return true;
                }
            })
            return shop;
        }
    }
}
</script>

<style>

</style>