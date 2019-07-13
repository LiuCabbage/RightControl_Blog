using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.WebApp.Controllers
{
    public class LinksController : Controller
    {
        public ILinksService service { get; set; }
        // GET: Links
        public ActionResult Index()
        {
            IEnumerable<LinksModel> LinksList = service.GetAll();
            return View(LinksList);
        }
    }
}