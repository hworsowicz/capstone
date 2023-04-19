<template>
    <section class="mapview">
        <div class="container">
            <router-link  v-bind:to="{ name: 'coffeeShops' }" 
              > <button class="linktolist"> Back to List </button>
            </router-link>
        </div>
<div class="map"> 
         <iframe src="https://my.atlistmaps.com/map/2c9cf803-873d-4c73-b722-d3ead35a7629?share=true" allow="geolocation 'self' https://my.atlistmaps.com" width="100%" height="90%" frameborder="0" scrolling="no" allowfullscreen></iframe>
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
    height: 100vh;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
.linktolist{
     margin-left: 15px;
  padding: 0 5px 0 5px;
  background-color: rgb(218, 193, 171);
}



</style>