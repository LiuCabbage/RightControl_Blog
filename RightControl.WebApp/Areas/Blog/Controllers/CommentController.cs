using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Areas.Admin.Controllers;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Blog.Controllers
{
    public class CommentController : BaseController
    {
        public ICommentService commentService { get; set; }
        // GET: Blog/Comment
        public override ActionResult Index(int? Id)
        {
            base.Index(Id);
            return View();
        }
        [HttpGet]
        public JsonResult List(CommentModel filter, PageInfo pageInfo)
        {
            var result = commentService.GetListByFilter(filter, pageInfo);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Detail(int Id)
        {
            var model = commentService.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = commentService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }

    }
}