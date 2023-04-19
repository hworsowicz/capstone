<template>
<section>
<h2>About Us</h2>
<br>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="../Images/hannah.jpg"  alt="Jane" style="width:100%">
      <div class="container">
        <h2>Hannah Worsowicz</h2>
        <p class="title">C#/.NET Software Developer</p>
        <p>Hi im hannah i like holes</p>
        <p>hworsowicz@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="../Images/daniel.jpg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Daniel Daras</h2>
        <p class="title">C#/.NET Software Developer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>d.j.daras4@gmail.com</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="../Images/brittany.jpg"  alt="John" style="width:100%">
      <div class="container">
        <h2>Brittany Whiting</h2>
        <p class="title">C#/.NET Software Developer</p>
        <p>Some text that describes me lorem ipsum ipsum lorem.</p>
        <p>whiting.brittany1@gmail.com</p>
        <p><button class="button"><a href="https://www.linkedin.com/in/brittany-whiting1/">Contact</a></button></p>
      </div>
    </div>
  </div>
</div>
</section>
</template>

<script>
export default {

}
</script>

<style scoped>

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  width: 30.3%;
  margin-bottom: 16px;
  padding: 55px 3px 0 150px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
   border-radius: 10px; 
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}
.card img{
    border-radius: 10px 0 0 0;
}

.container {
  padding: 0 16px;
  
}
.container h2{
    font-size: 20px;
}
.container p {
    font-size: 12px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
  
}

.button {
  border: solid gray;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: black;
  background-color: #fff;
  text-align: center;
  cursor: pointer;
  width: 100%;
  border-radius: 10px;
 

   
}
a{
     text-decoration: none;
     color: black;
}
a:hover{
    color: white;
}

.button:hover {
  background-color: #8fc1d4;
  transition: .5s;
  color: white;
}

</style>