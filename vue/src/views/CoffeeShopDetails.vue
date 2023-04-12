<template>
  <div class="body">
    <h1 class="subheader">{{coffeeShop.shopName}}</h1>
    
    <img src="../Images/staufsMap.jpg" alt="map for staufs">
    <h2 class="hours">{{coffeeShop.hoursWeekdays}}</h2>

    <p class="about"><strong>About {{coffeeShop.shopName}}: </strong>{{coffeeShop.about}}
    <br>
    <br>
    <br>
    <strong> {{coffeeShop.hoursWeekdays}}</strong>
    <br><a href="https://www.google.com/maps/place/Stauf's+Coffee+Roasters/@39.9495856,-82.9978752,17z/data=!4m6!3m5!1s0x88388f4b7be30795:0xb4a07466b704923!8m2!3d39.9495856!4d-82.9956865!16s%2Fg%2F1tghq7lx">{{coffeeShop.shopLocation}}</a> </p>
     <p class="price">{{coffeeShop.priceRange}}</p>
     <img class = "menu" src="../Images/staufs menu.jpg" alt="stauf's menu">
    <div class="picture-grid">
      <img src="../Images/staufsgvbuilding.jpg" alt="staufs GV building" class="grid-imgs p1">
      <img src="../Images/staufsmatcha.jpg" alt= "staufs matcha" class="grid-imgs p4">
      <img src ="../Images/staufscoffee.jpg" alt= "staufs coffee" class="grid-imgs p3">
      <img src = "../Images/staufslogo.jpg" alt = "logo" class="grid-imgs p2">
      </div>
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
          coffeeShop: {}
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
div .body{
  font-family: 'Quicksand', sans-serif;
  display: grid;
  grid-template-areas: 
  "header header"
   "map about"
   "menu pics";
   row-gap: 5px;
}
.subheader {
    height: 50vh;
    width: 100vw;
    background-image: url(../Images/staufsCoffeehear.jpg);
    background-position:center;
    background-size: cover;
    text-align: center;
    color: white;
    grid-area: header;
   
}
.about{
 padding: 30px 0 25px;
 font-family: 'Quicksand', sans-serif;
 grid-area: about;
 padding-left: 15px;

}
.about a{
   color: black;
 
}

.body{
  background-color: #FCDEC0;
  
}
img{
  width: 50vw;
  padding-top: 30px;
  grid-area: map;
 
}
.hours{
  font-size: 15px;
  font-family: 'Quicksand', sans-serif;
  padding-top: 50px;
  grid-area: hours;
}
img.menu {
  grid-area: menu;
}
.picture-grid{
  grid-area: pics;
  display: grid;
  grid-template-areas: "pic1 pic2"
                      "pic3 pic4";
  grid-template-rows: 1fr 1fr;
  grid-template-columns: 1fr 1fr;
  
}
.grid-imgs {
  grid-area: pic;
  width: 25vw;
  display: grid;
  padding-left: 15px;
}

.p1 {
  grid-area: pic1;
}

.p2 {
  grid-area: pic2;
}

.p3 {
  grid-area: pic3;
}

.p4 {
  grid-area: pic4;
}

</style>