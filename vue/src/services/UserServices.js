import axios from "axios";

export default {
    getUserFavorites(){
        return axios.get('/coffee-shops')
    },
    addToUserFavorites(shop){
       
        return axios.put('/coffee-shops', shop)
    },
    removeFromUserFavorites(shop){
        return axios.put('/coffee-shops/unfavorite', shop)
    }
}
