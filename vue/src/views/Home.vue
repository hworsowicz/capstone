<template>
<section> 
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
//import MapDetailsPage from '../components/MapDetailsPage.vue';





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

 
</style>
