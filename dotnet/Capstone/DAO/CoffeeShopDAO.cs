using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class CoffeeShopDAO : ICoffeeShopDAO 
    {
        private readonly string connectionString;
        public CoffeeShopDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }
        /// <summary>
        /// Gets a list of all coffee shops to display to user
        /// </summary>
        /// <returns>a list of coffee shops</returns>
        public List<CoffeeShop> GetAllCoffeeShops()
        {
            List<CoffeeShop> result = new List<CoffeeShop>();

            const string sql = "SELECT shop_id, shop_name, shop_location, shop_has_spirits, image_path, about_shop, hours_weekdays, hours_weekends, price_range, website FROM coffee_shops";
            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    CoffeeShop coffeeShop = GetCoffeeShopFromDataReader(reader);

                    result.Add(coffeeShop);
                }
            }
            return result;
        }
        public CoffeeShop GetCoffeeShopById(int shopId)
        {
            const string sql = "SELECT shop_id, shop_name, shop_location, shop_has_spirits, image_path, about_shop, hours_weekdays, hours_weekends, price_range, website  FROM coffee_shops WHERE shop_id = @shopId";
            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@shopId", shopId);

                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.Read())
                {
                    CoffeeShop coffeeShop = GetCoffeeShopFromDataReader(reader);
                    return coffeeShop;
                    
                }
                else
                {
                    return null;
                }
                

            }
        }
        /// <summary>
        /// Method to get a singular coffee shop by the sql statement, can only be used within another method providing a reader
        /// </summary>
        /// <param name="reader"></param>
        /// <returns>coffee shop object</returns>
        public CoffeeShop GetCoffeeShopFromDataReader(SqlDataReader reader)
        {
            CoffeeShop coffeeShop = new CoffeeShop();
            coffeeShop.ShopId = Convert.ToInt32(reader["shop_id"]);
            coffeeShop.ShopName = Convert.ToString(reader["shop_name"]);
            coffeeShop.ShopLocation = Convert.ToString(reader["shop_location"]);
            coffeeShop.HasSpirits = Convert.ToBoolean(reader["shop_has_spirits"]);
            coffeeShop.ImagePath = Convert.ToString(reader["image_path"]);
            coffeeShop.About = Convert.ToString(reader["about_shop"]);
            coffeeShop.HoursWeekdays = Convert.ToString(reader["hours_weekdays"]);
            coffeeShop.HoursWeekends = Convert.ToString(reader["hours_weekends"]);
            coffeeShop.PriceRange = Convert.ToString(reader["price_range"]);
            coffeeShop.Website = Convert.ToString(reader["website"]);
            return coffeeShop;
        }
    }
}
