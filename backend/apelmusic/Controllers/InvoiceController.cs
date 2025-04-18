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
    public class InvoiceController : ControllerBase
    {
        #region Insert Data
        [HttpPost]
        [Route("AddInvoice")]
        [Authorize(Roles = "peserta")]
        public ActionResult AddInvoice([FromBody] Invoice body)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                string id_invoice = InvoiceLogic.AddInvoice(body);
                //return StatusCode(201, "Success");
                return Ok(id_invoice);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region SqlDataReader
        [HttpGet]
        [Route("GetInvoice")]
        [Authorize(Roles = "admin,peserta")]
        public ActionResult GetInvoice([FromQuery] int? id_user)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                List<Invoice> result = new List<Invoice>(); // initialisasi array kosong
                result = InvoiceLogic.GetInvoice(id_user);
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region SqlDataReader
        [HttpGet]
        [Route("GetDetailInvoice")]
        [Authorize(Roles = "admin, peserta")]
        public ActionResult GetDetailInvoice([FromQuery] int? id_invoice)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                List<Invoice> result = new List<Invoice>(); // initialisasi array kosong
                result = InvoiceLogic.GetDetailInvoice(id_invoice);
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
