using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Areas.Admin.Controllers;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Blog.Controllers
{
    public class QQUserController : BaseController
    {
        public IQQUserService qqUserService { get; set; }
        // GET: Blog/QQUser
        public override ActionResult Index(int? Id)
        {
            base.Index(Id);
            return View();
        }
        [HttpGet]
        public JsonResult List(QQUserModel filter, PageInfo pageInfo)
        {
            var result = qqUserService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Detail(int Id)
        {
            var model = qqUserService.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = qqUserService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Edit(int id)
        {
            var model = qqUserService.ReadModel(id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(QQUserModel model)
        {
            var result = qqUserService.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
    }
}