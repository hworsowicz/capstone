<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app">
    <header>
      <a class="logo"></a>
      <!-- If you start to get random styling you don't like, remove container from this div -->
      <nav id="nav">
        <ul>
          <li>
            <router-link class="nav-item" v-bind:to="{ name: 'home' }">
              
              <!-- This is a font awesome icon -->
              Home<span></span>
            </router-link>
          </li>
          <li>
            <router-link
              class="nav-item"
              v-bind:to="{ name: 'register' }"
              v-if="!$store.state.token"
              >&nbsp;&nbsp;Register<span></span
            ></router-link>
          </li>
          <li>
            <router-link
              class="nav-item"
              v-bind:to="{ name: 'login' }"
              v-if="!$store.state.token"
            >
              &nbsp;&nbsp;Login<span></span>
            </router-link>
          </li>
          <li>
            <router-link
              class="nav-item"
              v-bind:to="{ name: 'logout' }"
              v-if="$store.state.token"
            >
              &nbsp;&nbsp;Logout<span></span>
            </router-link>
          </li>
          <li>
            <router-link v-bind:to="{ name: 'coffeeShops' }" class="nav-item"
              >&nbsp;&nbsp;Coffee Shops<span></span>
            </router-link>
          </li>
        </ul>
      </nav>
    </header>
    <div class="body">
    <router-view  class="view"/>
    </div>
  </div>
</template>

<script>
export default {};
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

#app{
    min-height: 100vh;
    overflow-x: hidden;
    
}

header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  padding: 30px 100px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  z-index: 1000;
  transition: 0.6s;
  background-color: #FCDEC0;
  border-radius: 4px;
  box-shadow: 5px 5px 5px rgb(129, 127, 127) ;
  
  
  
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
}

.nav li {
  position: relative;
  font-size: 1em;
  color: #8fc1d4;
  font-weight: 600;
  text-decoration: none;
  margin-left: 20px;
  padding: 6px 15px;
  transition: 0.5s;
  
}

.nav router-link:hover,
.nav a.active {
  color: black;
}

.nav span {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #8fc1d4;
  border-radius: 30px;
  z-index: -1;
  transform: scale(0);
  opacity: 0;
  transition: 0.5s;
}

</style>
