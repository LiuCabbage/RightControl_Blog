using RightControl.Common;
using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Models;
using System;
using System.Linq;
using System.Web.Mvc;

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
            QQUserModel userModel = qqUserService.GetQQUserByOpenId(openid);
            if (userModel == null)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "非法提交，Openid不存在" });
            }
            if (!userModel.Status.Value)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "QQ用户已被锁定，无法留言" });
            }
            WebSiteInfo siteInfo = new WebSiteInfo();
            int maxFeedbackNum = Convert.ToInt32(siteInfo.GetWebSiteInfo().MaxFeedbackNum);
            int todayFeedbackNum = service.GetTodayFeedbackNum(openid);
            if (todayFeedbackNum >= maxFeedbackNum)
            {
                //锁定QQ用户
                userModel.Status = false;
                qqUserService.UpdateQQUser(userModel);
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "留言提交失败，已超出每日最大提交数量" });
            }
            FeedbackModel model = new FeedbackModel()
            {
                SendId = userModel.Id,
                AcceptId = 0,
                Content = XSS.FilterXSS(editorContent),
                ParentId = 0,
                //City = fromcity,
                City = Net.GetLocation(Net.Ip),
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
            QQUserModel userModel = qqUserService.GetQQUserByOpenId(openid);
            if (userModel == null)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "非法提交，Openid不存在" });
            }
            if (!userModel.Status.Value)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "QQ用户已被锁定，无法留言" });
            }
            WebSiteInfo siteInfo = new WebSiteInfo();
            int maxFeedbackNum = Convert.ToInt32(siteInfo.GetWebSiteInfo().MaxFeedbackNum);
            int todayFeedbackNum = service.GetTodayFeedbackNum(openid);
            if (todayFeedbackNum >= maxFeedbackNum)
            {
                //锁定QQ用户
                userModel.Status = false;
                qqUserService.UpdateQQUser(userModel);
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "留言提交失败，已超出每日最大提交数量" });
            }
            FeedbackModel model = new FeedbackModel()
            {
                SendId = userModel.Id,
                AcceptId = Convert.ToInt32(targetUserId),
                Content = XSS.FilterXSS(editorContent),
                ParentId = Convert.ToInt32(remarkId),
                //City = fromcity,
                City = Net.GetLocation(Net.Ip),
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