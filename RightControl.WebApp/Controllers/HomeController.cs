using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.WebApp.Models;

namespace RightControl.WebApp.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            WebSiteInfo model = new WebSiteInfo();
            return View(model.GetWebSiteInfo());
        }
    }
}