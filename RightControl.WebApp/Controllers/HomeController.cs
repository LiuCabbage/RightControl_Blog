using RightControl.IService;
using RightControl.WebApp.Models;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class HomeController : Controller
    {
        public IArticleService service { get; set; }
        // GET: Home
        public ActionResult Index()
        {
            WebSiteInfo model = new WebSiteInfo();
            ViewBag.HotArtileList = service.GetHotArticle(3);
            return View(model.GetWebSiteInfo());
        }
    }
}