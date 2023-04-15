<template>
    <section class="mapview">
            <router-link v-bind:to="{ name: 'coffeeShops' }" 
              >List Coffee Shops<span class="blue-filler"></span>
            </router-link>
<div class="map"> 
         <iframe src="https://my.atlistmaps.com/map/2c9cf803-873d-4c73-b722-d3ead35a7629?share=true" allow="geolocation 'self' https://my.atlistmaps.com" width="100%" height= "100%" scrolling="no" allowfullscreen></iframe>
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

</style>