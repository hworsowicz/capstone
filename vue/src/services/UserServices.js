import axios from "axios";

export default {
    getUserFavorites(){
        return axios.get('/coffee-shops')
    },
    addToUserFavorites(shopId){
        return axios.put('/coffee-shops' + shopId)
    }
}
