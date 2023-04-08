<template>
<div>
    <h2>Coffee Shops</h2>
    <router-link :to="{name: 'home'}"> </router-link>
    All
    <p v-for="c in coffeeShops" v-bind:key="c.coffeeShopId">{{coffeeShop}}</p>
</div>

</template>

<script>
import CoffeeShopServices from "../services/CoffeeShopServices";

export default {
    name: "coffee-shops",
    computed: {
        coffeeShops() {
            return this.$store.state.coffeeShops;
        }
    },
    created() {
        CoffeeShopServices.getAllCoffeeShops().then((response) => {
            this.coffeeShop = response.data;
        })
        .catch(err => console.error("Sorry could not load shops", err))
    }
}
</script>

<style>

</style>
