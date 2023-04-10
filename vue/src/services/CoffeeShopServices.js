import axios from 'axios';

export default {
    getAllCoffeeShops() {
        return axios.get('/coffee-shops');
    },
    getSingleCoffeeShop(id){
        return axios.get('/coffee-shops/'+ id)

    }
}