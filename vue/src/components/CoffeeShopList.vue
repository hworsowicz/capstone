<template>
<div>
    <h2>Coffee Shops</h2>
    <router-link :to="{name: 'home'}"> </router-link>
    <p v-for="c in coffeeShops" v-bind:key="c.coffeeShopId">{{c.shopName}}</p>
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
    methods: {
        getCoffeeShops(){
            CoffeeShopServices.getAllCoffeeShops()
        .then((response) => {
            this.$store.commit("SET_COFFEE_SHOPS", response.data);
        })
        .catch(err => console.error("Sorry could not load shops", err))
            }
    },
    created() {
        this.getCoffeeShops();
    }
}
</script>

<style>
div {
    font-family: 'Quicksand', sans-serif;
}

</style>
