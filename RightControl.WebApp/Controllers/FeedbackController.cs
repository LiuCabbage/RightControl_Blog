using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Models;
using RightControl.Common;

namespace RightControl.WebApp.Controllers
{
    public class FeedbackController : Controller
    {
        public IFeedbackService service { get; set; }
        public IQQUserService qqUserService { get; set; }
        // GET: Feedback
        public ActionResult Index()
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.Site = siteInfo.GetWebSiteInfo();
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
        [HttpPost]
        [ValidateInput(false)]
        public JsonResult AddFeedback(string openid, string editorContent, string fromcity, string browserName)
        {
            QQUserModel userModel = qqUserService.GetByWhere("WHERE OpenId=@openid", new { openid = openid }).FirstOrDefault();
            FeedbackModel model = new FeedbackModel()
            {
                SendId = userModel.Id,
                AcceptId = 0,
                Content = XSS.FilterXSS(editorContent),
                ParentId = 0,
                City = fromcity,
                Equip = browserName,
                CreateOn = DateTime.Now
            };
            bool result = service.CreateModel(model);
            if (result)
            {
                return Json(new AjaxResult { state = ResultType.success.ToString(), message = "留言提交成功" });
            }
            else
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "留言提交失败" });
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public JsonResult ReplyFeedback(string openid, string remarkId, string targetUserId, string editorContent, string fromcity, string browserName)
        {
            QQUserModel userModel = qqUserService.GetByWhere("WHERE OpenId=@openid", new { openid = openid }).FirstOrDefault();
            FeedbackModel model = new FeedbackModel()
            {
                SendId = userModel.Id,
                AcceptId = Convert.ToInt32(targetUserId),
                Content = XSS.FilterXSS(editorContent),
                ParentId = Convert.ToInt32(remarkId),
                City = fromcity,
                Equip = browserName,
                CreateOn = DateTime.Now
            };
            bool result = service.CreateModel(model);
            if (result)
            {
                return Json(new AjaxResult { state = ResultType.success.ToString(), message = "留言回复成功" });
            }
            else
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "留言回复失败" });
            }
        }
    }
}