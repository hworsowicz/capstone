<template>
    <div>
     <div class="card">
      <img class="pic" :src="require('../Images/' + coffeeShop.imagePath)" alt="Coffee shop image" />
      <router-link class="name" v-bind:to="{name: 'details', params: {coffeeShopId: coffeeShop.shopId}}">
      <h2 class="shop-name">{{coffeeShop.shopName}}</h2>
      </router-link>
      <p class="location">{{coffeeShop.shopLocation}}</p>
      <button class="mark-fav" v-on:click.prevent="setFavorite(true)" v-if="!coffeeShop.isFavorite"><i class="far fa-heart"></i></button>
      <button class="mark-Notfav" v-on:click.prevent="setFavorite(false)" v-if="coffeeShop.isFavorite"><i class="fas fa-heart" style="color: #f54747;"></i>
</button>
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
    methods: {
        setFavorite(value)
        {
            this.$store.commit("SET_USER_FAVORITES_STATUS", {coffeeShop: this.coffeeShop, value: value});
        }
    }
   
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