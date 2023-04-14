<template>
 <div class="card">
  <div class="img">
    <img class="pic" :src="require('../Images/' + coffeeShop.imagePath)" alt="Coffee shop image"/>
  
  
  </div>

  <div class="text">
    <p class="h3"> {{coffeeShop.shopName}} </p>
    <p class="p"> {{coffeeShop.shopLocation}}</p>
      <router-link class="name" v-bind:to="{ name: 'details', params: { coffeeShopId: coffeeShop.shopId },}">
         
      <p class="span">Tell Me More</p>
       <button 
          class="save"
          v-on:click.prevent="addToUserFavorites()"
          v-if="!coffeeShop.isFavorite"
        >
          <i class="far fa-heart"></i>
        </button>
        <button
          class="save"
          v-on:click.prevent="removeUserFav()"
          v-if="coffeeShop.isFavorite"
        >
          <i class="fas fa-heart" style="color: #F54747"></i>
        </button>
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
    addToUserFavorites() {
      console.log("dylan")
      const shop = {shopId: this.coffeeShop.shopId}
      console.log(shop.id)
      UserServices.addToUserFavorites(shop)
      .then(response => {
         if (response.status == 200){
           this.setFavorite(true);
        }
       })
    },

    // Removes a favorite from logged in users favorites while also changing the heart icons color from red to empty(white)
    removeUserFav() {
      const shop = {shopId: this.coffeeShop.shopId}
      UserServices.removeFromUserFavorites(shop)
      .then(response => {
        if (response.status == 200){
          this.setFavorite(false); // Set heart to not red
        }
      })
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
  width: 210px;
  height: 425px;
  background: white;
  border-radius: 30px;
  text-align: center;

  box-shadow: 7px 7px 15px rgb(102, 102, 102) ;
  transition: 0.2s ease-in-out;
}
.card .pic{
 width: 100%;
 max-height: 100%;
 object-fit: cover;
 border-radius: 30px 30px 0 0;
  
}
.img {
  width: 100%;
  height: 50%;
  border-top-left-radius: 30px;
  border-top-right-radius: 30px;
  background: linear-gradient(rgba(0, 0, 0, 0.5), #fff5);
  
}

.save {
  transition: 0.2s ease-in-out;
  border-radius: 10px;
  margin: 3px;
  width: 30px;
  height: 30px;
  background: none;
  border: none;
  
 

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
  width: 50px;
}

.text .h3 {
  font-family: 'Quicksand', sans-serif;
  font-size: 15px;
  font-weight: 600;
  
}

.text .p {
 font-family: 'Quicksand', sans-serif;
  color: #999999;
  font-size: 13px;
  border: black;
}

.icon-box .span {
  margin-left: 10px;
  font-family: 'Quicksand', sans-serif;
  font-size: 13px;
  font-weight: 500;
  color: #395186;
}


.card:hover {
  cursor: pointer;
  box-shadow: 0px 10px 20px rgba(0,0,0,0.1);
  
  transform: scale(1.1);
  box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.6);

}

.save:hover {
  transform: scale(1.1) rotate(10deg);
}

.save:hover .svg {
  fill: #ced8de;
}

</style>
