using RightControl.Common;

namespace RightControl.WebApp.Models
{
    public class WebSiteInfo
    {
        public WebSiteModel GetWebSiteInfo()
        {
            return new WebSiteModel
            {
                MaxCommentNum = Configs.GetValue("MaxCommentNum"),
                MaxFeedbackNum = Configs.GetValue("MaxFeedbackNum"),
                OpenComment = Configs.GetValue("OpenComment"),
                OpenFeedback = Configs.GetValue("OpenFeedback"),
                SiteName = Configs.GetValue("SiteName"),
                SiteTitle = Configs.GetValue("SiteTitle"),
                SiteDomain = Configs.GetValue("SiteDomain"),
                QQ = Configs.GetValue("QQ"),
                Mail = Configs.GetValue("Mail"),
                Address = Configs.GetValue("Address"),
                Gitee = Configs.GetValue("Gitee"),
                CacheTime = Configs.GetValue("CacheTime"),
                MaxFileUpload = Configs.GetValue("MaxFileUpload"),
                UploadFileType = Configs.GetValue("UploadFileType"),
                HomeTitle = Configs.GetValue("HomeTitle"),
                MetaKey = Configs.GetValue("MetaKey"),
                MetaDescribe = Configs.GetValue("MetaDescribe"),
                CopyRight = Configs.GetValue("CopyRight")
            };
        }
    }
}