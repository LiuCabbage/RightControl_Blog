using RightControl.IService;
using RightControl.WebApp.Models;
using System;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class HomeController : Controller
    {
        public IArticleService service { get; set; }
        WebSiteInfo model = new WebSiteInfo();
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.HotArtileList = service.GetHotArticle(3);
            return View(model.GetWebSiteInfo());
        }
        public ActionResult Meta()
        {
            ViewBag.Site = model.GetWebSiteInfo();
            return PartialView("~/Views/Shared/_Meta.cshtml");
        }
        public ActionResult Head()
        {
            ViewBag.Site = model.GetWebSiteInfo();
            return PartialView("~/Views/Shared/_Head.cshtml");
        }
        public ActionResult Foot()
        {
            ViewBag.Site = model.GetWebSiteInfo();
            return PartialView("/Views/Shared/_Foot.cshtml");
        }
    }
}