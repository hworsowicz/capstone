<template>
    <section class="mapview">
        <div class="container-icon">
            
            <router-link  v-bind:to="{ name: 'coffeeShops' }" 
              > <button v-scrollanimation class="linktolist">List <i class="fas fa-list-ul"></i> </button>
            </router-link>
        </div>
<div class="map"> 
         <iframe v-scrollanimation src="https://my.atlistmaps.com/map/2c9cf803-873d-4c73-b722-d3ead35a7629?share=true" allow="geolocation 'self' https://my.atlistmaps.com" width="100%" height="90%" frameborder="0" scrolling="no" allowfullscreen></iframe>
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
iframe{
    border-radius: 30px;
}
.container-icon{
    padding: 10px 0 0px 0;
    text-align: center;
}
.map{
    min-width: 100%;
    height: 100vh;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
}
.linktolist{
 margin-left: 0px;
  padding: 0 5px 0 5px;
  margin-bottom: 7px;
  border: none;
  border-radius: 10px;
  box-shadow: 2px 2px 2px black;
}
.linktolist:hover{
      background-color: #8fc1d4;
  color: white;
  transition: .5s;
  border: none;
  box-shadow: 2px 2px 2px black;
}

</style>