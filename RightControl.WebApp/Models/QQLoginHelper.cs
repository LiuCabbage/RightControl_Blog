using Newtonsoft.Json;
using RightControl.Common;
using System;
using System.Text;

namespace RightControl.WebApp.Models
{
    public class QQLoginHelper
    {
        public static string appId = "101734578"; //申请QQ登录成功后，分配给应用的appid。
        public static string appKey = "6f737128453fdaace7adddbcb9b91c00"; //申请QQ登录成功后，分配给应用的appkey。
        public static string redirect_uri = "http://www.baocaige.top/QQUser/CallBack"; //成功授权后的回调地址，必须是注册appid时填写的主域名下的地址。
        public static string CreateAuthorizeUrl(string state)
        {
            string url = string.Format("{0}?client_id={1}&response_type=code&redirect_uri={2}&state={3}", "https://graph.qq.com/oauth2.0/authorize", appId, redirect_uri, state);
            return url;
        }
        public static string GetAccessToken(string code)
        {
            string url = string.Format("https://graph.qq.com/oauth2.0/token?grant_type={0}&client_id={1}&client_secret={2}&code={3}&redirect_uri={4}", "authorization_code", appId, appKey, code, redirect_uri);
            string result = HttpMethods.HttpGet(url);
            string AccessToken = CutString(result, "access_token=", "&expires_in=");
            string ExpiresIn = CutString(result, "&expires_in=", "&refresh_token=");
            string RefreshToken = result.Split(new string[] { "&refresh_token=" }, StringSplitOptions.None)[1];
            return AccessToken;
        }
        public static string GetOpenId(string access_token)
        {
            string url = string.Format("https://graph.qq.com/oauth2.0/me?access_token={0}", access_token);
            string result = HttpMethods.HttpGet(url);
            string client_id = CutString(result, @"client_id"":""", @""",");
            string openid = CutString(result, @"openid"":""", @"""}");
            return openid;
        }
        public static QQUserInfo GetQQUserInfo(string access_token, string openid)
        {
            string url = string.Format("https://graph.qq.com/user/get_user_info?access_token={0}&oauth_consumer_key={1}&openid={2}", access_token, appId, openid);
            string result = HttpMethods.HttpGet(url, Encoding.UTF8);
            QQUserInfo qqUserInfo = JsonConvert.DeserializeObject<QQUserInfo>(result);
            return qqUserInfo;
        }
        /// <summary>
        /// 截取字符串中两个字符串中的字符串
        /// </summary>
        /// <param name="str">字符串</param>
        /// <param name="startStr">开始字符串</param>
        /// <param name="endStr">结束字符串</param>
        /// <returns></returns>
        public static string CutString(string str, string startStr, string endStr)
        {
            int begin, end;
            begin = str.IndexOf(startStr, 0) + startStr.Length; //开始位置   
            end = str.IndexOf(endStr, begin);            //结束位置     
            return str.Substring(begin, end - begin);   //取搜索的条数，用结束的位置-开始的位置,并返回     
        }
    }
}