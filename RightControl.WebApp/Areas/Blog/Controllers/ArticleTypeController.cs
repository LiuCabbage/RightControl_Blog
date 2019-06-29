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
    public class ArticleTypeController : BaseController
    {
        public IArticleTypeService articleTypeService { get; set; }
        // GET: Blog/ArticleType
        public override ActionResult Index(int? Id)
        {
            base.Index(Id);
            return View();
        }
        [HttpGet]
        public JsonResult List(ArticleTypeModel filter, PageInfo pageInfo)
        {
            var result = articleTypeService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(ArticleTypeModel model)
        {
            model.CreateOn = DateTime.Now;
            var result = articleTypeService.CreateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Detail(int Id)
        {
            var model = articleTypeService.ReadModel(Id);
            return View(model);
        }
        public ActionResult Edit(int Id)
        {
            var model = articleTypeService.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(ArticleTypeModel model)
        {
            var result = articleTypeService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            //这里删除文章类型，没有删除类型下的文章，后面改
            var result = articleTypeService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
    }
}