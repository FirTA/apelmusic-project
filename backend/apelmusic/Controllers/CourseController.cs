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
    public class CourseController : ControllerBase
    {
        #region SqlDataReader
        [HttpGet]
        [Route("GetCourse")]
        //[Authorize]
        public ActionResult GetCourse()
        {
            try
            {
                //ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                List<Course> result = new List<Course>(); // initialisasi array kosong
                result = CourseLogic.GetCourse();
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
        [Route("GetCourseUser")]
        public ActionResult GetCourseUser(int id_user)
        {
            try
            {
                List<CourseUser> result = new List<CourseUser>(); // initialisasi array kosong
                result = CourseLogic.GetCourseUser(id_user);
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
        [Route("GetCartUser")]
        [Authorize(Roles = "peserta")]
        public ActionResult GetCartUser(int id_user)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                List<CourseUser> result = new List<CourseUser>(); // initialisasi array kosong
                result = CourseLogic.GetCartUser(id_user);
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
        [Route("InsertCourseUser")]
        [Authorize(Roles = "peserta")]
        public ActionResult InsertCourseUser([FromBody] CourseUser body)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                CourseLogic.InsertCourseUser(body);
                return StatusCode(201, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Delete Data
        [HttpDelete]
        [Route("DeleteCourseUser")]
        [Authorize(Roles = "peserta")]
        public ActionResult DeleteCourseUser(int id_course_user)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                CourseLogic.DeleteCourseUser(id_course_user);
                return StatusCode(201, "success");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        #endregion

        #region Change checked courseuser
        [HttpPut]
        [Route("ChangeCheckedCourseUser")]
        [Authorize(Roles = "peserta")]
        public ActionResult ChangeCheckedCourseUser(int id_course_user, [FromBody] CourseUser course)
        {
            try
            {
                ClaimsIdentity identity = HttpContext.User.Identity as ClaimsIdentity;
                CourseLogic.ChangeCheckedCourseUser(id_course_user, course);
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
