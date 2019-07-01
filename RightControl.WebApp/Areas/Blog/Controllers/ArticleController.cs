using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Areas.Admin.Controllers;
using System;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Blog.Controllers
{
    public class ArticleController : BaseController
    {
        public IArticleService articleService { get; set; }
        // GET: Blog/Article
        public override ActionResult Index(int? id)
        {
            base.Index(id);
            return View();
        }
        /// <summary>
        /// 加载数据列表
        /// </summary>
        /// <param name="filter"></param>
        /// <param name="pageInfo"></param>
        /// <returns></returns>
        [HttpGet]
        public JsonResult List(ArticleModel filter, PageInfo pageInfo)
        {
            var result = articleService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Detail(int Id)
        {
            var model = articleService.ReadModel(Id);
            return View(model);
        }
        public ActionResult Edit(int Id)
        {
            var model = articleService.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(ArticleModel model)
        {
            model.UpdateOn = DateTime.Now;
            var result = articleService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(ArticleModel model)
        {
            model.Ding = 0;
            model.ReadNum = 0;
            model.CommentNum = 0;
            model.UpdateOn = DateTime.Now;
            model.CreateOn = DateTime.Now;
            var result = articleService.CreateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = articleService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
    }
}