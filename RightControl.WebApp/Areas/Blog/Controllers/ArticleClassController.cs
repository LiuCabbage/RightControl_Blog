using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.WebApp.Areas.Admin.Controllers;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.WebApp.Areas.Blog.Controllers
{
    public class ArticleClassController : BaseController
    {
        public IArticleClassService articleClassService { get; set; }
        // GET: Blog/ArticleClass
        public override ActionResult Index(int? id)
        {
            base.Index(id);
            return View();
        }
        /// <summary>
        /// 加载数据列表
        /// </summary>
        /// <param name="pageInfo">页面实体信息</param>
        /// <param name="filter">查询条件</param>
        /// <returns></returns>
        [HttpGet]
        public JsonResult List(ArticleClassModel filter, PageInfo pageInfo)
        {
            var result = articleClassService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Add()
        {
            return View();
        }
        public ActionResult Detail(int Id)
        {
            var model = articleClassService.ReadModel(Id);
            return View(model);
        }
        public ActionResult Edit(int Id)
        {
            var model = articleClassService.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(ArticleClassModel model)
        {
            var result = articleClassService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }

    }
}