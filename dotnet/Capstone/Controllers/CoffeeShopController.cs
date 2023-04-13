using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("coffee-shops")]
    [ApiController]
    public class CoffeeShopController : ControllerBase
    {
        private readonly ICoffeeShopDAO coffeeShopDAO;

        public CoffeeShopController(ICoffeeShopDAO coffeeShop)
        {
            this.coffeeShopDAO = coffeeShop;
        }

        [HttpGet("favorites")]
        [Authorize]
       
        public ActionResult GetListOfFavorites()
        {
            int userId = int.Parse(User.FindFirst("sub").Value);
            List <CoffeeShop> favorites = coffeeShopDAO.GetUserFavorites(userId);

            return Ok(favorites);
        }

        [HttpPut("favorites")]
        [Authorize]
        public ActionResult AddToFavorites(UserFavorites newFavorite)
        {
            int userId = int.Parse(User.FindFirst("sub").Value); //int parse is setting the userId to whoever is currently logged in 
            newFavorite.UserId = userId;
            
            coffeeShopDAO.AddToFavorites(userId, newFavorite.ShopId);

            return Ok(); 
        }
        [HttpGet()]
        public ActionResult GetAllCoffeeShops()
        {
            List<CoffeeShop> allShops; 
            
            if(string.IsNullOrWhiteSpace( User.Identity.Name))
            {

              allShops =  coffeeShopDAO.GetAllCoffeeShops();
            }
            else
            {
                allShops = coffeeShopDAO.GetUserFavorites(int.Parse(User.FindFirst("sub").Value));
            }

            return Ok(allShops);
        }
        [HttpGet("{shopId}")]
        public ActionResult GetCoffeeShopById(int shopId)
        {
            CoffeeShop shop = coffeeShopDAO.GetCoffeeShopById(shopId);
            if(shop == null)
            {
                return NotFound();
            }
            return Ok(shop);
        }
    }
}
