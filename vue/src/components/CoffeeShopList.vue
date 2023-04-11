<template>
<div class="coffee-shop-list">
    <h2>Coffee Shops</h2>
    <router-link :to="{name: 'home'}"> </router-link>
    <coffee-shop-card  v-bind:coffeeShop="c" v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId"/>
   <!-- <coffee-shop-details v-bind:coffeeShop="c" v-for="c in this.$store.state.coffeeShops" v-bind:key="c.coffeeShopId"/>-->
</div>

</template>

<script>
import CoffeeShopServices from "../services/CoffeeShopServices";
import CoffeeShopCard from "../components/CoffeeShopCard.vue";
//import CoffeeShopDetails from "../views/CoffeeShopDetails.vue";

export default {
    name: "coffee-shops",
    components:{
        CoffeeShopCard
    },
  
    methods: {
        getCoffeeShops(){
            CoffeeShopServices.getAllCoffeeShops()
        .then((response) => {
            console.log(response.data)
            this.$store.commit("SET_COFFEE_SHOPS", response.data);
        })
        .catch(err => console.error("Sorry could not load shops", err))
            }
    },
         computed: {
        coffeeShops() {
            return this.$store.state.coffeeShops;
        }
    },
    created() {
        this.getCoffeeShops();
    }
}
</script>

<style>
div .coffee-shop-list {
    font-family: 'Quicksand', sans-serif;
    background-color: #FCDEC0;
    display: grid;
    grid-template-areas: "card card map";
    grid-template-columns: 1fr 1fr 2fr;
}



</style>
