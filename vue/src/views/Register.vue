<template>
<section class="login-body">
  <div class="container">
    <div class="wrapper">
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="title">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <div class="row">
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus />
      </div>
      <div class="row">
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required />
      </div>
      <div class="row">
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required />
      </div>
      <div class="row">
        <router-link :to="{ name: 'login' }">Have an account?</router-link>
      </div>
      <button class="create-link" type="submit">
        Create Account
      </button>
    </form>
  </div>
    </div>
    </div>
    </section>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "register",
  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "user",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                name: "login",
                query: { registration: "success" },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
  },
};
</script>

<style scoped>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Quicksand', sans-serif;
}

::selection{
   background: #789cd1;
}
.container{
  max-width: 440px;
  padding: 0 20px;
  margin: 170px auto;
}
.wrapper{
  width: 100%;
  background-color: rgba(255, 255, 255, 0.5);
  border-radius: 5px;
  box-shadow: 0px 4px 10px 1px rgba(0,0,0,0.5);
  
}
.wrapper .title{
  height: 90px;
  background: #457b9d;
  border-radius: 5px 5px 0 0;
  color: #fff;
  font-size: 30px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
  
}
.wrapper form{
  padding: 30px 25px 25px 25px;
  
}
.wrapper form .row{
  height: 45px;
  margin-top: 15px;
  margin-bottom: 15px;
  position: relative;
  
}
.wrapper form .row input{
  height: 100%;
  width: 100%;
  outline: none;
  padding-left: 60px;
  border-radius: 5px;
  border: 1px solid lightgrey;
  font-size: 16px;
  transition: all 0.3s ease;
}
form .row input:focus{
  border-color:#457b9d;
  box-shadow: inset 0px 0px 2px 2px #457b9d;
}
form .row input::placeholder{
  color: #999;
}
.wrapper form .row i{
  position: absolute;
  width: 47px;
  height: 100%;
  color: #fff;
  font-size: 18px;
  background: #457b9d;
  border: 1px solid #457b9d;
  border-radius: 5px 0 0 5px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.wrapper form .pass{
  margin: -8px 0 20px 0;
}
.wrapper form .pass a{
  color: #457b9d;
  font-size: 17px;
  text-decoration: none;
}
.wrapper form .pass a:hover{
  text-decoration: underline;
}
.wrapper form .button input{
  color: #fff;
  font-size: 20px;
  font-weight: 500;
  padding-left: 0px;
  background: #457b9d;
  border: 1px solid#457b9d;
  cursor: pointer;
}
form .button input:hover{
  background: #12876F;
}
.wrapper form .create-link{
 border: 0;
 outline: 0;
                    cursor: pointer;
                    color: white;
                    background-color: #457b9d;
                    box-shadow: rgb(0 0 0 / 0%) 0px 0px 0px 0px, rgb(0 0 0 / 0%) 0px 0px 0px 0px, rgb(0 0 0 / 12%) 0px 1px 1px 0px, rgb(84 105 212) 0px 0px 0px 1px, rgb(0 0 0 / 0%) 0px 0px 0px 0px, rgb(0 0 0 / 0%) 0px 0px 0px 0px, rgb(60 66 87 / 8%) 0px 2px 5px 0px;
                    border-radius: 4px;
                    font-size: 14px;
                    font-weight: 500;
                    padding: 4px 8px;
                    display: inline-block;
                    min-height: 28px;
                    transition: background-color .24s,box-shadow .24s;
}
.wrapper form .create-link a{
  color: #457b9d;
  text-decoration: none;
}
form .create-link a:hover{
  text-decoration: underline;
}
</style>

