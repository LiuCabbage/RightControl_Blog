using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class LinksController : Controller
    {
        public ILinksService service { get; set; }
        // GET: Links
        public ActionResult Index()
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.Site = siteInfo.GetWebSiteInfo();
            IEnumerable<LinksModel> LinksList = service.GetAll();
            return View(LinksList);
        }
    }
}