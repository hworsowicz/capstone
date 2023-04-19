<template>
  <div class="bodyDetails">
    <section id="banner">
      <h1 class="banner-text">{{ coffeeShop.shopName }}</h1>
    </section>
    <section id="feature">
      <div class="title-text">
        <h1>About {{ coffeeShop.shopName }}</h1>
        <p>
          {{ coffeeShop.hoursWeekdays }}
          <br />
          {{ coffeeShop.shopLocation }}
          <br> {{coffeeShop.priceRange}}
        </p>
      </div>
      <div class="feature-box">
        <div class="features">
          <h1 class="animate__fadeInLeft">Our Story:</h1>
          <div class="features-desc">
            <div class="feature-text">
              <p class="animate__fadeInLeft">{{ coffeeShop.about }}</p>
            </div>
          </div>
        </div>
        <div class="features-img">
          
       <GmapMap
      :center="{ lat: coffeeShop.latitude, lng: coffeeShop.longitude }"
      :zoom="16"
      map-type-id="terrain"
      style="width: 700px; height: 400px"
    >
      <GmapMarker 
      :position="{ lat: coffeeShop.latitude, lng: coffeeShop.longitude }"
       :clickable="true"
        :draggable="true" />
       </GmapMap>
   
        </div>
      </div>

    </section>
    <section id="photos">
      <div>
        <h1></h1>
        <br>
      </div>
      <div class="photo-box">
            <div class="single-photo">
               <img :src="require('../Images/' + coffeeShop.gallery1)" />
            </div>
            <div class="single-photo">
             <img :src="require('../Images/' + coffeeShop.gallery3)" />
            </div>
            <div class="single-photo">
              <img :src="require('../Images/' + coffeeShop.gallery2)" />
            </div>
            <div class="single-photo">
             <img :src="require('../Images/' + coffeeShop.gallery4)" />
            </div>
      </div>

    </section>
    <div class="features-menu">
         
     <img :src="require('../Images/' + coffeeShop.menu)" />
        </div>
    
    

    <coffee-shop-card />
  </div>
</template>


<script>
import 'animate.css';
import CoffeeShopServices from "../services/CoffeeShopServices.js";
import CoffeeShopCard from "../components/CoffeeShopCard.vue";
import { gmapApi } from "vue2-google-maps";


export default {
  components: { CoffeeShopCard },
  data() {
    return {
      coffeeShop: {},
      
    };
  },
  created() {
    CoffeeShopServices.getSingleCoffeeShop(this.$route.params.coffeeShopId)
      .then((response) => {
        this.coffeeShop = response.data;
         console.log(this.coffeeShop)
      })
      .catch((error) => console.error("Could not load Coffee Shop", error));
  },
/*  methods:{
 markers() {
      if (!this.google) {
        return [];
      }
      return CoffeeShopServices.getSingleCoffeeShop(this.$route.params.coffeeShopId).map((c) => {
        const obj = {
          position: new this.google.maps.LatLng(c.latitude, c.longitude),
        };
        // console.log(obj)
        // console.log(obj.position)
        return obj;
      })
 }
  },*/
    computed:{
      google: gmapApi,
    }
};
</script>

<style>

#banner {
  background: linear-gradient(rgba(0, 0, 0, 0.6), #fff5),
    url(../Images/cafe.jpg);
  background-size: cover;
  background-position: center;
  height: 100vh;
  margin: 0;

}
.bodyDetails{
  background-image: url('../Images/beige.jpg');
  min-width: 100%;
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  background-size: cover;
}
.banner-text {
  text-align: center;
  color: #fff;
  padding-top: 350px;
  font-size: 110px;
  text-shadow: 2px 2px black;
  
}
#feature{
  width: 100%;
  padding: 50px 0;
}

.title-text {
  text-align: center;
  padding-bottom: 70px;
}
.title-text h1 {
  font-size: 50px;
  color: #000;
}
.title-text p {
  margin: auto;
  font-size: 20px;
  color: #000;
  font-weight: bold;
  position: relative;
  z-index: 1;
  display: inline-block;
}
.feature-box{
  width: 80%;
  margin: auto;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  text-align: left;
}

.features-img {
  flex-basis: 50%;
  margin: auto;
}
.features-img img{
  width: 90%;
  border-radius: 10px;
}
.features h1{
  text-align: left;
  margin-bottom: 10px;
  font-weight: 100;
  color: #000;

}
.features-desc {
  display: flex;
  align-items: center;
  margin-bottom: 40px;
}
.feature-text p{
  padding: 0 20px;
  text-align: initial;
  font-size: 20px;
  color: #000;
  
}
.animate__fadeInLeft{
  animation-duration: 1.7s;
  animation-delay: 1s;
}
.features-menu{
    width: 90%;
  border-radius: 10px;
  align-items: center;
 
}
.features-menu img{
  width: 90%;
  border-radius: 10px;
  align-items: center;
  padding-left: 20%;
   margin-bottom: 20px;
}
@media screen and (max-width: 770px) {
  .title-text h1{
    font-size: 35px;
  }
  .features{
    flex-basis: 100%;
  }
  .features-img {
  flex-basis: 100%;
  } 
  .features-img img{
    width: 100%
  }
  .single-photo{
    flex-basis: 100%;
    margin-bottom: 30px;
  }
  .features-map {
  flex-basis: 100%;
  } 
  .features-map img{
    width: 100%
  }
  .banner-text{
  text-align: center;
  color: #fff;
  padding-top: 170px;
  font-size: 80px;
  }

}
#photos{
  width: 100%;
  padding: 70px 0;

}


.photo-box{
  width: 80%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  margin:auto;
  
}
.single-photo{
  flex-basis: 48%;
  text-align: center;
  border-radius: 7px;
  margin-bottom: 15px;
  color: #fff;
}
.single-photo img{
  width: 100%;
  border-radius: 7px;
}
.single-photo img:hover{
  transform: scale(1.1);
  -webkit-transform: rotate(-6deg);
  -moz-transform: rotate(-6deg);
  -o-transform: rotate(-6deg);
  -ms-transform: rotate(-6deg);
  box-shadow: 7px 7px 15px rgb(0, 0, 0);
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

</style>