import axios from 'axios';

export default {
    getAllCoffeeShops() {
        return axios.get('/coffee-shops');
    },
}