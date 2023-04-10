<template>
    <div>
     <div class="card">
      <img class="pic" :src="require('../Images/' + coffeeShop.imagePath)" alt="Coffee Cups" />
      <router-link class="name" v-bind:to="{name: 'details', params: {coffeeShopId: coffeeShop.shopId}}">
      <h2 class="shop-name">{{coffeeShop.shopName}}</h2>
      </router-link>
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
    width: 150px;
    height: 200px;
    margin: 20px;
    background: rgba(58, 147, 206, 0.692);
    
}

.card .shop-name{
    font-size: .75rem;
    font-weight: bold;
    color: #FCDEC0;
    
}
.card p.location {
    font-size: 10px;
    padding-left: 7px;
}
.card .name {
    text-decoration: none;
    padding-left: 7px;
}
.card .name:hover {
    text-decoration: underline;
}
.pic{
 border-radius: 10px;
 height: 200px; 


}
</style>