using RightControl.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;
using RightControl.Common;
using RightControl.WebApp.Models;

namespace RightControl.WebApp.Controllers
{
    public class CommentController : Controller
    {
        public ICommentService service { get; set; }
        public IQQUserService qqUserService { get; set; }
        // GET: Comment
        [HttpPost]
        [ValidateInput(false)]
        public JsonResult AddComment(string openid, string articleid, string editorContent)
        {
            QQUserModel userModel = qqUserService.GetQQUserByOpenId(openid);
            if (userModel == null)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "非法提交，Openid不存在" });
            }
            if (!userModel.Status.Value)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "QQ用户已被锁定，无法评论" });
            }
            WebSiteInfo siteInfo = new WebSiteInfo();
            int maxCommentNum = Convert.ToInt32(siteInfo.GetWebSiteInfo().MaxCommentNum);
            int todayCommentNum = service.GetTodayCommentNum(openid);
            if (todayCommentNum>=maxCommentNum)
            {
                //锁定QQ用户
                userModel.Status = false;
                qqUserService.UpdateQQUser(userModel);
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "评论提交失败，已超出每日最大提交数量" });
            }
            CommentModel model = new CommentModel()
            {
                SendId = userModel.Id,
                AcceptId = 0,
                Content = XSS.FilterXSS(editorContent),
                Status = true,
                ParentId = 0,
                ArticleId = Convert.ToInt32(articleid),
                CreateOn = DateTime.Now
            };
            bool result = service.CreateModel(model);
            if (result)
            {
                return Json(new AjaxResult { state = ResultType.success.ToString(), message = "评论提交成功" });
            }
            else
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "评论提交失败" });
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public JsonResult ReplyComment(string openid, string remarkId, string targetUserId, string articleid, string editorContent)
        {
            QQUserModel userModel = qqUserService.GetQQUserByOpenId(openid);
            if (userModel==null)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "非法提交，Openid不存在" });
            }
            if (!userModel.Status.Value)
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "QQ用户已被锁定，无法评论" });
            }
            WebSiteInfo siteInfo = new WebSiteInfo();
            int maxCommentNum = Convert.ToInt32(siteInfo.GetWebSiteInfo().MaxCommentNum);
            int todayCommentNum = service.GetTodayCommentNum(openid);
            if (todayCommentNum >= maxCommentNum)
            {
                //锁定QQ用户
                userModel.Status = false;
                qqUserService.UpdateQQUser(userModel);
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "评论提交失败，已超出每日最大提交数量" });
            }
            CommentModel model = new CommentModel()
            {
                SendId = userModel.Id,
                AcceptId = Convert.ToInt32(targetUserId),
                Content = XSS.FilterXSS(editorContent),
                Status = true,
                ParentId = Convert.ToInt32(remarkId),
                ArticleId = Convert.ToInt32(articleid),
                CreateOn = DateTime.Now
            };
            bool result = service.CreateModel(model);
            if (result)
            {
                return Json(new AjaxResult { state = ResultType.success.ToString(), message = "评论回复成功" });
            }
            else
            {
                return Json(new AjaxResult { state = ResultType.error.ToString(), message = "评论回复失败" });
            }
        }
    }
}