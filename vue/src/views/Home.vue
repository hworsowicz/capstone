<template>
<section> 
  <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="../Images/newstack.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../Images/newrelax.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="../Images/sliderthree.jpg" alt="Third slide">
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
<h2 class="banner-text-carousel">WELCOME TO JOLT</h2>
  <div class="home">
    <h1 v-scrollanimation>Find your closest cup of coffee</h1>
   <google-map-search class="home-map-view"/>
   <!-- <map-details-page/> -->

  </div>
  <footer>
  this is the footer
</footer>
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

  
}
h1{
  font-size: 60px;
  color: white;
  text-align: center;
  padding-top: 100px;
  
}
.home-map-view{
  text-align: center;
  padding-left: 9%;
 
}
.list-coffee{
  color: #fff;
  position: relative;
}
.list-coffee:hover{
  color: rgb(151, 196, 223);
}
.carousel-item{
height: 100vh;

}
.carousel-item img{
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  background: linear-gradient(to bottom right rgba(151, 131, 124, 0));
}
.banner-text-carousel{
    width: 90%;
    color: white;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    font-size: 80px;
    text-shadow: 3px 3px black;
    
}

.before-enter{
  opacity: 0;
  transform: translateX(100px);
  transition: all 1s ease-out;
}

.enter{
  opacity: 1;
  transform: translateX(0px)
}

 
</style>
