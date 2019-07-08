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
        public IArticleClassService articleClassService { get; set; }
        public IArticleTypeService articleTypeService { get; set; }
        public SelectList ArticleClassList { get { return new SelectList(articleClassService.GetArticleClassList(), "Id", "Name"); } }
        public SelectList ArticleTypeList { get { return new SelectList(articleTypeService.GetArticleTypeList(), "Id", "Name"); } }
        // GET: Blog/Article
        public override ActionResult Index(int? id)
        {
            ViewBag.ClassId = ArticleClassList;
            ViewBag.TypeId = ArticleTypeList;
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
            var model = articleService.GetDetail(Id);
            return View(model);
        }
        public ActionResult Edit(int Id)
        {
            ViewBag.ClassId = ArticleClassList;
            ViewBag.TypeId = ArticleTypeList;
            var model = articleService.GetDetail(Id);
            return View(model);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(ArticleModel model)
        {
            model.UpdateOn = DateTime.Now;
            var result = articleService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Add()
        {
            ViewBag.ClassId = ArticleClassList;
            ViewBag.TypeId = ArticleTypeList;
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
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