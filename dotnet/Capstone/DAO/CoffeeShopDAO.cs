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

            const string sql = "SELECT shop_id, shop_name, shop_location, shop_has_spirits, image_path, about_shop, hours_weekdays, hours_weekends, price_range, website, address_link, header_picture_path, map_picture, menu_picture, gallery_1, gallery_2, gallery_3, gallery_4, latitude, longitude, 0 AS IsFavorite FROM coffee_shops";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    CoffeeShop coffeeShop = GetCoffeeShopFromDataReader(reader);

                    result.Add(coffeeShop);
                }
            }
            return result;
        }
        public CoffeeShop GetCoffeeShopById(int shopId)
        {
            const string sql = "SELECT shop_id, shop_name, shop_location, shop_has_spirits, image_path, about_shop, hours_weekdays, hours_weekends, price_range, website, address_link, header_picture_path, map_picture, menu_picture, gallery_1, gallery_2, gallery_3, gallery_4, latitude, longitude, 0 AS IsFavorite FROM coffee_shops WHERE shop_id = @shopId";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@shopId", shopId);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
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
        public List<CoffeeShop> GetUserFavorites(int userId)
        {
            List<CoffeeShop> result = new List<CoffeeShop>();

            const string sql = "SELECT shop_id, shop_name, shop_location, shop_has_spirits, image_path, about_shop, hours_weekdays, hours_weekends, price_range, website, address_link, header_picture_path, map_picture, menu_picture, gallery_1, gallery_2, gallery_3, gallery_4, latitude, longitude" +
                "  (CASE WHEN EXISTS(SELECT 1 FROM user_favorites uf WHERE uf.shop_id = c.shop_id AND uf.user_id = @userId) THEN 1 ELSE 0 END) AS IsFavorite FROM coffee_shops c";


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@userId", userId);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    CoffeeShop coffeeShop = GetCoffeeShopFromDataReader(reader);



                    result.Add(coffeeShop);
                }

            }
            return result;
        }

        public void AddToFavorites(int userId, int shopId)
        {

            const string sql = "INSERT INTO user_favorites (user_id, shop_id) VALUES (@userId, @shopId)";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@shopId", shopId);


                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Coffee shop already exists in favorites", ex.Message);

            }
        }

        public void RemoveFromFavorites(int userId, int shopId)
        {
            const string sql = "DELETE FROM user_favorites WHERE user_id = @userId AND shop_id = @shopId";
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@shopId", shopId);


                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("Coffee shop is not a favorite", ex.Message);

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
            coffeeShop.AddressLink = Convert.ToString(reader["address_link"]);
            coffeeShop.HeaderPicture = Convert.ToString(reader["header_picture_path"]);
            coffeeShop.MapPicture = Convert.ToString(reader["map_picture"]);
            coffeeShop.Menu = Convert.ToString(reader["menu_picture"]);
            coffeeShop.Gallery1 = Convert.ToString(reader["gallery_1"]);
            coffeeShop.Gallery2 = Convert.ToString(reader["gallery_2"]);
            coffeeShop.Gallery3 = Convert.ToString(reader["gallery_3"]);
            coffeeShop.Gallery4 = Convert.ToString(reader["gallery_4"]);
            coffeeShop.IsFavorite = Convert.ToBoolean(reader["IsFavorite"]);
            coffeeShop.Latitude = Convert.ToDecimal(reader["latitude"]);
            coffeeShop.Latitude = Convert.ToDecimal(reader["longitude"]);

            return coffeeShop;
        }
    }
}
