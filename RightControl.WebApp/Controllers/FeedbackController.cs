using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;

namespace RightControl.WebApp.Controllers
{
    public class FeedbackController : Controller
    {
        public IFeedbackService service { get; set; }
        // GET: Feedback
        public ActionResult Index()
        {
            int Count = service.GetByWhere("WHERE ParentId=0").ToList().Count;
            ViewBag.Count = Count;
            int PageSize = 15;
            ViewBag.PageSize = PageSize;
            ViewBag.PageCount = (Count + PageSize - 1) / PageSize;
            return View();
        }
        [HttpPost]
        public ContentResult LoadFeedback(int page, int pagesize)
        {
            string result = service.GetFlowFeedback(page, pagesize);
            return Content(result);
        }
    }
}