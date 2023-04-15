<template>
  <div class="home">
    <h1>Coming Soon!</h1>
    <p></p>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>

<style scoped>
.home {
  background-image: url('../Images/hands.jpg');
  min-width: 100%;
  height: 100vh;
  background-repeat: no-repeat;
  background-position: center;
  background-attachment: fixed;
  opacity: .8;
      background-size: cover;
      /*background-size: 100% 100%;
      background-size: contain;*/
     
}
h1{
  font-size: 60px;
  color: white;
  text-align: center;
  padding-top: 300px;
}
</style>
