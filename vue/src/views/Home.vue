<template>
<!-- Note: v-scrollanimation is used through-out the project as a custom directive for animations on scroll
check directives folder in src for the logic -->
<section> 
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../Images/newstack.jpg" class="d-block w-100" alt="...">
      <div class="absolute-div">
                        <div class="carousel-caption">
                             <h3 v-scrollanimation >Welcome to Jolt</h3>
                        </div>
                    </div>
    </div>
    <div class="carousel-item">
      <img src="../Images/newrelax.jpg" class="d-block w-100" alt="...">
        <div class="absolute-div">
                        <div class="carousel-caption">
                             <h3 v-scrollanimation>Where Columbus meets Coffee</h3>
                        </div>
                    </div>
    </div>
    <div class="carousel-item">
      <img  src="../Images/sliderthree.jpg" class="d-block w-100" alt="...">
        <div class="absolute-div">
                        <div class="carousel-caption">
                            <h3 v-scrollanimation>Find local coffee shops around Columbus</h3>
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
    <h1 class="closest-map-text" v-scrollanimation>Find your closest cup of coffee</h1>
   <google-map-search v-scrollanimation class="home-map-view"/>
   <!-- <map-details-page/> -->
  </div>


  <h2 v-scrollanimation>Articles</h2>

<div class="blog-wrapper">
  <div v-scrollanimation class="blog-card">
    <div class="card-img"><img src="../Images/article1.jpg">
      <h1>Brew Box</h1>
    </div>
    <div class="card-details"><span><i class="fa fa-calendar"></i>Mar 20</span><span><i class="fa fa-heart"></i>300</span></div>
    <div class="card-text"><p>The Coffee Brew Box! This very limited edition box will feature samples from 12 coffee roasters plus some extra goodies to enhance your at home coffee.</p></div>
    <div class="read-more"><a href="https://columbusunderground.com/the-coffee-festival-brew-box-is-back-dh1/">Read More</a></div>
  </div>
  <div v-scrollanimation class="blog-card">
    <div class="card-img"><img src="../Images/sliderfive.jpg">
      <h1>Coffee Trail</h1>
    </div>
    <div class="card-details"><span><i class="fa fa-calendar"></i>APR 3</span><span><i class="fa fa-heart"></i>265</span></div>
    <div class="card-text"><p>This trail will be an easy task for any coffee lover! There are 25+ stops of this caffeine-filled trail.

After just four stops, you earn a free Columbus coffee experience t-shirt.</p></div>
    <div class="read-more"><a href="https://www.columbusonthecheap.com/columbus-coffee-trail/">Read More</a></div>
  </div>
   <div v-scrollanimation class="blog-card">
    <div class="card-img"><img src="../Images/slidertwo.jpg">
      <h1>Craft Coffee</h1>
    </div>
    <div class="card-details"><span><i class="fa fa-calendar"></i>MAR 14</span><span><i class="fa fa-heart"></i>102</span></div>
    <div class="card-text">A cooperative spirit among entrepreneurs has led to a buzzing coffee scene in Columbus, Ohio, that’s steeped in tradition and fueled by creativity<p>
</p></div>
    <div class="read-more"><a href="https://www.usatoday.com/story/travel/experience/food-and-wine/2018/03/14/columbus-ohio-craft-coffee/417588002/">Read More</a></div>
  </div>
</div>
     <footer class="footer">
        <h4>Jolt&reg;</h4>
        <p>Hi! Welcome to Jolt where it's 5am somewhere</p>
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

<style lang="scss" scoped>
.footer h4{
    margin-bottom: 25px;
    margin-top: 1px;
    font-weight: 300;
    color: #fff;
}
.footer{
    width: 100%;
    text-align: center;
    padding: 50px 0;
    color: #fff;
    background: #000;
    opacity: 0.8;
    content: '';
    border-top-left-radius: 50% 100%;
    border-top-right-radius: 50% 100%;
    bottom: 0;
    z-index: -1;
    width: 100%;
    margin-top: 10px;
}
h2{
  font-size:35px;
   font-family: 'Quicksand', sans-serif; 
  text-align:center;
  padding-top: 450px;
  color: #fff;
  text-shadow: 2px 2px black;
}
.blog-wrapper{
  
  display:flex;
  flex-direction:row;
  justify-content:center;
  flex-wrap:wrap;
  .blog-card{
   transition: (.3s);
    max-width:300px;
    margin:15px;
    margin-bottom: 100px;
    margin-top: 35px;
    background:#fff;
    border:1px solid #000000;
    text-align:center;
    cursor:pointer;
    &:hover{
      box-shadow: 0 3px 10px 0 rgba(0,0,0,.1);
      .card-img{
        img{
          opacity:0.8;
        }
      }
    }
    .card-img{
      position:relative;
      text-align:center;
      background:#8fc1d4;
      img{
         transition: (.3s);
        max-height:180px;
        width:100%;
        border-bottom:4px solid #457B9D;
      }
      &:before{
        content:'';
        position: absolute;
        bottom: -8px;
        left: 50%;
        margin-left: -10px;
        width: 0;
        height: 0;
        border-top: solid 10px #457B9D;
        border-left: solid 10px transparent;
        border-right: solid 10px transparent;
      }
      h1{
        position:absolute;
        margin:0;
        font-size:42px;
        bottom:15px;
        width:100%;
        color:white;
        font-family: 'Quicksand 27px', serif;
        text-shadow: 2px 2px black;
      }
    }
    .card-details{
      margin-top:30px;
      font-family: 'Quicksand', sans-serif;
      color:#3C3C3C;
      span{   
        padding:0 30px;
        i{
          margin-right:5px;
        }
        
      }
    }
    .card-text{
      padding:30px 15px;
      font-family: 'Quicksand', sans-serif;
      line-height:22px;
    }
    a{
      color: #000000;
      text-decoration: none;
    }
    a:hover{
      color: white;
      text-decoration: none;
    }
    .read-more{
     transition: (.3s);
      display:inline-block;
      width:auto;
      text-align:center;
      text-transform:uppercase;
      background: #8fc1d4;
      color:#fff;
      padding:15px;
      margin-bottom:30px;
      font-family: 'Quicksand', sans-serif;
      &:hover{
        background: darken(#457B9D,5%);
      }
    }
  }
}

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
  color: #fff;
  text-align: center;
  padding-top: 100px;
  text-shadow: 2px 2px black;
}
.home-map-view{
display: grid;
place-items: center;
 
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
// .before-enter and enter are the transition for v-scroll animation.
// They slide the element in from ther left to the right.
.before-enter{
  opacity: 0;
  transform: translateX(-100px);
  transition: all 1s ease-out;
}

.enter{
  opacity: 1;
  transform: translateX(0px)
}
</style>
