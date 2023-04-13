<template>
 <div class="card">
  <div class="img">
    <img class="pic" :src="require('../Images/' + coffeeShop.imagePath)" alt="Coffee shop image"/>
  
  <button 
          class="save"
          v-on:click.prevent="setFavorite(true)"
          v-if="!coffeeShop.isFavorite"
        >
          <i class="far fa-heart"></i>
        </button>
        <button
          class="save"
          v-on:click.prevent="setFavorite(false)"
          v-if="coffeeShop.isFavorite"
        >
          <i class="fas fa-heart" style="color: #F54747"></i>
        </button>
  </div>

  <div class="text">
    <p class="h3"> {{coffeeShop.shopName}} </p>
    <p class="p"> {{coffeeShop.shopLocation}}</p>
      <router-link class="name" v-bind:to="{ name: 'details', params: { coffeeShopId: coffeeShop.shopId },}">
      <p class="span">Tell Me More</p>
      </router-link>
  </div>
    </div>

</template>

<script>
import UserServices from '../services/UserServices';
export default {
  components: {},
  name: "coffee-card",
  props: {
    coffeeShop: Object,
  },
  methods: {
    setFavorite(value) {
      UserServices.getUserFavorites() 
      this.$store.commit("SET_USER_FAVORITES_STATUS", {
        coffeeShop: this.coffeeShop, 
        value: value,
      
      });
      
    },
    created() {
      this.getUserFavorites()
      if(this.coffeeShop.isFavorite === true)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    
  },
};
</script>

<style>
/* Beginning of card*/
.card {
  width: 252px;
  height: 265px;
  background: white;
  border-radius: 30px;
  box-shadow: 15px 15px 30px #c68b59,
             -15px -15px 30px #c68b59;
  transition: 0.2s ease-in-out;
}
.img img{
  background-size: cover;
  background-repeat:  no-repeat;
  background-position: center, center;
  
<<<<<<< HEAD

  transition: .5s ease;
  cursor: pointer;

=======
>>>>>>> 92cbe6fefff62fd932c78aa198fcc69f13830b3c
}
.img {
  width: 100%;
  height: 50%;
  border-top-left-radius: 30px;
  border-top-right-radius: 30px;
  display: flex;
 
  background: linear-gradient(rgba(0, 0, 0, 0.5), #fff5),
    url(../Images/back1.png);
  align-items: top;
  justify-content: right;
 
}

.save {
  transition: 0.2s ease-in-out;
  border-radius: 10px;
  margin: 20px;
  width: 30px;
  height: 30px;
  background-color: #ffffff;
  
  display: flex;
  align-items: center;
  justify-content: center;
}

.text {
  margin: 20px;
  display: flex;
  flex-direction: column;
  align-items: space-around;
}

.save .svg {
  transition: 0.2s ease-in-out;
  width: 15px;
  height: 15px;
}

.icon-box {
  margin-top: 15px;
  width: 70%;
  padding: 10px;
  background-color: #e3fff9;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: left;
}

.icon-box svg {
  width: 17px;
}

.text .h3 {
  font-family: 'Lucida Sans' sans-serif;
  font-size: 15px;
  font-weight: 600;
  color: black;
}

.text .p {
  font-family: 'Lucida Sans' sans-serif;
  color: #999999;
  font-size: 13px;
}

.icon-box .span {
  margin-left: 10px;
  font-family: 'Lucida Sans' sans-serif;
  font-size: 13px;
  font-weight: 500;
  color: #865439;
}

.card:hover {
  cursor: pointer;
  box-shadow: 0px 10px 20px rgba(0,0,0,0.1);
}

.save:hover {
  transform: scale(1.1) rotate(10deg);
}

.save:hover .svg {
  fill: #ced8de;
}
</style>
