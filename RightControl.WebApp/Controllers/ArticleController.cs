using RightControl.WebApp.Models;
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
        public ActionResult Index(int? Id=0)
        {
            ViewBag.ClassList = classService.GetArticleClassList().ToList();
            ViewBag.HotList = service.GetHotArticle(5).ToList();
            ViewBag.DingList = service.GetDingArticle(3).ToList();
            ViewBag.UserList = userService.GetBySkip(0, 12, null, null, null, "ORDER BY CreateOn Desc");
            int PageSize = 5;
            ViewBag.PageSize = PageSize;
            int Count = service.GetByWhere(Id==0?null:string.Format("WHERE ClassId = {0}",Id)).ToList().Count;
            ViewBag.Count = Count;
            int PageCount = (Count + PageSize - 1) / PageSize;
            ViewBag.PageCount = PageCount;
            ViewBag.ClassId = Id;
            return View();
        }
        public ActionResult Detail(int Id)
        {
            return View();
        }
        [HttpPost]
        public JsonResult SearchResult(string context)
        {
            var result = service.GetArticleListBySearch(context);
            return Json(result);
        }
        [HttpPost]
        public ContentResult LoadArticleByClass(int classId, int page, int pagesize)
        {
            string result = service.GetListByClassId(classId, page, pagesize);
            return Content(result);
        }
    }
}