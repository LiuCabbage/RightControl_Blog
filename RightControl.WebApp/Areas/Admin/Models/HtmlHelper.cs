using RightControl.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace RightControl.WebApp
{
    public static class MyExtHtmlLabel
    {
        /// <summary>
        /// 博客前台文章归档
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="_year"></param>
        /// <param name="_list"></param>
        /// <returns></returns>
        public static HtmlString ArchivesHtml(this HtmlHelper helper, dynamic _year = null, dynamic _list = null)
        {
            StringBuilder sb = new StringBuilder();
            var year = _year as List<ArticleModel>;
            var list = _list as List<ArticleModel>;
            if (year != null && list != null)
            {
                foreach (ArticleModel y in year)
                {
                    var query = from u in list
                                where u.CreateOn.ToString("yyyy") == y.Year
                                select u;
                    var articleCount = query.ToList().Count;
                    sb.AppendFormat(@"<div class='post-archives-list'>
                                    <h3>{0} 年<sup>「 {1} 」</sup></h3>
                                    <ul>", y.Year, articleCount);
                    foreach (ArticleModel item in list)
                    {
                        if (y.Year == item.CreateOn.ToString("yyyy"))
                        {
                            sb.AppendFormat(@"<li>
                                                <a href='/Article/Detail/{0}' class=''>{1}</a>
                                                <time class='mo-text-hint'>({2})</time>
                                            </li>", item.Id, item.Title, item.CreateOn.ToString("yyyy-MM-dd HH:mm:ss"));
                        }
                    }
                    sb.Append(@"</ul>
                            </div>");
                }
            }
            return new HtmlString(sb.ToString());
        }
        /// <summary>
        /// 博客前台日记
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="_year"></param>
        /// <param name="_list"></param>
        /// <returns></returns>
        public static HtmlString DiarysHtml(this HtmlHelper helper, dynamic _year = null, dynamic _list = null)
        {
            StringBuilder sb = new StringBuilder();
            var year = _year as List<DiarysModel>;
            var list = _list as List<DiarysModel>;
            if (year != null && list != null)
            {
                bool isFirst = true;
                foreach (DiarysModel y in year)
                {
                    //默认展开第一个
                    string downOrRightClss = isFirst ? "fa-caret-down" : "fa-caret-right";
                    string isHideStr = isFirst ? "" : "style='display: none;'";

                    sb.AppendFormat(@"<div class='timeline-year'>
                                  <h2><a class='yearToggle'>{0} 年</a><i class='fa fa-fw {1}'></i></h2>
                                  <div class='timeline-month' {2}>
                                      <ul>", y.Year, downOrRightClss, isHideStr);

                    isFirst = false;

                    foreach (DiarysModel item in list)
                    {
                        if (y.Year == item.CreateOn.ToString("yyyy"))
                        {
                            sb.AppendFormat(@"<li>
                                        <div class='h4 animated fadeInLeft'>
                                            <p class='date'>{0}</p>
                                        </div>
                                        <p class='dot-circle animated '><i class='fa fa-dot-circle-o'></i></p>
                                        <div class='content animated fadeInRight'>{1}</div>
                                        <div class='clear'></div>
                                    </li>", item.CreateOn.ToString("MM月dd日"), item.Content);
                        }
                    }
                    sb.Append(@"</ul>
                            </div>
                        </div>");
                }
            }
            return new HtmlString(sb.ToString());
        }
        /// <summary>
        /// 菜单管理权限复选框
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="_list"></param>
        /// <returns></returns>
        public static HtmlString ActionCheckBox(this HtmlHelper helper, dynamic _list = null, dynamic _alist = null)
        {
            StringBuilder sb = new StringBuilder();
            var list = _list as List<ActionModel>;
            var alist = _alist as List<ActionModel>;
            if (list != null && list.Count > 0)
            {
                foreach (var v in list)
                {
                    bool isSelect = false;
                    foreach (var item in alist)
                    {
                        if (v.ActionCode == item.ActionCode)
                        {
                            isSelect = true;
                        }
                    }
                    sb.AppendFormat(@"<input type='checkbox' lay-skin='primary' name='{0}' title='{1}' value='{2}' {3}>", v.ActionCode, v.ActionName, v.Id, isSelect ? "checked" : "");
                }
            }
            return new HtmlString(sb.ToString());
        }
        public static HtmlString DisplayStatusHtml(this HtmlHelper helper, bool? value)
        {
            var msg = value.Value ? "启用" : "停用";
            return new HtmlString(string.Format("<span>{0}</span>", msg));
        }
        public static HtmlString StatusRadioHtml(this HtmlHelper helper, bool? value)
        {
            var msg = value.Value ? "启用" : "停用";
            string enabledStatus = value.Value ? "checked" : "";
            string disabledStatus = value.Value ? "" : "checked";

            string result = string.Format(@"<input name = ""Status"" value = ""true"" title = ""启用"" {0} type = ""radio"" >
<div class=""layui-unselect layui-form-radio layui-form-radioed""><i class=""layui-anim layui-icon""></i><div>启用</div></div>
  <input name = ""Status"" value=""false"" title=""停用"" type=""radio"" {1}>
<div class=""layui-unselect layui-form-radio""><i class=""layui-anim layui-icon""></i><div>停用</div></div>", enabledStatus, disabledStatus);

            return new HtmlString(result);
        }
        public static HtmlString DingRadioHtml(this HtmlHelper helper, bool? value)
        {
            var msg = value.Value ? "置顶" : "不置顶";
            string enabledDing = value.Value ? "checked" : "";
            string disabledDing = value.Value ? "" : "checked";

            string result = string.Format(@"<input name = ""Ding"" value = ""1"" title = ""置顶"" {0} type = ""radio"" >
<div class=""layui-unselect layui-form-radio layui-form-radioed""><i class=""layui-anim layui-icon""></i><div>置顶</div></div>
  <input name = ""Ding"" value=""0"" title=""不置顶"" type=""radio"" {1}>
<div class=""layui-unselect layui-form-radio""><i class=""layui-anim layui-icon""></i><div>不置顶</div></div>", enabledDing, disabledDing);

            return new HtmlString(result);
        }
        /// <summary>
        /// 状态下拉框
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="defaultTxt">默认显示文本</param>
        /// <returns></returns>
        public static HtmlString StatusSelectHtml(this HtmlHelper helper, string defaultTxt = "")
        {
            return new HtmlString(string.Format(@"<select name='Status'>
                            <option value = ''>{0}</option >
                            <option value = 'true'> 启用 </option>
                            <option value = 'false'> 停用 </option>
                             </select>", defaultTxt));
        }
        /// <summary>
        /// 性别下拉框
        /// </summary>
        /// <param name="helper"></param>
        /// <param name="defaultTxt">默认显示文本</param>
        /// <returns></returns>
        public static HtmlString GanderRadioHtml(this HtmlHelper helper, int defaultVal = 1)
        {
            var _male = defaultVal == 1 ? "checked" : "";
            var _female = defaultVal == 0 ? "checked" : "";
            return new HtmlString(string.Format(@"<input type='radio' name='Gender' value='1' title='男' {0}>
                     <input type='radio' name='Gender' value='0' title='女' {1}>", _male, _female));
        }
        /// <summary>
        /// 搜索按钮
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static HtmlString SearchBtnHtml(this HtmlHelper helper, string txt = "搜索", string _class = "")
        {
            return new HtmlString(string.Format("<a href='javascript:;' class='layui-btn{1}' id='btnSearch' data-type='reload'><i class='layui-icon'>&#xe615;</i>{0}</a>", txt, _class));
        }
        /// <summary>
        /// 重置按钮
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static HtmlString ResetBtnHtml(this HtmlHelper helper, string txt = "重置", string _class = " layui-btn-primary")
        {
            return new HtmlString(string.Format("<button type='reset' class='layui-btn{1}'>{0}</button>", txt, _class));
        }
        /// <summary>
        /// 表单内工具栏
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static HtmlString ToolBarHtml(this HtmlHelper helper, dynamic _list = null)
        {
            StringBuilder sb = new StringBuilder();
            //sb.Append("<script type='text/html' id='bar'>");
            var list = _list as List<ActionModel>;
            if (list != null && list.Count > 0)
            {
                foreach (var v in list)
                {
                    var _icon = string.IsNullOrEmpty(v.Icon) ? "" : string.Format("<i class='layui-icon iconfont {0}'></i>", v.Icon);
                    sb.AppendFormat("<a class='layui-btn layui-btn-xs {0}' lay-event='{1}'>{3}{2}</a>", v.ClassName, v.Method, v.ActionName, _icon);
                }
            }
            //sb.Append("</script>");
            return new HtmlString(sb.ToString());
        }
        /// <summary>
        /// 表单外工具栏
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static HtmlString TopToolBarHtml(this HtmlHelper helper, dynamic _list = null, string initTxt = null)
        {
            StringBuilder sb = new StringBuilder();
            var list = _list as List<ActionModel>;
            if (list != null && list.Count > 0)
            {
                foreach (var v in list)
                {
                    sb.AppendFormat(@"<a href='javascript:;' class='layui-btn {0}' id='btn{1}'>
                            <i class='layui-icon iconfont {2}'></i> {3}
                        </a>", v.ClassName, v.ActionCode, v.Icon, initTxt == null ? v.ActionName : initTxt);
                }
            }
            return new HtmlString(sb.ToString());
        }
    }
}