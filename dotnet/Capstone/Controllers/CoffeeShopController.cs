using Capstone.DAO;
using Capstone.Models;
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
        [HttpGet()]
        public ActionResult GetAllCoffeeShops()
        {
            List<CoffeeShop> allShops = coffeeShopDAO.GetAllCoffeeShops();

            return Ok(allShops);
        }
    }
}
