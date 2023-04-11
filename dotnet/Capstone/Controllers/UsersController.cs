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


    }
}
