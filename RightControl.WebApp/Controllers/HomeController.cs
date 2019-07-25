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
            Response.Cookies["openid"].Value = "123456";
            Response.Cookies["openid"].Expires = DateTime.Now.AddDays(7);
            Response.Cookies["nickname"].Value = "蚯蚓";
            Response.Cookies["nickname"].Expires = DateTime.Now.AddDays(7);
            Response.Cookies["figureurl_qq"].Value = "http://thirdqq.qlogo.cn/g?b=oidb&k=q8BmhyWUTZEpo7Us6QTqhA&s=100&t=1557712926";
            Response.Cookies["figureurl_qq"].Expires = DateTime.Now.AddDays(7);
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