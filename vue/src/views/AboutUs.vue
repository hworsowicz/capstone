<template>
<section>
<h2>About Us</h2>
<p>Resize the browser window to see the effect.</p>
<br>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="../Images/hannah.jpg"  alt="Jane" style="width:100%">
      <div class="container">
        <h2>Hannah Worsowicz</h2>
        <p class="title">C#/.NET Software Developer</p>
        <p></p>
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
        <p><button class="button">Contact</button></p>
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

<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
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
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
</style>