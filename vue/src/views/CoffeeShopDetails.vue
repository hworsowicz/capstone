<template>
  <div>
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
          <h1>Our Story:</h1>
          <div class="features-desc">
            <div class="feature-text">
              <p>{{ coffeeShop.about }}</p>
            </div>
          </div>
        </div>
        <div class="features-img">
          <img :src="require('../Images/' + coffeeShop.mapPicture)" />
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
import CoffeeShopServices from "../services/CoffeeShopServices.js";
import CoffeeShopCard from "../components/CoffeeShopCard.vue";

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
      })
      .catch((error) => console.error("Could not load Coffee Shop", error));
  },
};
</script>

<style>

#banner {
  background: linear-gradient(rgba(0, 0, 0, 0.5), #fff5),
    url(../Images/cafe.jpg);
  background-size: cover;
  background-position: center;
  height: 100vh;
}
.banner-text {
  text-align: center;
  color: #fff;
  padding-top: 500px;
  font-size: 110px;
}
#feature{
  width: 100%;
  padding: 70px 0;
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
/*.features{
  flex-basis: 50%;
}*/
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
  font-size: 30px;
  color: #000;
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
  margin-bottom: 20px;
  color: #fff;
}
.single-photo img{
  width: 100%;
  border-radius: 7px;
}

</style>