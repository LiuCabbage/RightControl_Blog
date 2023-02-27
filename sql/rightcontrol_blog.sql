/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : rightcontrol_blog

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 27/02/2023 23:25:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_action
-- ----------------------------
DROP TABLE IF EXISTS `t_action`;
CREATE TABLE `t_action`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ActionCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作编码',
  `ActionName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作名称',
  `Position` int NULL DEFAULT NULL COMMENT '显示位置（1：表单内，2：表单右上）',
  `Icon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `Method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `Remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `OrderBy` int NULL DEFAULT NULL COMMENT '排序号',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '更新者',
  `ClassName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式名称',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_action
-- ----------------------------
INSERT INTO `t_action` VALUES (1, 'Add', '添加', 1, 'icon-add', 'Add', NULL, 0, b'1', '2019-02-28 14:44:33', '2019-06-15 23:32:07', 0, 1, NULL);
INSERT INTO `t_action` VALUES (2, 'edit', '编辑', 0, 'icon-bianji', 'edit', NULL, 0, b'1', '2019-02-28 14:44:36', '2019-02-28 14:45:21', 0, 0, NULL);
INSERT INTO `t_action` VALUES (3, 'detail', '查看', 0, 'icon-chakan', 'detail', NULL, 0, b'1', '2019-02-28 14:44:39', '2019-02-28 14:45:24', 0, 0, 'layui-btn-normal');
INSERT INTO `t_action` VALUES (4, 'del', '删除', 0, 'icon-guanbi', 'del', NULL, 0, b'1', '2019-02-28 14:44:42', '2019-02-28 14:45:27', 0, 0, 'layui-btn-danger');
INSERT INTO `t_action` VALUES (5, 'reset', '重置密码', 0, 'icon-reset', 'reset', NULL, 0, b'1', '2019-02-28 14:44:45', '2019-06-15 23:34:55', 0, 1, 'layui-btn-warm');
INSERT INTO `t_action` VALUES (6, 'assign', '分配权限', 0, 'icon-jiaoseguanli', 'assign', NULL, 0, b'1', '2019-02-28 14:44:48', '2019-02-28 14:45:34', 0, 0, NULL);
INSERT INTO `t_action` VALUES (7, 'BatchDel', '批量删除', 1, 'icon-shanchu', 'BatchDel', NULL, 0, b'1', '2019-06-15 23:34:15', '0001-01-01 00:00:00', 1, 0, NULL);
INSERT INTO `t_action` VALUES (8, 'menu_action', '菜单权限', 0, 'icon-setting-permissions', 'menu_action', NULL, 0, b'1', '2019-06-17 17:00:29', '0001-01-01 00:00:00', 1, 0, NULL);

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `ZhaiYao` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `ImgUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章封面',
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `TypeId` int NULL DEFAULT NULL COMMENT '类型ID',
  `ClassId` int NULL DEFAULT NULL COMMENT '分类ID',
  `Ding` int NULL DEFAULT NULL COMMENT '是否置顶',
  `ReadNum` int NULL DEFAULT NULL COMMENT '阅读数',
  `CommentNum` int NULL DEFAULT NULL COMMENT '评论数',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (1, 'ASP.NET MVC 通用角色权限管理系统', 'RightControl 介绍 .NET 通用后台角色权限管理系统，已完成。项目地址：http://rightcontrol.baocaige.top/Admin/Login 码云地址：https://gitee.com/Liu_Cabbage/RightControl 软件架构 通用三层架构，面向接口编程。', '/Upload/img/1260852-20190620144549201-1384742553.jpg', '<h1 style=\"margin-top: 10px; margin-bottom: 10px; line-height: 1.5; font-size: 28px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">RightControl</h1><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"介绍\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E4%BB%8B%E7%BB%8D\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>介绍</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">.NET 通用后台角色权限管理系统，已完成。<br>项目地址：<a href=\"http://rightcontrol.baocaige.top/Admin/Login\" target=\"_blank\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\">http://rightcontrol.baocaige.top/Admin/Login</a><br>码云地址：<a href=\"https://gitee.com/Liu_Cabbage/RightControl\" target=\"_blank\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\">https://gitee.com/Liu_Cabbage/RightControl</a></p><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"软件架构\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E8%BD%AF%E4%BB%B6%E6%9E%B6%E6%9E%84\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>软件架构</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">通用三层架构，面向接口编程。</p><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"技术选型\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E6%8A%80%E6%9C%AF%E9%80%89%E5%9E%8B\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>技术选型</h4><ol class=\"task-list\" style=\"padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><li style=\"list-style: decimal;\">MVC5</li><li style=\"list-style: decimal;\">Mysql</li><li style=\"list-style: decimal;\">Dapper</li><li style=\"list-style: decimal;\">Autofac</li><li style=\"list-style: decimal;\">Layui</li><li style=\"list-style: decimal;\">阿里巴巴矢量库</li></ol><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"使用说明\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>使用说明</h4><ol class=\"task-list\" style=\"padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><li style=\"list-style: decimal;\">先创建数据库，然后执行sql目录下面的rightcontrol.sql即可。</li><li style=\"list-style: decimal;\">账号：admin</li><li style=\"list-style: decimal;\">密码：123456</li></ol><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"项目由来\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E9%A1%B9%E7%9B%AE%E7%94%B1%E6%9D%A5\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>项目由来</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">邹琼俊 .net项目驱动学习&nbsp;<a href=\"https://edu.csdn.net/course/detail/8137\" target=\"_blank\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\">https://edu.csdn.net/course/detail/8137&nbsp;</a>由于是付费课程，我这里不贴出博主的项目git地址<br>第一次自己动手做一个通用权限管理后台，看视频一步步完成。 各位看官大佬觉得还可以的话，麻烦点个Star。</p><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"个人新增及修改的bug\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E4%B8%AA%E4%BA%BA%E6%96%B0%E5%A2%9E%E5%8F%8A%E4%BF%AE%E6%94%B9%E7%9A%84bug\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>个人新增及修改的Bug</h4><ol class=\"task-list\" style=\"padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><li style=\"list-style: decimal;\">基本资料性别更改后后台数据不更新</li><li style=\"list-style: decimal;\">菜单管理没有删除功能</li><li style=\"list-style: decimal;\">菜单管理没有操作按钮设置功能</li><li style=\"list-style: decimal;\">没有批量删除</li><li style=\"list-style: decimal;\">角色管理分配权限里不显示新增的菜单</li><li style=\"list-style: decimal;\">删除菜单同时清除菜单权限，菜单角色权限</li><li style=\"list-style: decimal;\">删除按钮同时清除菜单权限，菜单角色权限</li><li style=\"list-style: decimal;\">删除角色同时清除菜单角色权限</li></ol><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"项目截图\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>项目截图</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><img src=\"/Upload/img/1260852-20190620144549201-1384742553_1.jpg\" alt=\"undefined\"><br></p><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><img src=\"/Upload/img/1260852-20190620144600057-1249279035.png\" alt=\"undefined\"><br></p>', 1, 1, 1, 107, 0, b'1', '2019-07-29 17:01:39', '2019-07-29 17:04:18');
INSERT INTO `t_article` VALUES (2, '码云 VS首次提交代码报错：failed to push some refs to \'https://gitee.com/Liu_Cabbage/ASP.NET-MVC-QQ-Connect.git\'', '打开命令提示符： 执行合并命令： git pull --rebase origin master 最后总结： 1、多为第一次提交代码，本地和码云仓库不一致，README.md文件不在本地代码目录中 2、可以通过如下命令进行代码合并【注：pull=fetch+merge] git pull --rebase origin master  3、执行上面代码后可以看到本地代码库中多了README.md文件  4、此时再执行语句 git push 或者用VS的推送', '/Upload/img/u=2715563049,865769039&fm=26&gp=0.jpg', '<p><img src=\"/Upload/img/1.jpg\" alt=\"undefined\"><br></p><p>打开命令提示符：</p><p><img src=\"/Upload/img/2.jpg\" alt=\"undefined\"><br></p><p>执行合并命令：</p><p>git pull --rebase origin master</p><p>最后总结：</p><p>1、多为第一次提交代码，本地和码云仓库不一致，README.md文件不在本地代码目录中</p><p>2、可以通过如下命令进行代码合并【注：pull=fetch+merge]</p><p>git pull --rebase origin master</p><p>3、执行上面代码后可以看到本地代码库中多了README.md文件</p><p>4、此时再执行语句&nbsp;git push 或者用VS的推送</p>', 1, 7, 0, 16, 0, b'1', '2019-07-29 17:13:45', '2019-07-29 17:14:04');
INSERT INTO `t_article` VALUES (3, 'Mysql 随机获得表的几条记录', '在做博客文章详情的时候，有一个拓展阅读的功能： 想法一：根据当前文章Id，写死两条链接，Id+1，Id-1，但是文章Id可能被删除，Id不连续，不可取。× 想法二：获得当前文章记录的前一条和后一条记录，好像有点难受，要查询两次。查询两次，可行。√ 想法三：直接获取文章表两条随机的记录。一次查询，舒服。√', '/Upload/img/1260852-20190717163824398-638143940.png', '<p>在做博客文章详情的时候，有一个拓展阅读的功能：</p><p><img src=\"/Upload/img/1260852-20190717163824398-638143940_1.png\" alt=\"undefined\"><br></p><p>想法一：根据当前文章Id，写死两条链接，Id+1，Id-1，但是文章Id可能被删除，Id不连续，不可取。×</p><p>想法二：获得当前文章记录的前一条和后一条记录，好像有点难受，要查询两次。查询两次，可行。√</p><p>想法三：直接获取文章表两条随机的记录。一次查询，舒服。√</p><div class=\"cnblogs_code\"><pre>SELECT *<span>\r\nFROM t_article\r\nWHERE Id </span>&gt;= ((SELECT MAX(Id) FROM t_article)-(SELECT MIN(Id) FROM t_article)) * RAND() +<span> (SELECT MIN(Id) FROM t_article)\r\nLIMIT </span><span>2</span></pre></div><p>ArticleService对应的方法</p><div class=\"cnblogs_code\"><pre><span>        ///</span> <span>&lt;summary&gt;</span>\r\n        <span>///</span><span> 延伸阅读-获取两条随机文章\r\n        </span><span>///</span> <span>&lt;/summary&gt;</span>\r\n        <span>///</span> <span>&lt;param name=\"num\"&gt;&lt;/param&gt;</span>\r\n        <span>///</span> <span>&lt;returns&gt;&lt;/returns&gt;</span>\r\n        <span>public</span> IEnumerable&lt;ArticleModel&gt; GetRandomArticleList(<span>int</span><span> num)\r\n        {\r\n            </span><span>string</span> _where = <span>\"</span><span>WHERE Id &gt;= ((SELECT MAX(Id) FROM t_article)-(SELECT MIN(Id) FROM t_article)) * RAND() + (SELECT MIN(Id) FROM t_article) LIMIT </span><span>\"</span>+<span>num;\r\n            </span><span>return</span> repository.GetByWhere(_where,<span>null</span>,<span>null</span>,<span>null</span><span>); ;\r\n        }</span></pre></div><p>&nbsp;</p>', 1, 3, 0, 16, 0, b'1', '2019-07-29 17:16:24', '2019-07-29 17:16:32');
INSERT INTO `t_article` VALUES (4, 'ASP.NET MVC 使用分部视图制作公共头部，尾部，并通过ViewBag传值', ' 一：新建分部视图 二：布局页_Layout.cshtml上调用 不灵活，不能传递数据，引用静态公共部分 通过控制器方法引入分部视图，控制器里可以向分部视图传递数据，引用动态公共部分 三：代码展示： 布局页_Layout.cshtml，因为@RenderSection只能放在布局页，所以@Html.Action(\"Foot\", \"Home\")下面的一坨就没放在_Foot里面，会报错。', '/Upload/img/1260852-20190712145504706-1458531772.jpg', '<p>一：新建分部视图</p><p><img src=\"/Upload/img/2019071215113829.jpg\" alt=\"undefined\"><br></p><p>二：布局页_Layout.cshtml上调用</p><p>不灵活，不能传递数据，引用静态公共部分</p><p>@Html.Partial(\"_Head\")</p><p>@Html.Partial(\"~/Views/Shared/_Head.cshtml\")</p><p>通过控制器方法引入分部视图，控制器里可以向分部视图传递数据，引用动态公共部分</p><p>@Html.Action(\"Head\", \"Home\")</p><p>三：代码展示：</p><p>布局页_Layout.cshtml，因为@RenderSection只能放在布局页，所以@Html.Action(\"Foot\", \"Home\")下面的一坨就没放在_Foot里面，会报错。</p><p></p><p></p><p></p><p>&lt;!DOCTYPE html&gt;</p><p>&lt;html&gt;</p><p>&lt;head&gt;</p><p>&nbsp; &nbsp; &lt;meta charset=\"utf-8\" /&gt;</p><p>&nbsp; &nbsp; &lt;meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"&gt;</p><p>&nbsp; &nbsp; &lt;title&gt;@ViewBag.Title&lt;/title&gt;</p><p>&nbsp; &nbsp; @Html.Action(\"Meta\", \"Home\")</p><p>&nbsp; &nbsp; &lt;link rel=\"stylesheet\" href=\"~/Content/font-awesome/css/font-awesome.min.css\"&gt;</p><p>&nbsp; &nbsp; &lt;link rel=\"stylesheet\" href=\"~/Content/layui/css/layui.css\" /&gt;</p><p>&nbsp; &nbsp; &lt;link rel=\"stylesheet\" href=\"~/Content/css/master.css\" /&gt;</p><p>&nbsp; &nbsp; &lt;link rel=\"stylesheet\" href=\"~/Content/css/gloable.css\" /&gt;</p><p>&nbsp; &nbsp; &lt;link rel=\"stylesheet\" href=\"~/Content/css/nprogress.css\" /&gt;</p><p>&nbsp; &nbsp; @RenderSection(\"css\", required: false)</p><p>&lt;/head&gt;</p><p>&lt;body&gt;</p><p>&nbsp; &nbsp; @Html.Action(\"Head\", \"Home\")</p><p>&nbsp; &nbsp; @RenderBody()</p><p>&nbsp; &nbsp; @Html.Action(\"Foot\", \"Home\")</p><p>&nbsp; &nbsp; &lt;script src=\"~/Content/layui/layui.js\"&gt;&lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script src=\"~/Content/js/yss/gloable.js\"&gt;&lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script src=\"~/Content/js/plugins/nprogress.js\"&gt;&lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script&gt;NProgress.start();&lt;/script&gt;</p><p>&nbsp; &nbsp; @RenderSection(\"js\", required: false)</p><p>&nbsp; &nbsp; &lt;script&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; window.onload = function () {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NProgress.done();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; };</p><p>&nbsp; &nbsp; &lt;/script&gt;</p><p>&nbsp; &nbsp; &lt;script&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; (function () {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var bp = document.createElement(\'script\');</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var curProtocol = window.location.protocol.split(\':\')[0];</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (curProtocol === \'https\') {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bp.src = \'https://zz.bdstatic.com/linksubmit/push.js\';</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bp.src = \'http://push.zhanzhang.baidu.com/push.js\';</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; var s = document.getElementsByTagName(\"script\")[0];</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; s.parentNode.insertBefore(bp, s);</p><p>&nbsp; &nbsp; &nbsp; &nbsp; })();</p><p>&nbsp; &nbsp; &lt;/script&gt;</p><p>&lt;/body&gt;</p><p>&lt;/html&gt;</p><p></p><p></p><p></p><p>我把控制器方法写在了首页，因为博客首页头部尾部不公共的，其实写哪里都一样，返回分部视图就ok。</p><p>首页控制器：/Home</p><p>返回分部视图千万不要用 return View(model.GetWebSiteInfo());&nbsp; 会默认找~Views/Home/ 下面的视图，严重错误，IIS Express直接崩掉自动退出</p><p>using RightControl.IService;</p><p>using RightControl.WebApp.Models;</p><p>using System.Web.Mvc;</p><p><br></p><p>namespace RightControl.WebApp.Controllers</p><p>{</p><p>&nbsp; &nbsp; public class HomeController : Controller</p><p>&nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public IArticleService service { get; set; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; WebSiteInfo model = new WebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; // GET: Home</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Index()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.HotArtileList = service.GetHotArticle(3);</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return View(model.GetWebSiteInfo());</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Meta()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.Site = model.GetWebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PartialView(\"~/Views/Shared/_Meta.cshtml\");</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Head()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.Site = model.GetWebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PartialView(\"~/Views/Shared/_Head.cshtml\");</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; &nbsp; &nbsp; public ActionResult Foot()</p><p>&nbsp; &nbsp; &nbsp; &nbsp; {</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ViewBag.Site = model.GetWebSiteInfo();</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return PartialView(\"/Views/Shared/_Foot.cshtml\");</p><p>&nbsp; &nbsp; &nbsp; &nbsp; }</p><p>&nbsp; &nbsp; }</p><p>}</p><p>_Meta.cshtml</p><p>&lt;meta name=\"keywords\" content=\"@ViewBag.Site.MetaKey\" /&gt;</p><p>&lt;meta name=\"description\" content=\"@ViewBag.Site.MetaDescribe\"&gt;</p><p>_Head.cshtml</p><p>&lt;div class=\"header\"&gt;</p><p>&lt;/div&gt;</p><p>&lt;header class=\"gird-header\"&gt;</p><p>&nbsp; &nbsp; &lt;div class=\"header-fixed\"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;div class=\"header-inner\"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;a href=\"javascript:void(0)\" class=\"header-logo\" id=\"logo\"&gt;@ViewBag.Site.SiteName&lt;/a&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;nav class=\"nav\" id=\"nav\"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href=\"/Home\"&gt;首页&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href=\"/Article\"&gt;博客&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href=\"/Feedback\"&gt;留言&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href=\"/Diarys\"&gt;日记&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href=\"/Links\"&gt;友链&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;a href=\"/About\"&gt;关于&lt;/a&gt;&lt;/li&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/ul&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/nav&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;a href=\"/User/QQLogin\" class=\"blog-user\"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i class=\"fa fa-qq\"&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/a&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;a class=\"phone-menu\"&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;i&gt;&lt;/i&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;/a&gt;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &lt;/div&gt;</p><p>&nbsp; &nbsp; &lt;/div&gt;</p><p>&lt;/header&gt;</p><p>_Foot.cshtml</p><p></p><p>最终效果：</p><pre>&lt;footer <span>class</span>=<span>\"</span><span>grid-footer</span><span>\"</span>&gt;\r\n    &lt;div <span>class</span>=<span>\"</span><span>footer-fixed</span><span>\"</span>&gt;\r\n        &lt;div <span>class</span>=<span>\"</span><span>copyright</span><span>\"</span>&gt;\r\n            &lt;div <span>class</span>=<span>\"</span><span>info</span><span>\"</span>&gt;\r\n                &lt;div <span>class</span>=<span>\"</span><span>contact</span><span>\"</span>&gt;\r\n                    &lt;a href=<span>\"</span><span>@ViewBag.Site.Gitee</span><span>\"</span> <span>class</span>=<span>\"</span><span>github</span><span>\"</span> target=<span>\"</span><span>_blank</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-github</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                    &lt;a href=<span>\"</span><span>https://wpa.qq.com/msgrd?v=3&amp;uin=@ViewBag.Site.QQ&amp;site=qq&amp;menu=yes</span><span>\"</span> <span>class</span>=<span>\"</span><span>qq</span><span>\"</span> target=<span>\"</span><span>_blank</span><span>\"</span> title=<span>\"</span><span>@ViewBag.Site.QQ</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-qq</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                    &lt;a href=<span>\"</span><span>https://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=@ViewBag.Site.Mail</span><span>\"</span> <span>class</span>=<span>\"</span><span>email</span><span>\"</span> target=<span>\"</span><span>_blank</span><span>\"</span> title=<span>\"</span><span>@ViewBag.Site.Mail</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-envelope</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                    &lt;a href=<span>\"</span><span>javascript:void(0)</span><span>\"</span> <span>class</span>=<span>\"</span><span>weixin</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-weixin</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                &lt;/div&gt;\r\n                &lt;p <span>class</span>=<span>\"</span><span>mt05</span><span>\"</span>&gt;<span>\r\n                    @ViewBag.Site.CopyRight\r\n                </span>&lt;/p&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/footer&gt;</pre><p><img src=\"https://www.baocaige.top/Upload/img/1260852-20190712145453950-818976929.jpg\" alt=\"undefined\"><br></p><p><img src=\"https://www.baocaige.top/Upload/img/1260852-20190712145504706-1458531772_1.jpg\" alt=\"undefined\"><br></p><p>头部尾部提取公共部分还有一种做法，不用分部视图，直接用布局页：</p><p>新建BaseController控制器，里面获取网站头部尾部需要的WebSiteInfo信息，除开博客首页每个页面的控制器都继承它，布局页直接使用BaseController的WebSiteInfo信息，通过ViewBag的方式给布局页头尾赋值。</p><p>最后总结，个人还是喜欢用分部视图来抽出头部尾部的，继承BaseController的方法虽然不用新建部分视图，但是也要每个有公共头尾的页面控制器去继承它，想想也有点膈应。</p>', 1, 1, 0, 87, 0, b'1', '2019-07-29 17:20:34', '2019-08-10 10:36:52');
INSERT INTO `t_article` VALUES (5, 'Dapper+Mysql 使用LIKE模糊查询写法踩坑', 'LIKE \'%@Title%\' 会解析成\'%\'@Title\'%\' 这里用拼接也是不行的\'%\'+@Title+\'%\' 只能用MySQL函数方法拼接', '/Upload/img/temo123.jpg', '<p><span>LIKE \'%@Title%\' 会解析成\'%\'@Title\'%\' 这里用拼接也是不行的\'%\'+@Title+\'%\' 只能用MySQL函数方法拼接</span></p><div><div class=\"cnblogs_Highlighter sh-gutter\"><div id=\"highlighter_940382\" class=\"syntaxhighlighter  csharp\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"layui-table\"><tbody><tr><td class=\"gutter\"><div class=\"line number1 index0 alt2\" style=\"text-align: right;\">1</div><div class=\"line number2 index1 alt1\" style=\"text-align: right;\">2</div><div class=\"line number3 index2 alt2\" style=\"text-align: right;\">3</div><div class=\"line number4 index3 alt1\" style=\"text-align: right;\">4</div><div class=\"line number5 index4 alt2\" style=\"text-align: right;\">5</div><div class=\"line number6 index5 alt1\" style=\"text-align: right;\">6</div><div class=\"line number7 index6 alt2\" style=\"text-align: right;\">7</div><div class=\"line number8 index7 alt1\" style=\"text-align: right;\">8</div><div class=\"line number9 index8 alt2\" style=\"text-align: right;\">9</div><div class=\"line number10 index9 alt1\" style=\"text-align: right;\">10</div><div class=\"line number11 index10 alt2\" style=\"text-align: right;\">11</div><div class=\"line number12 index11 alt1\" style=\"text-align: right;\">12</div><div class=\"line number13 index12 alt2\" style=\"text-align: right;\">13</div><div class=\"line number14 index13 alt1\" style=\"text-align: right;\">14</div></td><td class=\"code\"><div class=\"container\"><div class=\"line number1 index0 alt2\"><code class=\"csharp keyword\">public</code>&nbsp;<code class=\"csharp plain\">dynamic GetListByFilter(ArticleModel filter, PageInfo pageInfo)</code></div><div class=\"line number2 index1 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">{</code></div><div class=\"line number3 index2 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">string</code>&nbsp;<code class=\"csharp plain\">_where =&nbsp;</code><code class=\"csharp string\">\" where 1=1\"</code><code class=\"csharp plain\">;</code></div><div class=\"line number4 index3 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">if</code>&nbsp;<code class=\"csharp plain\">(!</code><code class=\"csharp keyword\">string</code><code class=\"csharp plain\">.IsNullOrEmpty(filter.Title))</code></div><div class=\"line number5 index4 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">{</code></div><div class=\"line number6 index5 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp comments\">//LIKE \'%@Title%\' 会解析成\'%\'@Title\'%\' 这里用拼接也是不行的\'%\'+@Title+\'%\' 只能用MySQL函数方法拼接</code></div><div class=\"line number7 index6 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">_where +=&nbsp;</code><code class=\"csharp string\">\" and Title LIKE CONCAT(\'%\',@Title,\'%\')\"</code><code class=\"csharp plain\">;</code></div><div class=\"line number8 index7 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">}</code></div><div class=\"line number9 index8 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">if</code>&nbsp;<code class=\"csharp plain\">(filter.Status !=&nbsp;</code><code class=\"csharp keyword\">null</code><code class=\"csharp plain\">)</code></div><div class=\"line number10 index9 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">{</code></div><div class=\"line number11 index10 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">_where +=&nbsp;</code><code class=\"csharp string\">\" and Status=@Status\"</code><code class=\"csharp plain\">;</code></div><div class=\"line number12 index11 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">}</code></div><div class=\"line number13 index12 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">return</code>&nbsp;<code class=\"csharp plain\">GetListByFilter(filter, pageInfo, _where);</code></div><div class=\"line number14 index13 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">}</code></div></div></td></tr></tbody></table></div></div></div>', 1, 3, 0, 20, 0, b'1', '2019-07-29 17:24:18', '2019-07-29 17:24:22');
INSERT INTO `t_article` VALUES (6, 'Mysql开启远程连接', '首先登录mysql： 然后执行下面两条命令就可开启mysql远程连接： 最后成功连上服务器的MySQL，ლ(•̀ _ •́ ლ)', '/Upload/img/mysql.jpg', '<p>首先登录mysql：</p><p><img src=\"/Upload/img/1260852-20190620183134180-861990751.png\" alt=\"undefined\"><br></p><p>然后执行下面两条命令就可开启mysql远程连接：</p><div class=\"cnblogs_code\"><pre><span>#允许所有用户远程访问 修改用户名和密码为你自己的\r\nmysql</span>&gt; GRANT ALL PRIVILEGES ON *.* TO <span>\'</span><span>USERNAME</span><span>\'</span>@<span>\'</span><span>%</span><span>\'</span> IDENTIFIED BY <span>\'</span><span>PASSWORD</span><span>\'</span><span> WITH GRANT OPTION;\r\n#允许单个ip 修改用户名和密码为你自己的\r\nmysql</span>&gt; GRANT ALL PRIVILEGES ON *.* TO <span>\'</span><span>USERNAME</span><span>\'</span>@<span>\'</span><span>1.2.3.4</span><span>\'</span> IDENTIFIED BY <span>\'</span><span>PASSWORD</span><span>\'</span><span> WITH GRANT OPTION;\r\n#最后\r\nmysql</span>&gt; FLUSH PRIVILEGES;</pre></div><p><img src=\"/Upload/img/1260852-20190620182652975-893533851.png\" alt=\"undefined\"><br></p><p>最后成功连上服务器的MySQL，ლ(•̀ _ •́ ლ)</p>', 1, 3, 0, 53, 0, b'1', '2019-07-29 17:32:11', '2019-08-01 09:30:50');
INSERT INTO `t_article` VALUES (7, 'ASP.NET MVC Liu_Cabbage 个人博客', 'RightControl_Blog 介绍 前台使用燕十三博客前端模板，后台基于RightControl .NET通用角色权限管理系统搭建，已完成。 项目地址：http://www.baocaige.top 码云地址：https://gitee.com/Liu_Cabbage/RightControl_Blog', '/Upload/img/bkfm.jpg', '<h1>RightControl_Blog</h1><h4><a id=\"介绍\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl_Blog#%E4%BB%8B%E7%BB%8D\"></a>介绍</h4><p>前台使用燕十三博客前端模板，后台基于RightControl .NET通用角色权限管理系统搭建，已完成。<br>项目地址：<a href=\"http://www.baocaige.top/\">http://www.baocaige.top</a><br>码云地址：<a href=\"https://gitee.com/Liu_Cabbage/RightControl_Blog\" target=\"_blank\">https://gitee.com/Liu_Cabbage/RightControl_Blog</a></p><p>使用说明</p><p>1.先创建数据库，然后执行sql目录下面的rightcontrol_blog.sql即可。</p><p>2.账号：admin</p><p>3.密码：123456</p><p>项目说明</p><p>1.前台使用燕十三博客前端模板，美观大气。</p><p>2.后台基于RightControl .NET通用角色权限管理系统搭建，节省开发时间。</p><p>3.接入QQ互联，一键登录，降低注册门槛。</p><p>4.网站设置使用XML配置，新增开启评论，开启留言开关。</p><p>5.关于Layui流加载文章列表，评论，留言都是后台拼接，且每页显示数量在对应控制器里可修改。</p><p>6.新增今日评论，留言最大数量配置，每日提交超过后台设置的数量将自动锁定QQ用户。</p><p>项目的其他想法</p><p>1.由于QQ互联不返回QQ号，所以t_qq_user里的Email为空，评论留言的回复邮件通知我没做（要做的话回复的时候判断一下，让用户补充邮箱。）</p><p>2.文章编辑器用的是Layedit，功能有点弱，但是Layui文档全，用的比较舒服（我试过改用wangEditor，只需要引用一个js，但是它上传的图片也是不能右键修改图片大小的，还要重写图片上传方法，我枯了，就退回了Layedit的版本。）</p><p>3.编辑器推荐：KindEditor，UEditor。</p><p>4.流加载文章列表，评论，留言后台拼接代码可优化，双重foreach+if，怎么看都有点沙雕。</p><p><b>项目截图</b></p><p><img src=\"/Upload/img/20190730002458976.png\" alt=\"undefined\"></p><p><img src=\"/Upload/img/20190730002517995.png\" alt=\"undefined\"><br></p><p><img src=\"/Upload/img/20190730002531922.png\" alt=\"undefined\"><br></p><p><img src=\"/Upload/img/1_1.jpg\" alt=\"undefined\"><br></p>', 1, 1, 1, 32, 0, b'1', '2019-08-10 00:00:00', '2019-08-11 19:33:38');

-- ----------------------------
-- Table structure for t_article_class
-- ----------------------------
DROP TABLE IF EXISTS `t_article_class`;
CREATE TABLE `t_article_class`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章分类',
  `OrderNo` int NULL DEFAULT NULL COMMENT '排序ID',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article_class
-- ----------------------------
INSERT INTO `t_article_class` VALUES (1, 'ASP.NET MVC', 0, '2019-07-09 15:05:08');
INSERT INTO `t_article_class` VALUES (2, 'ORM', 0, '2019-07-09 15:08:46');
INSERT INTO `t_article_class` VALUES (3, 'MySQL', 0, '2019-07-09 15:09:14');
INSERT INTO `t_article_class` VALUES (4, 'SQL Server', 0, '2019-07-09 15:09:38');
INSERT INTO `t_article_class` VALUES (5, 'WEB前端', 0, '2019-07-09 15:09:40');
INSERT INTO `t_article_class` VALUES (6, 'IIS', 0, '2019-07-09 15:09:48');
INSERT INTO `t_article_class` VALUES (7, 'BUG记录', 0, '2019-07-09 15:09:58');

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章类型',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type` VALUES (1, '原创', '2019-06-25 18:32:10');
INSERT INTO `t_article_type` VALUES (2, '转载', '2019-06-25 18:32:13');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SendId` int NULL DEFAULT NULL COMMENT '人员ID',
  `AcceptId` int NULL DEFAULT NULL COMMENT '目标人员ID',
  `Content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `ParentId` int NULL DEFAULT NULL COMMENT '父ID',
  `ArticleId` int NULL DEFAULT NULL COMMENT '文章ID',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_diarys
-- ----------------------------
DROP TABLE IF EXISTS `t_diarys`;
CREATE TABLE `t_diarys`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日记内容',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_diarys
-- ----------------------------
INSERT INTO `t_diarys` VALUES (1, '<p><img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/70.gif\" alt=\"[蜡烛]\">2019.7.29 Liu_Cabbage 博客正式上线啦！！！<img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/70.gif\" alt=\"[蜡烛]\"></p>', '2019-07-29 12:18:33');
INSERT INTO `t_diarys` VALUES (2, '<img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/66.gif\" alt=\"[奥特曼]\">欢迎大家留言评论，不要玩XSS哦！！！', '2019-07-29 16:38:28');
INSERT INTO `t_diarys` VALUES (3, '<p><img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif\" alt=\"[鼓掌]\">修复文章评论和留言关闭还可回复</p><p><img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif\" alt=\"[鼓掌]\">web.config 添加400 505页面</p><p><img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif\" alt=\"[鼓掌]\">web.config 添加https woff2</p><p><img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif\" alt=\"[鼓掌]\">修复城市js https</p><p><img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/39.gif\" alt=\"[鼓掌]\">修复默认隐藏登录头像属性title=\"</p>', '2019-08-01 12:33:26');
INSERT INTO `t_diarys` VALUES (4, '<p><img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/62.gif\" alt=\"[浮云]\">竹杖芒鞋轻胜马，一蓑烟雨任平生<img src=\"https://www.baocaige.top/Areas/Admin/plugins/layui/images/face/62.gif\" alt=\"[浮云]\"></p>', '2019-08-03 17:41:42');

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SendId` int NULL DEFAULT NULL COMMENT '人员ID',
  `AcceptId` int NULL DEFAULT NULL COMMENT '目标人员ID',
  `Content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `ParentId` int NULL DEFAULT NULL COMMENT '父ID',
  `City` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `Equip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES (1, 1, 0, '<img src=\"https://www.baocaige.top/Content/layui/images/face/66.gif\" alt=\"[奥特曼]\">少年来一发，看我奥特激光<img src=\"https://www.baocaige.top/Content/layui/images/face/66.gif\" alt=\"[奥特曼]\">', 0, '江西省南昌市', 'Chrome浏览器', '2019-07-30 00:29:47');
INSERT INTO `t_feedback` VALUES (2, 6, 0, '<p><img src=\"https://www.baocaige.top/Content/layui/images/face/64.gif\" alt=\"[围观]\">围观小怪兽打奥特曼<img src=\"https://www.baocaige.top/Content/layui/images/face/64.gif\" alt=\"[围观]\"></p>', 0, '江西省', 'Chrome浏览器', '2019-07-30 10:14:03');
INSERT INTO `t_feedback` VALUES (3, 5, 0, '<p>&lt;javascript type=\'\'text/<span>javascript\"&gt;alert(\"这是xxs？\")&lt;/</span>javascript&gt;</p>', 0, 'CHINA', 'Chrome浏览器', '2019-07-30 10:17:08');
INSERT INTO `t_feedback` VALUES (4, 1, 6, '爱了爱了，走位走位，蛇皮怪！！！', 2, '江西省南昌市', 'Chrome浏览器', '2019-07-30 10:17:22');
INSERT INTO `t_feedback` VALUES (39, 1, 1, '0.0', 2, '江西省南昌市', 'Chrome浏览器', '2019-07-31 12:16:17');
INSERT INTO `t_feedback` VALUES (40, 8, 0, '<p>名称：洋芋 &amp; 土豆<br>网址：www.love208.vip<br>图标：http://cdn.love208.vip/logo.png<br></p><p>描述：用来记录我们两人相识、相恋过程中的点点滴滴，留住两个人的美好回忆。上班后这里也变成了有技术文章的笔记站，如果你喜欢我们的情侣博客，记得留言互动！</p><p><br></p><p>注: 友链已添加</p>', 0, 'CHINA', 'Chrome浏览器', '2019-08-03 10:57:12');
INSERT INTO `t_feedback` VALUES (41, 1, 8, '已添加，没做回复邮箱提醒，扎心', 40, '江西省南昌市', 'Chrome浏览器', '2019-08-03 14:53:46');
INSERT INTO `t_feedback` VALUES (42, 1, 1, '我回复我自己，(｡･∀･)ﾉﾞ嗨', 1, '江西省南昌市', 'Edge浏览器', '2019-08-03 16:26:51');

-- ----------------------------
-- Table structure for t_links
-- ----------------------------
DROP TABLE IF EXISTS `t_links`;
CREATE TABLE `t_links`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `Url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址',
  `Icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `Describe` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_links
-- ----------------------------
INSERT INTO `t_links` VALUES (1, '一款简洁优雅的hexo主题', 'https://zhousiwei.gitee.io', 'https://zhousiwei.gitee.io/img/head.jpg', '一个简洁优雅的hexo主题 A simple and elegant theme for hexo.可以快速使用上手。（我徒弟，多多支持）', '2019-07-28 11:09:03');
INSERT INTO `t_links` VALUES (2, '燕十三', 'https://www.yanshisan.cn', 'https://www.yanshisan.cn/logo.png', '剑气纵横三万里，一剑光寒十九洲。', '2019-07-29 08:16:49');
INSERT INTO `t_links` VALUES (3, 'Mr.LUCK', 'http://www.zhyjohn.cn', 'https://www.zhyjohn.cn/image/head.jpg', '想法总是美好的，现实往往都是残酷的', '2019-07-30 09:59:09');
INSERT INTO `t_links` VALUES (4, '柒情博客', 'http://www.ityw.club/blog/showArticle', 'http://www.ityw.club/favicon.ico', '个人博客', '2019-07-30 10:03:02');
INSERT INTO `t_links` VALUES (5, '洋芋 & 土豆', 'https://love208.vip', 'http://cdn.love208.vip/logo.png', '用来记录我们两人相识、相恋过程中的点点滴滴，留住两个人的美好回忆。上班后这里也变成了有技术文章的笔记站，如果你喜欢我们的情侣博客，记得留言互动！', '2019-08-03 14:49:48');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LogType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `UserName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `RealName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作账户',
  `ModuleName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志模块',
  `Description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志描述',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `IPAddress` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `IPAddressName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP所在地',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-07-29 22:12:18', '182.85.213.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (2, 'Login', 'admin', 'admin', '系统登录', '登录失败，用户名或密码错误。', '2019-07-29 23:33:33', '182.85.213.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (3, 'Login', 'admin', 'admin', '系统登录', '登录失败，用户名或密码错误。', '2019-07-29 23:33:39', '182.85.213.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (4, 'Login', 'admin', 'admin', '系统登录', '登录失败，用户名或密码错误。', '2019-07-29 23:33:48', '182.85.213.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (5, 'Login', 'admin', 'admin', '系统登录', '登录失败，验证码错误，请重新输入', '2019-07-29 23:33:56', '182.85.213.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (6, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-07-29 23:34:01', '182.85.213.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (7, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2019-07-30 00:14:26', '182.85.213.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (8, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-07-30 09:47:02', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (9, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2019-07-30 09:49:17', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (10, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-07-30 09:58:16', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (11, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2019-07-30 10:28:37', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (12, 'Login', 'admin', 'admin', '系统登录', '登录失败，用户名或密码错误。', '2019-07-30 15:13:40', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (13, 'Login', 'admin', '超级管理员', '系统登录', '登录成功', '2019-07-30 15:13:49', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (14, 'Exit', 'admin', '超级管理员', NULL, '安全退出系统', '2019-07-30 15:16:14', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (15, 'Login', 'admin', 'admin', '系统登录', '登录失败，用户名或密码错误。', '2019-07-30 15:16:28', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (16, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-07-30 15:16:37', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (17, 'Exit', 'lsy', 'lsy', NULL, '安全退出系统', '2019-07-30 15:19:44', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (18, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-07-31 11:07:51', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (19, 'Exit', 'lsy', 'lsy', NULL, '安全退出系统', '2019-07-31 11:26:28', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (20, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-07-31 12:00:47', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (21, 'Exit', 'lsy', 'lsy', NULL, '安全退出系统', '2019-07-31 12:08:17', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (22, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-07-31 14:11:51', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (23, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-01 00:46:14', '182.85.212.205', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (24, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-01 09:30:03', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (25, 'Exit', 'lsy', 'lsy', NULL, '安全退出系统', '2019-08-01 09:55:39', '59.53.221.240', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (26, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-01 11:51:31', '59.52.205.69', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (27, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-02 18:29:21', '59.52.205.69', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (28, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-03 14:48:39', '59.52.205.69', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (29, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-03 17:41:05', '59.52.205.69', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (30, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-06 09:10:52', '59.53.220.199', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (31, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-08 16:29:45', '59.52.206.18', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (32, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-10 09:19:34', '59.52.206.18', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (33, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-10 09:34:49', '59.52.206.18', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (34, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-10 09:46:28', '59.52.206.18', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (35, 'Login', 'lsy', 'lsy', '系统登录', '登录失败，验证码错误，请重新输入', '2019-08-10 14:49:33', '59.53.223.243', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (36, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-10 14:49:37', '59.53.223.243', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (37, 'Exit', 'lsy', 'lsy', NULL, '安全退出系统', '2019-08-10 15:15:05', '59.53.223.243', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (38, 'Login', 'lsy', 'lsy', '系统登录', '登录失败，用户名或密码错误。', '2019-08-11 18:52:30', '59.53.224.68', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (39, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-11 18:52:38', '59.53.224.68', '江西省南昌市 电信', b'1');
INSERT INTO `t_log` VALUES (40, 'Login', 'lsy', 'lsy', '系统登录', '登录成功', '2019-08-11 23:22:46', '192.168.1.2', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (41, 'Exit', 'lsy', 'lsy', NULL, '安全退出系统', '2019-08-11 23:24:04', '192.168.1.2', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (42, 'Login', 'admin', 'admin', '系统登录', '登录成功', '2019-08-11 23:24:14', '192.168.1.2', '本地局域网', b'1');
INSERT INTO `t_log` VALUES (43, 'Login', 'admin', 'admin', '系统登录', '登录失败，验证码错误，请重新输入', '2023-02-27 22:42:10', '192.168.1.3', '', b'1');
INSERT INTO `t_log` VALUES (44, 'Login', 'admin', 'admin', '系统登录', '登录失败，Fatal error encountered attempting to read the resultset.', '2023-02-27 22:43:48', '192.168.1.3', '', b'1');
INSERT INTO `t_log` VALUES (45, 'Login', 'admin', 'admin', '系统登录', '登录失败，Fatal error encountered attempting to read the resultset.', '2023-02-27 22:43:55', '192.168.1.3', '', b'1');
INSERT INTO `t_log` VALUES (46, 'Login', 'admin', 'admin', '系统登录', '登录失败，Fatal error encountered attempting to read the resultset.', '2023-02-27 22:44:06', '192.168.1.3', '', b'1');
INSERT INTO `t_log` VALUES (47, 'Login', 'admin', 'admin', '系统登录', '登录失败，Fatal error encountered attempting to read the resultset.', '2023-02-27 22:47:32', '192.168.1.3', '', b'1');
INSERT INTO `t_log` VALUES (48, 'Login', 'admin', 'admin', '系统登录', '登录成功', '2023-02-27 22:49:35', '192.168.1.3', '', b'1');
INSERT INTO `t_log` VALUES (49, 'Login', 'admin', 'admin', '系统登录', '登录成功', '2023-02-27 22:52:17', '192.168.1.3', '', b'1');
INSERT INTO `t_log` VALUES (50, 'Login', 'admin', 'admin', '系统登录', '登录失败，用户名或密码错误。', '2023-02-27 23:15:30', '192.168.1.3', '局域网 ', b'1');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MenuName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `MenuUrl` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `MenuIcon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `OrderNo` tinyint NULL DEFAULT 0 COMMENT '排序号',
  `ParentId` int NULL DEFAULT 0 COMMENT '父菜单',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '编辑者',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '权限管理', NULL, 'icon-setting-permissions', 1, 0, b'1', '2019-02-28 15:03:14', '2019-06-17 17:11:25', 0, 1);
INSERT INTO `t_menu` VALUES (2, '菜单管理', '/permissions/menu', 'icon-caidan', 1, 1, b'1', '2019-02-28 15:03:20', '2019-02-28 15:03:23', 0, 0);
INSERT INTO `t_menu` VALUES (3, '角色管理', '/permissions/role', 'icon-jiaoseguanli', 2, 1, b'1', '2019-02-28 15:03:25', '2019-02-28 15:03:29', 0, 0);
INSERT INTO `t_menu` VALUES (4, '用户管理', '/permissions/user', 'icon-yonghu', 3, 1, b'1', '2019-02-28 15:03:32', '2019-02-28 15:03:35', 0, 0);
INSERT INTO `t_menu` VALUES (5, '操作管理', '/permissions/action', 'icon-shezhi', 4, 1, b'1', '2019-02-28 15:03:39', '2019-02-28 15:03:43', 0, 0);
INSERT INTO `t_menu` VALUES (6, '系统设置', NULL, 'icon-xitong', 2, 0, b'1', '2019-02-28 15:03:46', '2019-02-28 15:03:48', 0, 0);
INSERT INTO `t_menu` VALUES (7, '网站设置', '/sysset/website', 'icon-ditu', 1, 6, b'1', '2019-02-28 15:03:51', '2019-02-28 15:03:53', 0, 0);
INSERT INTO `t_menu` VALUES (8, '基本资料', '/SysSet/info', 'icon-jibenziliao', 2, 6, b'1', '2019-02-28 15:03:56', '2019-02-28 15:03:58', 0, 0);
INSERT INTO `t_menu` VALUES (9, '修改密码', '/SysSet/password', 'icon-xiugaimima', 3, 6, b'1', '2019-02-28 15:04:02', '2019-02-28 15:04:05', 0, 0);
INSERT INTO `t_menu` VALUES (10, '日志管理', '/SysSet/Log', 'icon-xitongrizhi', 4, 6, b'1', '2019-02-28 15:04:07', '2019-02-28 15:04:10', 0, 0);
INSERT INTO `t_menu` VALUES (11, '博客管理', NULL, 'icon-zhuye', 0, 0, b'1', '2019-06-24 14:24:51', '0001-01-01 00:00:00', 1, 0);
INSERT INTO `t_menu` VALUES (12, '文章类型', '/Blog/ArticleType', 'icon-jibenziliao', 7, 11, b'1', '2019-06-24 14:32:31', '2019-06-29 17:41:30', 1, 1);
INSERT INTO `t_menu` VALUES (13, '文章分类', '/Blog/ArticleClass', 'icon-jibenziliao', 6, 11, b'1', '2019-06-24 14:51:05', '2019-06-25 18:06:46', 1, 1);
INSERT INTO `t_menu` VALUES (14, '友情链接', '/Blog/Links', 'icon-jibenziliao', 4, 11, b'1', '2019-06-24 14:55:33', '2019-06-29 18:12:35', 1, 1);
INSERT INTO `t_menu` VALUES (15, '日记管理', '/Blog/Diarys', 'icon-jibenziliao', 3, 11, b'1', '2019-06-24 15:00:40', '2019-06-29 23:19:47', 1, 1);
INSERT INTO `t_menu` VALUES (16, '文章管理', '/Blog/Article', 'icon-jibenziliao', 0, 11, b'1', '2019-06-24 15:02:17', '2019-07-01 11:11:49', 1, 1);
INSERT INTO `t_menu` VALUES (17, '评论管理', '/Blog/Comment', 'icon-jibenziliao', 1, 11, b'1', '2019-06-25 15:45:24', '2019-07-01 11:11:08', 1, 1);
INSERT INTO `t_menu` VALUES (18, '留言管理', '/Blog/Feedback', 'icon-jibenziliao', 2, 11, b'1', '2019-06-25 15:45:49', '2019-07-01 11:10:29', 1, 1);
INSERT INTO `t_menu` VALUES (19, '用户管理', '/Blog/QQUser', 'icon-jibenziliao', 5, 11, b'1', '2019-06-25 15:46:43', '2019-06-30 19:52:18', 1, 1);

-- ----------------------------
-- Table structure for t_menu_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_action`;
CREATE TABLE `t_menu_action`  (
  `MenuId` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `ActionId` int NULL DEFAULT NULL COMMENT '操作ID',
  UNIQUE INDEX `idx_MenuId_ActionId`(`MenuId` ASC, `ActionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单操作表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu_action
-- ----------------------------
INSERT INTO `t_menu_action` VALUES (2, 1);
INSERT INTO `t_menu_action` VALUES (2, 2);
INSERT INTO `t_menu_action` VALUES (2, 4);
INSERT INTO `t_menu_action` VALUES (2, 8);
INSERT INTO `t_menu_action` VALUES (3, 1);
INSERT INTO `t_menu_action` VALUES (3, 2);
INSERT INTO `t_menu_action` VALUES (3, 3);
INSERT INTO `t_menu_action` VALUES (3, 4);
INSERT INTO `t_menu_action` VALUES (3, 6);
INSERT INTO `t_menu_action` VALUES (4, 1);
INSERT INTO `t_menu_action` VALUES (4, 2);
INSERT INTO `t_menu_action` VALUES (4, 3);
INSERT INTO `t_menu_action` VALUES (4, 4);
INSERT INTO `t_menu_action` VALUES (4, 5);
INSERT INTO `t_menu_action` VALUES (5, 1);
INSERT INTO `t_menu_action` VALUES (5, 2);
INSERT INTO `t_menu_action` VALUES (5, 3);
INSERT INTO `t_menu_action` VALUES (5, 4);
INSERT INTO `t_menu_action` VALUES (10, 4);
INSERT INTO `t_menu_action` VALUES (10, 7);
INSERT INTO `t_menu_action` VALUES (12, 1);
INSERT INTO `t_menu_action` VALUES (12, 2);
INSERT INTO `t_menu_action` VALUES (12, 3);
INSERT INTO `t_menu_action` VALUES (12, 4);
INSERT INTO `t_menu_action` VALUES (13, 1);
INSERT INTO `t_menu_action` VALUES (13, 2);
INSERT INTO `t_menu_action` VALUES (13, 3);
INSERT INTO `t_menu_action` VALUES (13, 4);
INSERT INTO `t_menu_action` VALUES (14, 1);
INSERT INTO `t_menu_action` VALUES (14, 2);
INSERT INTO `t_menu_action` VALUES (14, 3);
INSERT INTO `t_menu_action` VALUES (14, 4);
INSERT INTO `t_menu_action` VALUES (15, 1);
INSERT INTO `t_menu_action` VALUES (15, 2);
INSERT INTO `t_menu_action` VALUES (15, 3);
INSERT INTO `t_menu_action` VALUES (15, 4);
INSERT INTO `t_menu_action` VALUES (16, 1);
INSERT INTO `t_menu_action` VALUES (16, 2);
INSERT INTO `t_menu_action` VALUES (16, 3);
INSERT INTO `t_menu_action` VALUES (16, 4);
INSERT INTO `t_menu_action` VALUES (17, 3);
INSERT INTO `t_menu_action` VALUES (17, 4);
INSERT INTO `t_menu_action` VALUES (18, 3);
INSERT INTO `t_menu_action` VALUES (18, 4);
INSERT INTO `t_menu_action` VALUES (19, 2);
INSERT INTO `t_menu_action` VALUES (19, 3);
INSERT INTO `t_menu_action` VALUES (19, 4);

-- ----------------------------
-- Table structure for t_menu_role_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_role_action`;
CREATE TABLE `t_menu_role_action`  (
  `MenuId` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `RoleId` int NULL DEFAULT NULL COMMENT '角色ID',
  `ActionId` int NULL DEFAULT NULL COMMENT '操作ID',
  UNIQUE INDEX `idx_RoleId_MenuId`(`MenuId` ASC, `RoleId` ASC, `ActionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu_role_action
-- ----------------------------
INSERT INTO `t_menu_role_action` VALUES (1, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (2, 1, 8);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (3, 1, 6);
INSERT INTO `t_menu_role_action` VALUES (4, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (4, 1, 5);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (5, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (6, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (7, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (8, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (9, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (10, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (10, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (10, 1, 7);
INSERT INTO `t_menu_role_action` VALUES (11, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (11, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (12, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (12, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (13, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (13, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (13, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (13, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (13, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (13, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (14, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (14, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (14, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (14, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (14, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (14, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (15, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (15, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (15, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (15, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (15, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (15, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (16, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (16, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (16, 1, 1);
INSERT INTO `t_menu_role_action` VALUES (16, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (16, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (16, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (17, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (17, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (17, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (17, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (18, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (18, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (18, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (18, 1, 4);
INSERT INTO `t_menu_role_action` VALUES (19, 0, 0);
INSERT INTO `t_menu_role_action` VALUES (19, 1, 0);
INSERT INTO `t_menu_role_action` VALUES (19, 1, 2);
INSERT INTO `t_menu_role_action` VALUES (19, 1, 3);
INSERT INTO `t_menu_role_action` VALUES (19, 1, 4);

-- ----------------------------
-- Table structure for t_qq_user
-- ----------------------------
DROP TABLE IF EXISTS `t_qq_user`;
CREATE TABLE `t_qq_user`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OpenId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'OpenId',
  `NickName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `Gender` tinyint NULL DEFAULT NULL COMMENT '性别（0：女，1：男）',
  `HeadShot` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `Email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `LastLogin` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_qq_user
-- ----------------------------
INSERT INTO `t_qq_user` VALUES (1, '5DB22905E4DA3582E221CE85737059C1', '蚯蚓', 1, 'http://thirdqq.qlogo.cn/g?b=oidb&k=q8BmhyWUTZEpo7Us6QTqhA&s=140&t=1557712926', NULL, b'1', '2019-08-11 18:54:03', '2019-07-29 21:49:52');
INSERT INTO `t_qq_user` VALUES (2, 'FBAE41D869FA327AB33AA16D9D9C5E97', '小蚯蚓', 1, 'https://thirdqq.qlogo.cn/g?b=oidb&k=g4LbktibR4Q0eC4RIjiagmvw&s=140&t=1552461721', '', b'1', '2019-07-29 22:34:54', '2019-07-29 21:50:35');
INSERT INTO `t_qq_user` VALUES (3, 'D4092B8AFE758DB49252E8B7AEFDC2AC', '煜昕网络工作室', 1, 'https://thirdqq.qlogo.cn/g?b=oidb&k=diaDg89owmSJCjiaxqSJL54Q&s=140&t=1556350484', '', b'1', '2019-07-29 21:51:21', '2019-07-29 21:51:21');
INSERT INTO `t_qq_user` VALUES (4, '7AE01F1862D52C452B296158F17AF25E', '小小小蚯蚓', 1, 'https://thirdqq.qlogo.cn/g?b=oidb&k=TI6MEZXl7gGtkTribiah3icvA&s=140&t=1552461754', '', b'1', '2019-07-29 21:55:44', '2019-07-29 21:55:44');
INSERT INTO `t_qq_user` VALUES (5, '2D8289F875ECA7FF64C388A336E7D2DC', '--', 1, 'https://thirdqq.qlogo.cn/g?b=oidb&k=VFjtC0gWn9YLqQaoBOfWEw&s=100&t=1557278201', '', b'1', '2019-07-30 10:13:33', '2019-07-30 10:13:33');
INSERT INTO `t_qq_user` VALUES (6, '3AC542CEB2BDB3261F98691E1F851CC8', '莫ღ汐白丶', 1, 'https://thirdqq.qlogo.cn/g?b=oidb&k=4dfr86UrnVsAbaYxZ4IYOA&s=140&t=1556771291', '', b'1', '2019-07-30 10:14:01', '2019-07-30 10:14:01');
INSERT INTO `t_qq_user` VALUES (7, 'E3133C803C5DACA8AB13F000769E5787', '試毅-思伟✅已认证', 1, 'https://thirdqq.qlogo.cn/g?b=oidb&k=dtcicI20RLTIMFQlqJ3txuA&s=140&t=1557096682', '', b'1', '2019-07-31 11:44:20', '2019-07-31 11:44:20');
INSERT INTO `t_qq_user` VALUES (8, '9587B49F81E6C2141B1128288F13EA1E', '洋芋', 1, 'http://thirdqq.qlogo.cn/g?b=oidb&k=9yqHfWPhCjxice8ZtqETsUg&s=140&t=1556092932', '', b'1', '2019-08-03 10:57:05', '2019-08-03 10:57:05');
INSERT INTO `t_qq_user` VALUES (9, 'ED7CE034D044B3759ED7D78EF15F837F', '沧海大叔', 1, 'http://thirdqq.qlogo.cn/g?b=oidb&k=rVvtgxNp4qTTmR90kPI5hA&s=140&t=1555941697', '', b'1', '2019-08-09 17:25:44', '2019-08-09 17:25:44');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `RoleCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `RoleName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `Remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态(1:有效，0：无效）',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'SysAdmin', '超级管理员', NULL, b'1', '2019-02-28 15:34:59', '2019-02-28 15:35:03', 0, 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UserName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名（登录）',
  `RealName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `PassWord` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `RoleId` int NULL DEFAULT NULL COMMENT '角色ID',
  `Status` bit(1) NULL DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int NULL DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int NULL DEFAULT NULL COMMENT '修改者',
  `Gender` tinyint NULL DEFAULT NULL COMMENT '性别（0：女，1：男）',
  `Phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `Email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `Remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `HeadShot` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, b'1', '2019-02-28 16:18:52', '2019-08-11 23:23:57', 0, 1, 1, '11111111111', '178899573@qq.com', '最高权限', '/Upload/img/502.jpg');

SET FOREIGN_KEY_CHECKS = 1;
