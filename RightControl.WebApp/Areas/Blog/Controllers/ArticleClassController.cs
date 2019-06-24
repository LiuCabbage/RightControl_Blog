using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.WebApp.Areas.Admin.Controllers;

namespace RightControl.WebApp.Areas.Blog.Controllers
{
    public class ArticleClassController : BaseController
    {
        // GET: Blog/ArticleClass
        public ActionResult Index()
        {
            return View();
        }
    }
}