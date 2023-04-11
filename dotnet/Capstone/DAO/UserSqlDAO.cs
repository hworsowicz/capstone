using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class UserSqlDAO : IUserDAO
    {
        private readonly string connectionString;

        private string sqlGetUser = "SELECT user_id, username, password_hash, salt, user_role FROM users WHERE username = @username";
        private string sqlAddUser = "INSERT INTO users (username, password_hash, salt, user_role) VALUES " +
            "(@username, @password_hash, @salt, @user_role)";

        public UserSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<UserFavorites> GetUserFavorites (int userId)
        {
            List<UserFavorites> result = new List<UserFavorites>();

            const string sql = "Select c.shop_id, c.shop_name FROM coffee_shops c "+
                "INNER JOIN user_favorites uf ON uf.shop_id = c.shop_id "+
                "INNER JOIN users u ON u.user_id = uf.user_id WHERE u.user_id = @userId";


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@userId", userId);
                SqlDataReader reader = cmd.ExecuteReader();

                while(reader.Read())
                {
                    UserFavorites currentFavorites = new UserFavorites();
                    currentFavorites.ShopId = Convert.ToInt32(reader["shop_id"]);
                    currentFavorites.ShopName = Convert.ToString(reader["shop_name"]);
                    currentFavorites.UserId = Convert.ToInt32(reader["user_id"]);

                    result.Add(currentFavorites);
                }

            }
                 return result;
        }

        public User GetUser(string username)
        {
            User returnUser = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlGetUser, conn);
                cmd.Parameters.AddWithValue("@username", username);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows && reader.Read())
                {
                    returnUser = GetUserFromReader(reader);
                }
            }

            return returnUser;
        }


        public User AddUser(string username, string password, string role)
        {
            IPasswordHasher passwordHasher = new PasswordHasher();
            PasswordHash hash = passwordHasher.ComputeHash(password);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlAddUser, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password_hash", hash.Password);
                cmd.Parameters.AddWithValue("@salt", hash.Salt);
                cmd.Parameters.AddWithValue("@user_role", role);
                cmd.ExecuteNonQuery();
            }

            return GetUser(username);
        }

        private User GetUserFromReader(SqlDataReader reader)
        {
            User u = new User()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                Username = Convert.ToString(reader["username"]),
                PasswordHash = Convert.ToString(reader["password_hash"]),
                Salt = Convert.ToString(reader["salt"]),
                Role = Convert.ToString(reader["user_role"]),
            };

            return u;
        }
    }
}
