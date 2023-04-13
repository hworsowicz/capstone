import axios from "axios";

export default {
    getUserFavorites(){
        return axios.get('/coffee-shops')
    },
    addToUserFavorites(shop){
        console.log("DJ")
        return axios.put('/coffee-shops', shop)
    }
}
