<template>
<section>
  <div class="home">
<<<<<<< HEAD
    <h1>Coming Soon!</h1>
    <google-map-search/>

    
    <carousel />
=======
    <h1>Find your closest cup of coffee</h1>
   <google-map-search class="home-map-view"/>
   <!-- <map-details-page/> -->
   <div class="articles">
     Articles
   </div>
>>>>>>> 56cbd1bca6acfdcf007f44b75ad76eccf72c0e8d
  </div>
</section>
</template>
<script>

<<<<<<< HEAD
import Carousel from '../components/carousel.vue';
=======
>>>>>>> 56cbd1bca6acfdcf007f44b75ad76eccf72c0e8d
import GoogleMapSearch from '../components/GoogleMapSearch.vue';
//import MapDetailsPage from '../components/MapDetailsPage.vue';


export default {
<<<<<<< HEAD
  components: { GoogleMapSearch, Carousel },
=======
  components: { GoogleMapSearch}, 
>>>>>>> 56cbd1bca6acfdcf007f44b75ad76eccf72c0e8d
  name: "home",
};
</script>
<style scoped>
.home {
  background-image: url('../Images/cafe2.jpg');
  min-width: 100%;
  height: 100vh;
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
 
      background-size: cover;
      background-size: 100% 100%;
      background-size: contain;

  
}
h1{
  font-size: 60px;
  color: white;
  text-align: center;
  padding-top: 100px;
  
}
.home-map-view{
  position: fixed;
  text-align: center;
  padding-left: 24%;
}
@media screen and (max-width: 770px) {
.home-map-view{
  text-align: center;
  padding-left: 5%;
  width: 50px;
}
}
.articles{
    font-size: 60px;
  color: white;
  text-align: center;
  padding-top: 100px;
}



 
</style>
