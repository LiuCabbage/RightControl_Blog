using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.WebApp.Controllers
{
    public class DiarysController : Controller
    {
        public IDiarysService service { get; set; }
        // GET: Diarys
        public ActionResult Index()
        {
            ViewData["Year"] = service.GetYear();
            ViewData["DiarysList"] = service.GetAll();
            return View();
        }
    }
}