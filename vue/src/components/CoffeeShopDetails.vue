<template>
  <section>
      <coffee-shop-list />
      <img src="Images/Filler.jpg" alt="Coffee Cups">
      <h2>{{coffeeShop.shopName}}</h2>
      <p>{{coffeeShop.shopLocation}}</p>
      <p>{{coffeeShop.hasSpirits === true ? "This shop serves alcohol": "This shop does not serve alcohol"}}</p>
  </section>
</template>

<script>
import CoffeeShopList from '../components/CoffeeShopList.vue';

export default {
    components: {
        CoffeeShopList
    }
}
</script>

<style>

</style>