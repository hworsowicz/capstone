import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')

let currentUser = null;
if ((localStorage.getItem('user') && localStorage.getItem('user') != 'undefined')) {
  currentUser = JSON.parse(localStorage.getItem('user'));
}

if(currentToken && currentToken != 'undefined') {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {} ,// If a user is an admin, their user.role will be 'admin'
    coffeeShops: [], // This an array that pulling from C# which is pulling from SQL (all of the coffeeShops in the SQL Database)
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_COFFEE_SHOPS(state, coffeeshops)
    {
      state.coffeeShops = coffeeshops; // this becomes the response.data
    },
    SET_SINGLE_COFFEE_SHOP(state, id)
    {
      state.coffeeShops = id;
    }
  }
})
