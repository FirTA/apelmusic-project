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
    public class PaymentMethodController : ControllerBase
    {
        #region SqlDataReader
        [HttpGet]
        [Route("GetPayment")]
        [Authorize(Roles = "admin,peserta")]
        public ActionResult GetPayment()
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                List<PaymentMethod> result = new List<PaymentMethod>(); // initialisasi array kosong
                result = PaymentMethodLogic.GetPayment();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Insert Data
        [HttpPost]
        [Route("InsertPayment")]
        [Authorize(Roles = "admin")]
        public ActionResult InsertPayment([FromBody] PaymentMethod body)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                PaymentMethodLogic.InsertPayment(body);
                return StatusCode(201, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Update payment
        [HttpPut]
        [Route("UpdatePayment")]
        [Authorize(Roles = "admin")]
        public ActionResult UpdatePayment(int id_payment_method, [FromBody] PaymentMethod body)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                PaymentMethodLogic.UpdatePayment(id_payment_method, body);
                return StatusCode(200, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Change Status Payment
        [HttpPut]
        [Route("ChangeStatusPayment")]
        [Authorize(Roles ="admin")]
        public ActionResult ChangeStatusPayment(int id_payment_method, [FromBody] PaymentMethod body)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                PaymentMethodLogic.ChangeStatusPayment(id_payment_method, body);
                return StatusCode(200, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

    }
}
