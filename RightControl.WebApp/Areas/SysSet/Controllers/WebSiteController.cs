using RightControl.Common;
using RightControl.WebApp.Areas.Admin.Controllers;
using System;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.SysSet.Controllers
{
    public class WebSiteController : BaseController
    {
        // GET: SysSet/WebSite
        public override ActionResult Index(int? id)
        {
            return View(GetWebSiteInfo());
        }
        [HttpPost]
        public ActionResult Index(WebSiteModel model)
        {
            try
            {
                Configs.SetValue("OpenComment", model.OpenComment == "on" ? "true" : "false");
                Configs.SetValue("OpenFeedback", model.OpenFeedback == "on" ? "true" : "false");
                Configs.SetValue("SiteName", model.SiteName);
                Configs.SetValue("SiteTitle", model.SiteTitle);
                Configs.SetValue("SiteDomain", model.SiteDomain);
                Configs.SetValue("QQ", model.QQ);
                Configs.SetValue("Mail", model.Mail);
                Configs.SetValue("Address", model.Address);
                Configs.SetValue("Gitee", model.Gitee);
                Configs.SetValue("MetaKey", model.MetaKey);
                Configs.SetValue("MetaDescribe", model.MetaDescribe);
                Configs.SetValue("MaxFileUpload", model.MaxFileUpload);
                Configs.SetValue("HomeTitle", model.HomeTitle);
                Configs.SetValue("CacheTime", model.CacheTime);
                Configs.SetValue("CopyRight", model.CopyRight);
                Configs.SetValue("UploadFileType", model.UploadFileType);
            }
            catch (Exception ex)
            {
                ViewBag.Msg = "Error:"+ex.Message;
                return View(GetWebSiteInfo());
            }
            ViewBag.Msg = "修改成功！";
            return View(GetWebSiteInfo());
        }
    }
}