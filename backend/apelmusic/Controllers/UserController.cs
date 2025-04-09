using apelmusic.Logics;
using apelmusic.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Tls;
using System.Data;
using System.Data.SqlClient;
using System.Security.Claims;

namespace apelmusic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        #region SqlDataReader
        [HttpGet]
        [Route("GetAdmin")]
        public ActionResult GetAdmin()
        {
            try
            {
                List<Admin> result = new List<Admin>(); // initialisasi array kosong
                result = UserLogic.GetAdmin();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region SqlDataReader
        [HttpPost]
        [Route("InsertAdmin")]
        public ActionResult InsertAdmin([FromBody] Admin body)
        {
            try
            {
                UserLogic.InsertAdmin(body);
                return StatusCode(201, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Change Status Admin
        [HttpPut]
        [Route("ChangeStatusAdmin")]
        public ActionResult ChangeStatusAdmin(int id_user, [FromBody] Admin body)
        {
            try
            {
                UserLogic.ChangeStatusAdmin(id_user, body);
                return StatusCode(200, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Change Status Admin
        [HttpPut]
        [Route("UpdateAdmin")]
        public ActionResult UpdateAdmin(int id_user, [FromBody] Admin body)
        {
            try
            {
                UserLogic.UpdateAdmin(id_user, body);
                return StatusCode(200, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        [HttpPost]
        [Route("Registration")]
        public ActionResult RegistUser([FromBody] User user)
        {
            try
            {
                UserLogic.regisUser(user);
                return Ok("Success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut]
        [Route("activation/{token}")]
        public IActionResult ActivateUserAccount(string token)
        {
            try
            {
                UserLogic.activateUser(token);

                return Ok("Success");
            } 
            catch (Exception ex)
            {
                return StatusCode(400, ex.Message);
            }
        }

        [HttpPost]
        [Route("tokenidentity")]
        public ActionResult Token(Token token)
        {
            try
            {
                UserOutputLogin output = UserLogic.tokenidentity(token);

                return Ok(output);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("login")]
        public IActionResult LoginUser([FromBody] Login user)
        {
            try
            {
                UserOutputLogin result =  UserLogic.login(user);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return StatusCode(400, ex.Message);
            }
        }


        [HttpPost]
        [Route("checkemailreset")]
        public IActionResult checkemailreset([FromBody] Email user)
        {
            try
            {
                bool isExist = UserLogic.checkemailreset(user);
                return Ok(isExist);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [Route("checkemail")]
        public IActionResult checkemail([FromBody] Email user)
        {
            try
            {
                bool isExist = UserLogic.checkemail(user);
                return Ok(isExist);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }


        [HttpPost]
        [Route("resetpassword")]
        public IActionResult resetPassword([FromBody] ResetUserPassword user)
        {
            try
            {
                UserLogic.resetPassword(user);

                return Ok("Success");
            }
            catch (Exception ex)
            {
                return StatusCode(400, ex.Message);
            }
        }




    }
}
