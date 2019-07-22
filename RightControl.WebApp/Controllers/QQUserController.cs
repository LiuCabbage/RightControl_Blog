using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;
using RightControl.Model;
using RightControl.Common;

namespace RightControl.WebApp.Controllers
{
    public class QQUserController : Controller
    {
        public IQQUserService service { get; set; }
        // GET: QQUser
        [HttpGet]
        public ActionResult QQLogin()
        {
            return View();
        }
        [HttpGet]
        public ActionResult QQLogOut()
        {
            return View();
        }
        [HttpGet]
        public ActionResult CallBack()
        {
            return View();
        }
    }
}