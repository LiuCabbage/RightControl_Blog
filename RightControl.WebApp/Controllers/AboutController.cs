using RightControl.WebApp.Models;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class AboutController : Controller
    {
        // GET: About
        public ActionResult Index()
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.Site = siteInfo.GetWebSiteInfo();
            return View();
        }
    }
}