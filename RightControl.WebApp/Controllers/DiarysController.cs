﻿using RightControl.IService;
using RightControl.WebApp.Models;
using System.IO;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class DiarysController : Controller
    {
        public IDiarysService service { get; set; }
        // GET: Diarys
        public ActionResult Index()
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.Site = siteInfo.GetWebSiteInfo();
            ViewData["Year"] = service.GetYear();
            string _orderby = "ORDER BY CreateOn DESC";
            ViewData["DiarysList"] = service.GetAll(null, _orderby);
            return View();
        }
    }
}