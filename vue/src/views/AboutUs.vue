<template>
<div>
<section v-scrollanimation class="container">
<h2>About Us</h2> 
<br>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="../Images/hannah.jpg"  alt="Hannah" style="width:100%">
      <div class="about">
        <h2>Hannah Worsowicz</h2>
          <p>hworsowicz@gmail.com</p>
        <p class="title">Meet Hannah, a recent graduate of Tech Elevator and a skilled C# full stack developer with a passion for tackling challenges. She is a creative thinker who values teamwork and collaboration. When she's not working, Hannah enjoys reading and spending time with friends.</p>
      
         <p><button class="button"><a href="https://www.linkedin.com/in/hworsowicz/">LinkedIn</a></button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="../Images/daniel.jpg" alt="DJ" style="width:100%">
      <div class="about">
     
        <h2>Daniel Daras</h2>
        <p>d.j.daras4@gmail.com</p>
        <p class="title">Meet Daniel, a Tech Elevator coding bootcamp graduate and full-stack software developer. With a collaborative mindset, he values effective communication and creative thinking to bring innovative solutions to life. Daniel enjoys exploring the outdoors, seeking out the perfect pizza slice, and dominating his friends in Mario Kart.</p>
        
        <p><button class="button"><a href="https://www.linkedin.com/in/danieldaras/">LinkedIn</a></button></p>
      </div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <img src="../Images/brittany.jpg"  alt="Brittany" style="width:100%">
      <div class="about">
      
        <h2>Brittany Whiting </h2>
        <p>whiting.brittany1@gmail.com</p>
        <p class="title">Meet Brittany, she is a highly motivated C# full stack developer who recently graduated from Tech Elevator. Her attention to detail and reliability make her a valuable asset to any team. With a passion for reading and spending quality time with her pets, she has a well-rounded perspective on work and life.</p>
        
        
        <p><button class="button"><a href="https://www.linkedin.com/in/brittany-whiting1/">LinkedIn</a></button></p>
      </div>
    </div>
  </div>
</div>
<div class="about-our-app">
<h2 >About Jolt</h2>
<p>Our team completed this capstone as the final requirement for our coding Bootcamp, Tech Elevator.  Jolt was designed to showcase our skills in software development.  Jolt is a coffee shop finder which we created using C# ,  ASP .NET, SQL Server, Vue.js, and CSS. While working on this page, we utilized the principles of Agile methodology, which enabled us to deliver the project on time and with high-quality results. Each of our four sprints were completed in 2-3 days. We are proud of the outcome of Jolt, as well as the teamwork and dedication that went into the process of creating it. We hope you enjoy the site and look forward to connecting with you on LinkedIn! </p>
</div>

    
</section>
<footer class="footer">
        <h4>Jolt&reg;</h4>
        <p>Hi! Welcome to Jolt where it's 5am somewhere</p>
  </footer>
</div>
</template>

<script>
export default {

}
</script>

<style scoped>

*, *:before, *:after {
  box-sizing: inherit;
}
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
.about-our-app{
  color: white;
  text-shadow: 2px 2px black;
  padding-bottom: 15px;
  
}
.row{
  display: inline-block;
  
}

.column {
  width: 30.3%;
  margin-bottom: 16px;
  padding:  55px 0px 0px 70px ;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
.row{
  display: flex;
}
.card {
   border-radius: 100px 100px 10px 10px; 
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  height: 525px;
}
.card img{
    border-radius: 50%;
}

.about{
  padding: 0 16px;
 
  
}
.about h2{
    font-size: 20px;
}
.about p {
    font-size: 11px;
}

.about::after, .row::after {
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
  width: 80%;
  border-radius: 10px;
  position: absolute;
  bottom: 15px;
 left: 21px;
 right:0;


 

   
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