<template>
<section> 
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="../Images/sliderPour.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../Images/sliderStaufs.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../Images/sliderFox.jpg" alt="Third slide">
    </div>
     <div class="carousel-item">
      <img class="d-block w-100" src="../Images/slider4.jpg" alt="Fourth slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  <div class="home">
    <h1>Find your closest cup of coffee</h1>
   <google-map-search class="home-map-view"/>
   <!-- <map-details-page/> -->

  </div>
  <router-link v-bind:to="{ name: 'aboutus' }" 
              ><button>Meet the team</button>
            </router-link>
</section>
</template>
<script>

import GoogleMapSearch from '../components/GoogleMapSearch.vue';






export default {
  components: { GoogleMapSearch}, 
  name: "home",
};
</script>
<style scoped>
.home {
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
  font-size: 30px;
}
.home-map-view{
 
  text-align: center;
  padding-left: 15%;
}
.list-coffee{
  color: #fff;
  position: relative;
}
.list-coffee:hover{
  color: rgb(151, 196, 223);
}
.carousel-item{
height: 85vh;
}
 
</style>
