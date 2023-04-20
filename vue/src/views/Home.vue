<template>
<section> 
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../Images/newstack.jpg" class="d-block w-100" alt="...">
      <div class="absolute-div">
                        <div class="carousel-caption">
                             <h3>Welcome to Jolt</h3>
                        </div>
                    </div>
    </div>
    <div class="carousel-item">
      <img src="../Images/newrelax.jpg" class="d-block w-100" alt="...">
        <div class="absolute-div">
                        <div class="carousel-caption">
                             <h3>Welcome to Jolt</h3>
                        </div>
                    </div>
    </div>
    <div class="carousel-item">
      <img  src="../Images/sliderthree.jpg" class="d-block w-100" alt="...">
        <div class="absolute-div">
                        <div class="carousel-caption">
                            <h3>Welcome to Jolt</h3>
                        </div>
                    </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


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
.carousel-caption {
     width: 90%;
    color: white;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    font-size: 100px;
    text-shadow: 3px 3px black;
}

.absolute-div {
    position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
}

.carousel-caption h3 {
  width: 90%;
    color: white;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    font-size: 100px;
    text-shadow: 3px 3px black;
}
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
    font-size: 100px;
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
