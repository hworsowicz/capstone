<template>
   <section class="carousel">
      <div class="container-carousel">
        <div class="slide-container">
          <div class="card-wrapper">
            <div class="carousel-card">
              <div class="image-box">
                <img src="../Images/fillerGallery1.jpg" alt="Article picture">
              </div>
              <div class="profile-details">
                <img src="../Images/CoffeeHeader.jpg" alt="profile">
                <div class="name-job">
                  <h3 class="name">Name</h3>
                  <h4 class="job">Coffee Shop something</h4>
                </div>
              </div>
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
.carousel{
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: tan;
  border-radius: 8px;
}
.container-carousel{
    max-width: 1120px;
    width: 100%;
    background-color: grey;
}
.carousel-card{
  background-color:white;
  border-radius: 8px;
  width: 312px;
}
.carousel-card .image-box{
  height: 200px;
}

.carousel-card .image-box img{
  height: 100%;
    width: 100%;
  border-radius: 8px 8px 0 0;
}

.carousel-card .profile-details{
  display: flex;
  align-items: center;
  column-gap: 12px;
  padding: 15px;
}
.carousel-card .profile-details img{
  height: 40px;
  width: 40px;
  border-radius: 50%;
}

.profile-details .name{
  font-size: 15px;
  font-weight: 500;
}
.profile-details .job{
  font-size: 12px;
  font-weight: 500;
  color: #4d4d4d;
}
</style>