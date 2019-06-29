using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Areas.Admin.Controllers;
using System;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Blog.Controllers
{
    public class LinksController : BaseController
    {
        public ILinksService linksService { get; set; }
        // GET: Blog/Links
        public override ActionResult Index(int? Id)
        {
            base.Index(Id);
            return View();
        }
        [HttpGet]
        public JsonResult List(LinksModel filter, PageInfo pageInfo)
        {
            var result = linksService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(LinksModel model)
        {
            model.CreateOn = DateTime.Now;
            var result = linksService.CreateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Detail(int Id)
        {
            var model = linksService.ReadModel(Id);
            return View(model);
        }
        public ActionResult Edit(int Id)
        {
            var model = linksService.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(LinksModel model)
        {
            var result = linksService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = linksService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
    }
}