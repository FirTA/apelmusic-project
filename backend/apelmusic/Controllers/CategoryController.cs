using apelmusic.Logics;
using apelmusic.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace apelmusic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        #region SqlDataReader
        [HttpGet]
        [Route("GetCategory")]
        //[Authorize]
        public ActionResult GetCategory()
        {
            try
            {
                //ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                //string currentUser = Convert.ToString(identity.FindFirst("name").Value)
                // get product

                List<Category> result = new List<Category>(); // initialisasi array kosong
                result = CategoryLogic.GetCategory();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion
    }
}
