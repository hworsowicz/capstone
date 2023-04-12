using Capstone.Models;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public interface ICoffeeShopDAO
    {
        List<CoffeeShop> GetAllCoffeeShops();

        CoffeeShop GetCoffeeShopFromDataReader(SqlDataReader reader);

        CoffeeShop GetCoffeeShopById(int shopId);
        List<CoffeeShop> GetUserFavorites(int userId);

        void AddToFavorites(int userId, int shopId);
    }
}
