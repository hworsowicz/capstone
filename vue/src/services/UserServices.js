import axios from "axios";

export default {
    getUserFavorites(userId){
        return axios.get('/'+ userId)
    }
}
