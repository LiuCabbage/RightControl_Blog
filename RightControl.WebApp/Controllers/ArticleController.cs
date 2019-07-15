﻿using RightControl.WebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;
using RightControl.Model;

namespace RightControl.WebApp.Controllers
{
    public class ArticleController : Controller
    {
        public IArticleService service { get; set; }
        public IArticleClassService classService { get; set; }
        public IQQUserService userService { get; set; }
        // GET: Article
        public ActionResult Index(int? Id)
        {
            ViewBag.ClassList = classService.GetArticleClassList().ToList();
            ViewBag.HotList = service.GetHotArticle(5).ToList();
            ViewBag.DingList = service.GetDingArticle(3).ToList();
            //这么获取12调QQ用户信息
            return View();
        }
        public ActionResult Detail(int Id) {
            return View();
        }
    }
}