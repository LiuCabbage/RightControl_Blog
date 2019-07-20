using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using RightControl.IService;
using RightControl.Model;

namespace RightControl.WebApp.Controllers
{
    public class QQUserController : Controller
    {
        public IQQUserService service { get; set; }
        // GET: QQUser
        public ActionResult QQLogin()
        {
            //模拟QQ登录
            QQUserModel model = new QQUserModel()
            {
                Id = 1,
                OpenId = "123456",
                NickName = "",
                Gender=1,
                HeadShot= "/Upload/img/502.jpg",
                Email="178899573@qq.com",
                LastLogin=DateTime.Now,
                CreateOn=DateTime.Now
            };
            HttpCookie cookie = new HttpCookie("LoginUser");
            cookie.Value = model.ToString();    //RightControl.Model.QQUserModel cookie 有问题
            cookie.Expires = DateTime.Now.Add(new TimeSpan(168, 0, 0));//cookie保存7天
            Response.Cookies.Add(cookie);
            return RedirectToAction("Index","Article");
        }
        public ActionResult QQLogOut()
        {
            return View();
        }
    }
}