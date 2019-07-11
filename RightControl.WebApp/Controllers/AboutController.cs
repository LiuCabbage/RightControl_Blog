using RightControl.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class AboutController : Controller
    {
        // GET: About
        public ActionResult Index()
        {
            WebSiteInfo model = new WebSiteInfo();
            return View(model.GetWebSiteInfo());
        }
    }
}