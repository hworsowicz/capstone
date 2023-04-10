<template>
    <div>

     <div class="card">
      <router-link v-bind:to="{name: 'home'}">
      <h2 class="shop-name">{{coffeeShop.shopName}}</h2>
      </router-link>
      <img src="../../Images/Filler.jpg" alt="Coffee Cups" />
      <p class="location">{{coffeeShop.shopLocation}}</p>
  </div>

    </div>

</template>

<script>


export default {
  components: { },
    name: "coffee-card",
    props: {
        coffeeShop: Object,
    },
   
}
</script>

<style>
.card{
    border: 2px solid black;
    border-radius: 10px;
    width: 250px;
    height: 300px;
    margin: 20px;
}
.card .shop-name{
    font-size: 1.5rem;
}
.card .location {
    font-size: 1.5;
}
</style>