<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app" >

    <header>
      <a class="logo">
        <router-link  class="nav-item" v-bind:to="{ name: 'home' }">
      
        <img src="./Images/newLogo.png"/> 
            </router-link>
      </a>
      <!-- If you start to get random styling you don't like, remove container from this div -->
      <nav id="nav">
        <ul>
          <li>
            <router-link class="nav-item" v-bind:to="{ name: 'home' }">
              
              <!-- This is a font awesome icon -->
              Home<transition name="pop"><span class="blue-filler"></span></transition>
            </router-link>
          </li>
          <li>
            <router-link
              class="nav-item"
              v-bind:to="{ name: 'logout' }"
              v-if="$store.state.token"
            >
              &nbsp;&nbsp;Logout<span class="blue-filler"></span>
            </router-link>
          </li>
          <li>
            <router-link 
              class="nav-item"
              v-bind:to="{ name: 'login' }"
              v-if="!$store.state.token"
            >
              &nbsp;&nbsp;Login<span class="blue-filler"></span>
            </router-link>
          </li>
          <li>
             <router-link class="nav-item" v-bind:to="{ name: 'favorites' }"  v-if="$store.state.token">
              
              <!-- This is a font awesome icon -->
              My Favorites<span class="blue-filler"></span></router-link>
          </li>
          <li>
            <router-link
              class="nav-item"
              v-bind:to="{ name: 'register' }"
              v-if="!$store.state.token"
              >&nbsp;&nbsp;Register<span class="blue-filler"></span
            ></router-link>
          </li>
          <li>
            <router-link v-bind:to="{ name: 'coffeeShops' }" class="nav-item"
              >&nbsp;&nbsp;Coffee Shops<span class="blue-filler"></span>
            </router-link>
          </li>
          <li>
          <router-link v-bind:to="{ name: 'aboutus' }" 
               class="nav-item"
              >&nbsp;&nbsp;Meet the team<span class="blue-filler"></span>
            </router-link>
          </li>
          
        </ul>
      </nav>
    </header>
    <section id="body-whole">
    <body class="body">
    <router-view  class="view"/>
    </body>
    </section>
  </div>
</template>

<script>
 
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">
@import "./styles/colors.scss";

// Import the bootstrap styles. If you want to override Bootstrap colors, it needs to happen above this line
@import "../node_modules/bootstrap/scss/bootstrap";

// * Your custom styles go below this point
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Quicksand', sans-serif;
    
}
#body-whole{
  min-height: 80vh;
}
body{
  background-image: url('Images/background6.jpg');
  min-height: 100%;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;
  background-size: cover;


}

header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  padding: 15px 20px;
  height: 85px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  z-index: 1000;
  transition: 0.6s;
  background-color: rgb(218, 193, 171);
  border-radius: 2px;
    box-shadow: 7px 7px 15px rgb(36, 35, 35);
}


header nav ul {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
 
  
}
header nav ul li {
  position: relative;
  list-style: none;
}

.logo img{
 height:50px;
    overflow: hidden;
}

.nav-item {
  position: relative;
  font-size: 1.0em;
    color: black;
    font-weight: 600;
    text-decoration: none;
    margin-left: 20px;
    padding: 6px 15px;
    transition: .5s; 
}

.nav-item:hover{
  text-decoration: none;
  color: white;
  text-shadow: 1px 1px black;
}

.nav li {
  position: relative;
  font-size: 1em;
  
  font-weight: 600;
  text-decoration: none;
  margin-left: 20px;
  padding: 6px 15px;
  transition: 0.5s;
  
}

@media(max-width: 700px) { //will keep nav from being
  .nav-item{
    display: block;
  }
}
.blue-filler {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  
  box-shadow: 2px 2px black;
  background: #8FC1D4;
  border-radius: 30px;
  z-index: -1;
  transform: scale(0);
  opacity: 0 ;
  transition: transform .5s;
}

.nav-item:hover .blue-filler
 { 
   transform: scale(1);
    opacity: 1;
}

// styling for footer




</style>
