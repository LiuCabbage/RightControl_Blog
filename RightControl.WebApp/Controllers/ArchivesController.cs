using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;

namespace RightControl.WebApp.Controllers
{
    public class ArchivesController : Controller
    {
        public IArticleService service { get; set; }
        // GET: Archives
        public ActionResult Index()
        {
            ViewData["Year"] = service.GetYear();
            ViewData["ArticleList"] = service.GetAll();
            return View();
        }
    }
}