using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Capstone.Controllers
{
    [Route("user")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private IUserDAO userDAO;

        public UsersController(IUserDAO userDAO)
        {
            this.userDAO = userDAO;
        }

        [HttpGet("{userId}")]
        [Authorize]
        public ActionResult GetListOfFavorites(int userId)
        {
            List<UserFavorites> favorites = userDAO.GetUserFavorites(userId);
            if(favorites == null)
            {
                return NotFound();
            }
            return Ok(favorites);
        }

    }
}
