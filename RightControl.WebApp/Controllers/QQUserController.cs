using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;
using RightControl.Model;
using System.Web.Routing;

namespace RightControl.WebApp.Controllers
{
    public class QQUserController : Controller
    {
        public IQQUserService service { get; set; }
        // GET: QQUser
        [HttpGet]
        public ActionResult QQLogin()
        {
            string appId = "101734578"; //申请QQ登录成功后，分配给应用的appid。
            string redirect_uri = "http://www.baocaige.top/QQUser/CallBack"; //成功授权后的回调地址，必须是注册appid时填写的主域名下的地址。
            string salt = DateTime.Now.ToString("yyyyMMddHHmmssffff");  //client端的状态值。用于第三方应用防止CSRF攻击，成功授权后回调时会原样带回。
            string url = string.Format("{0}?client_id={1}&response_type=code&redirect_uri={2}&state={3}", "https://graph.qq.com/oauth2.0/authorize", appId, redirect_uri, salt);
            RouteValueDictionary routeValue = RouteData.Route.GetRouteData(this.HttpContext).Values;
            Session["QQLoginSalt"] = salt;    //记录client端状态值
            Session["BeforeLoginUrl"] = Request.UrlReferrer;    //记录登陆之前的URL，登陆成功后返回
            return Redirect(url);
        }
        [HttpGet]
        public ActionResult QQLogOut()
        {
            return View();
        }
        [HttpGet]
        public ActionResult CallBack()
        {
            return View();
        }
    }
}