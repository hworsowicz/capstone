import axios from "axios";

export default {
    getUserFavorites(userId){
        return axios.get('/'+ userId)
    },
    addToUserFavorites(shopId){
        return axios.put('/coffee-shops' + shopId)
    }
}
