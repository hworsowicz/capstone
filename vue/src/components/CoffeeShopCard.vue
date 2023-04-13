<template>
  <div class="body">
    <div class="card">
      <img
        class="pic"
        :src="require('../Images/' + coffeeShop.imagePath)"
        alt="Coffee shop image"
      />
      <div class="card-text">
        <router-link class="name" v-bind:to="{ name: 'details', params: { coffeeShopId: coffeeShop.shopId },}">
          <h2 class="shop-name">{{ coffeeShop.shopName }}</h2>
        </router-link>
        <p class="location">{{ coffeeShop.shopLocation }}</p>
      </div>
      <div class="card-stats">
        <div class="stat">
          <div class="value">19</div>
          <div class="type">Likes</div>
        </div>

         <div class="stat border">
          <div class="value">$$$</div>
          <div class="type">Price</div>
        </div>

        <div class="stat">
        <button
          class="mark-fav"
          v-on:click.prevent="setFavorite(true)"
          v-if="!coffeeShop.isFavorite"
        >
          <i class="far fa-heart"></i>
        </button>
        <button
          class="mark-Notfav"
          v-on:click.prevent="setFavorite(false)"
          v-if="coffeeShop.isFavorite"
        >
          <i class="fas fa-heart" style="color: #f54747"></i>
        </button>
        </div>
      </div>
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
  display: grid;
  grid-template-columns: 300px;
  grid-template-rows: 210px 210px 80px;
  grid-template-areas: "image" "text" "stats";
  padding: 20px;
  border-radius: 18px;
  background: #fcdec0;
  box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.9);
  text-align: center;

  max-width: 70%;
  

  transition: .5s ease;
  cursor: pointer;
}

.card .pic {
  grid-area: image;
  border-top-left-radius: 15px;
  border-top-right-radius: 15px;
  
 
  width: auto;
  max-height: 100%;
  object-fit: cover;
}
.card-text {
  grid-area: text;
  margin: 25px;
}
.card-text h2 {
  color: grey;
  font-size: 15px;
  font-weight: 300;
}

.card-stats {
  grid-area: stats;
  font-size: 28px;
}
.card-stats {
  grid-area: stats;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 1fr;
  border-bottom-right-radius: 15px;
  border-bottom-left-radius: 15px;
  background: #8FC1D4;
}

.card-stats .stat{
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 10px;
  color: white;
}

.card-stats .type{
  font-size: 11px;
  font-weight: 300;
  text-transform: uppercase;
}
.card-stats .border{
  border-left: 1px solid #8FC1D4;
  border-right: 1px solid #8FC1D4;
}

.card-stats .value{
   font-size: 22px;
   font-weight: 500;
}
.card:hover{
  transform: scale(1.2);
  box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.6);
}


.card p.location {
  font-size: 10px;
  padding-left: 7px;
}
.card .name {
  text-decoration: none;

}
.card .name:hover {
  text-decoration: underline;
}

.mark-fav{
  background: none;
  border: none;
  
}
.mark-Notfav{
  background: none;
  border: none;
}
</style>
