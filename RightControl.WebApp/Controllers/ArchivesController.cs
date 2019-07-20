using RightControl.IService;
using RightControl.WebApp.Models;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class ArchivesController : Controller
    {
        public IArticleService service { get; set; }
        // GET: Archives
        public ActionResult Index()
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.SiteTitle = siteInfo.GetWebSiteInfo().SiteTitle;
            ViewData["Year"] = service.GetYear();
            ViewData["ArticleList"] = service.GetAll();
            return View();
        }
    }
}