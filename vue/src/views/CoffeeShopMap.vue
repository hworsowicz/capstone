<template>
    <section class="mapview">
            <router-link  v-bind:to="{ name: 'coffeeShops' }" 
              > <button class="linktolist">List <i class="fas fa-list-ul"></i> </button>
            </router-link>
<div class="map"> 
         <iframe src="https://my.atlistmaps.com/map/2c9cf803-873d-4c73-b722-d3ead35a7629?share=true" allow="geolocation 'self' https://my.atlistmaps.com"  width="100%" height= "100%" scrolling="no" allowfullscreen></iframe>
     </div>  
    </section>
   
</template>

<script>

export default {
 

}
</script>

<style>
.mapview{
    margin-top: 100px;
    height: 100vh;
    width:100%;
    
    
    

}
.map{
    min-width: 100%;
    height: 90vh;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
.linktolist{
    margin-left: 15px;
  padding: 0 5px 0 5px;
  margin-bottom: 7px;
  border: none;
  border-radius: 10px;
}
.linktolist:hover{
      background-color: #8fc1d4;
  color: white;
  transition: .5s;
  border: none;
  box-shadow: 7px 7px 15px rgb(36, 35, 35);
}

</style>