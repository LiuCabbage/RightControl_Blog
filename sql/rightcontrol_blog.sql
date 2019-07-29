/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : rightcontrol_blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-07-29 21:56:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_action
-- ----------------------------
DROP TABLE IF EXISTS `t_action`;
CREATE TABLE `t_action` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ActionCode` varchar(20) DEFAULT NULL COMMENT '操作编码',
  `ActionName` varchar(40) DEFAULT NULL COMMENT '操作名称',
  `Position` int(11) DEFAULT NULL COMMENT '显示位置（1：表单内，2：表单右上）',
  `Icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `Method` varchar(20) DEFAULT NULL COMMENT '方法名称',
  `Remark` varchar(50) DEFAULT NULL COMMENT '说明',
  `OrderBy` int(4) DEFAULT NULL COMMENT '排序号',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '更新者',
  `ClassName` varchar(30) DEFAULT NULL COMMENT '样式名称',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='操作表';

-- ----------------------------
-- Records of t_action
-- ----------------------------
INSERT INTO `t_action` VALUES ('1', 'Add', '添加', '1', 'icon-add', 'Add', null, '0', '', '2019-02-28 14:44:33', '2019-06-15 23:32:07', '0', '1', null);
INSERT INTO `t_action` VALUES ('2', 'edit', '编辑', '0', 'icon-bianji', 'edit', null, '0', '', '2019-02-28 14:44:36', '2019-02-28 14:45:21', '0', '0', null);
INSERT INTO `t_action` VALUES ('3', 'detail', '查看', '0', 'icon-chakan', 'detail', null, '0', '', '2019-02-28 14:44:39', '2019-02-28 14:45:24', '0', '0', 'layui-btn-normal');
INSERT INTO `t_action` VALUES ('4', 'del', '删除', '0', 'icon-guanbi', 'del', null, '0', '', '2019-02-28 14:44:42', '2019-02-28 14:45:27', '0', '0', 'layui-btn-danger');
INSERT INTO `t_action` VALUES ('5', 'reset', '重置密码', '0', 'icon-reset', 'reset', null, '0', '', '2019-02-28 14:44:45', '2019-06-15 23:34:55', '0', '1', 'layui-btn-warm');
INSERT INTO `t_action` VALUES ('6', 'assign', '分配权限', '0', 'icon-jiaoseguanli', 'assign', null, '0', '', '2019-02-28 14:44:48', '2019-02-28 14:45:34', '0', '0', null);
INSERT INTO `t_action` VALUES ('7', 'BatchDel', '批量删除', '1', 'icon-shanchu', 'BatchDel', null, '0', '', '2019-06-15 23:34:15', '0001-01-01 00:00:00', '1', '0', null);
INSERT INTO `t_action` VALUES ('8', 'menu_action', '菜单权限', '0', 'icon-setting-permissions', 'menu_action', null, '0', '', '2019-06-17 17:00:29', '0001-01-01 00:00:00', '1', '0', null);

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章标题',
  `ZhaiYao` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '摘要',
  `ImgUrl` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章封面',
  `Content` text CHARACTER SET utf8 COMMENT '内容',
  `TypeId` int(11) DEFAULT NULL COMMENT '类型ID',
  `ClassId` int(11) DEFAULT NULL COMMENT '分类ID',
  `Ding` int(11) DEFAULT NULL COMMENT '是否置顶',
  `ReadNum` int(11) DEFAULT NULL COMMENT '阅读数',
  `CommentNum` int(11) DEFAULT NULL COMMENT '评论数',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('1', 'ASP.NET MVC 通用角色权限管理系统', 'RightControl 介绍 .NET 通用后台角色权限管理系统，已完成。项目地址：http://rightcontrol.baocaige.top/Admin/Login 码云地址：https://gitee.com/Liu_Cabbage/RightControl 软件架构 通用三层架构，面向接口编程。', '/Upload/img/1260852-20190620144549201-1384742553.jpg', '<h1 style=\"margin-top: 10px; margin-bottom: 10px; line-height: 1.5; font-size: 28px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">RightControl</h1><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"介绍\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E4%BB%8B%E7%BB%8D\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>介绍</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">.NET 通用后台角色权限管理系统，已完成。<br>项目地址：<a href=\"http://rightcontrol.baocaige.top/Admin/Login\" target=\"_blank\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\">http://rightcontrol.baocaige.top/Admin/Login</a><br>码云地址：<a href=\"https://gitee.com/Liu_Cabbage/RightControl\" target=\"_blank\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\">https://gitee.com/Liu_Cabbage/RightControl</a></p><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"软件架构\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E8%BD%AF%E4%BB%B6%E6%9E%B6%E6%9E%84\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>软件架构</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">通用三层架构，面向接口编程。</p><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"技术选型\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E6%8A%80%E6%9C%AF%E9%80%89%E5%9E%8B\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>技术选型</h4><ol class=\"task-list\" style=\"padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><li style=\"list-style: decimal;\">MVC5</li><li style=\"list-style: decimal;\">Mysql</li><li style=\"list-style: decimal;\">Dapper</li><li style=\"list-style: decimal;\">Autofac</li><li style=\"list-style: decimal;\">Layui</li><li style=\"list-style: decimal;\">阿里巴巴矢量库</li></ol><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"使用说明\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>使用说明</h4><ol class=\"task-list\" style=\"padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><li style=\"list-style: decimal;\">先创建数据库，然后执行sql目录下面的rightcontrol.sql即可。</li><li style=\"list-style: decimal;\">账号：admin</li><li style=\"list-style: decimal;\">密码：123456</li></ol><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"项目由来\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E9%A1%B9%E7%9B%AE%E7%94%B1%E6%9D%A5\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>项目由来</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\">邹琼俊 .net项目驱动学习&nbsp;<a href=\"https://edu.csdn.net/course/detail/8137\" target=\"_blank\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\">https://edu.csdn.net/course/detail/8137&nbsp;</a>由于是付费课程，我这里不贴出博主的项目git地址<br>第一次自己动手做一个通用权限管理后台，看视频一步步完成。 各位看官大佬觉得还可以的话，麻烦点个Star。</p><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"个人新增及修改的bug\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E4%B8%AA%E4%BA%BA%E6%96%B0%E5%A2%9E%E5%8F%8A%E4%BF%AE%E6%94%B9%E7%9A%84bug\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>个人新增及修改的Bug</h4><ol class=\"task-list\" style=\"padding-left: 50px; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><li style=\"list-style: decimal;\">基本资料性别更改后后台数据不更新</li><li style=\"list-style: decimal;\">菜单管理没有删除功能</li><li style=\"list-style: decimal;\">菜单管理没有操作按钮设置功能</li><li style=\"list-style: decimal;\">没有批量删除</li><li style=\"list-style: decimal;\">角色管理分配权限里不显示新增的菜单</li><li style=\"list-style: decimal;\">删除菜单同时清除菜单权限，菜单角色权限</li><li style=\"list-style: decimal;\">删除按钮同时清除菜单权限，菜单角色权限</li><li style=\"list-style: decimal;\">删除角色同时清除菜单角色权限</li></ol><h4 style=\"margin-top: 10px; margin-bottom: 10px; font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><a id=\"项目截图\" class=\"anchor\" href=\"https://gitee.com/Liu_Cabbage/RightControl#%E9%A1%B9%E7%9B%AE%E6%88%AA%E5%9B%BE\" style=\"color: rgb(0, 0, 0); border-bottom: 1px dotted rgb(51, 51, 51);\"></a>项目截图</h4><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><img src=\"/Upload/img/1260852-20190620144549201-1384742553_1.jpg\" alt=\"undefined\"><br></p><p style=\"margin-top: 10px; margin-right: auto; margin-left: auto; color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; background-color: rgb(255, 255, 255);\"><img src=\"/Upload/img/1260852-20190620144600057-1249279035.png\" alt=\"undefined\"><br></p>', '1', '1', '1', '6', '0', '', '2019-07-29 17:01:39', '2019-07-29 17:04:18');
INSERT INTO `t_article` VALUES ('2', '码云 VS首次提交代码报错：failed to push some refs to \'https://gitee.com/Liu_Cabbage/ASP.NET-MVC-QQ-Connect.git\'', '打开命令提示符： 执行合并命令： git pull --rebase origin master 最后总结： 1、多为第一次提交代码，本地和码云仓库不一致，README.md文件不在本地代码目录中 2、可以通过如下命令进行代码合并【注：pull=fetch+merge] git pull --rebase origin master  3、执行上面代码后可以看到本地代码库中多了README.md文件  4、此时再执行语句 git push 或者用VS的推送', '/Upload/img/u=2715563049,865769039&fm=26&gp=0.jpg', '<p><img src=\"/Upload/img/1.jpg\" alt=\"undefined\"><br></p><p>打开命令提示符：</p><p><img src=\"/Upload/img/2.jpg\" alt=\"undefined\"><br></p><p>执行合并命令：</p><p>git pull --rebase origin master</p><p>最后总结：</p><p>1、多为第一次提交代码，本地和码云仓库不一致，README.md文件不在本地代码目录中</p><p>2、可以通过如下命令进行代码合并【注：pull=fetch+merge]</p><p>git pull --rebase origin master</p><p>3、执行上面代码后可以看到本地代码库中多了README.md文件</p><p>4、此时再执行语句&nbsp;git push 或者用VS的推送</p>', '1', '7', '0', '0', '0', '', '2019-07-29 17:13:45', '2019-07-29 17:14:04');
INSERT INTO `t_article` VALUES ('3', 'Mysql 随机获得表的几条记录', '在做博客文章详情的时候，有一个拓展阅读的功能： 想法一：根据当前文章Id，写死两条链接，Id+1，Id-1，但是文章Id可能被删除，Id不连续，不可取。× 想法二：获得当前文章记录的前一条和后一条记录，好像有点难受，要查询两次。查询两次，可行。√ 想法三：直接获取文章表两条随机的记录。一次查询，舒服。√', '/Upload/img/1260852-20190717163824398-638143940.png', '<p>在做博客文章详情的时候，有一个拓展阅读的功能：</p><p><img src=\"/Upload/img/1260852-20190717163824398-638143940_1.png\" alt=\"undefined\"><br></p><p>想法一：根据当前文章Id，写死两条链接，Id+1，Id-1，但是文章Id可能被删除，Id不连续，不可取。×</p><p>想法二：获得当前文章记录的前一条和后一条记录，好像有点难受，要查询两次。查询两次，可行。√</p><p>想法三：直接获取文章表两条随机的记录。一次查询，舒服。√</p><div class=\"cnblogs_code\"><pre>SELECT *<span>\r\nFROM t_article\r\nWHERE Id </span>&gt;= ((SELECT MAX(Id) FROM t_article)-(SELECT MIN(Id) FROM t_article)) * RAND() +<span> (SELECT MIN(Id) FROM t_article)\r\nLIMIT </span><span>2</span></pre></div><p>ArticleService对应的方法</p><div class=\"cnblogs_code\"><pre><span>        ///</span> <span>&lt;summary&gt;</span>\r\n        <span>///</span><span> 延伸阅读-获取两条随机文章\r\n        </span><span>///</span> <span>&lt;/summary&gt;</span>\r\n        <span>///</span> <span>&lt;param name=\"num\"&gt;&lt;/param&gt;</span>\r\n        <span>///</span> <span>&lt;returns&gt;&lt;/returns&gt;</span>\r\n        <span>public</span> IEnumerable&lt;ArticleModel&gt; GetRandomArticleList(<span>int</span><span> num)\r\n        {\r\n            </span><span>string</span> _where = <span>\"</span><span>WHERE Id &gt;= ((SELECT MAX(Id) FROM t_article)-(SELECT MIN(Id) FROM t_article)) * RAND() + (SELECT MIN(Id) FROM t_article) LIMIT </span><span>\"</span>+<span>num;\r\n            </span><span>return</span> repository.GetByWhere(_where,<span>null</span>,<span>null</span>,<span>null</span><span>); ;\r\n        }</span></pre></div><p>&nbsp;</p>', '1', '3', '0', '1', '0', '', '2019-07-29 17:16:24', '2019-07-29 17:16:32');
INSERT INTO `t_article` VALUES ('4', 'ASP.NET MVC 使用分部视图制作公共头部，尾部，并通过ViewBag传值', ' 一：新建分部视图 二：布局页_Layout.cshtml上调用 不灵活，不能传递数据，引用静态公共部分 通过控制器方法引入分部视图，控制器里可以向分部视图传递数据，引用动态公共部分 三：代码展示： 布局页_Layout.cshtml，因为@RenderSection只能放在布局页，所以@Html.Action(\"Foot\", \"Home\")下面的一坨就没放在_Foot里面，会报错。', '/Upload/img/1260852-20190712145504706-1458531772.jpg', '<p>一：新建分部视图</p><p><img src=\"https://img2018.cnblogs.com/blog/1260852/201907/1260852-20190712142228947-51827939.jpg\" alt=\"\"></p><p>二：布局页_Layout.cshtml上调用</p><p>不灵活，不能传递数据，引用静态公共部分</p><div class=\"cnblogs_code\"><pre>@Html.Partial(<span>\"</span><span>_Head</span><span>\"</span><span>)\r\n\r\n@Html.Partial(</span><span>\"</span><span>~/Views/Shared/_Head.cshtml</span><span>\"</span>)</pre></div><p>通过控制器方法引入分部视图，控制器里可以向分部视图传递数据，引用动态公共部分</p><div class=\"cnblogs_code\"><pre>@Html.Action(<span>\"</span><span>Head</span><span>\"</span>, <span>\"</span><span>Home</span><span>\"</span>)</pre></div><p>三：代码展示：</p><p>布局页_Layout.cshtml，因为@RenderSection只能放在布局页，所以@Html.Action(\"Foot\", \"Home\")下面的一坨就没放在_Foot里面，会报错。</p><div class=\"cnblogs_code\"><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div><pre>&lt;!DOCTYPE html&gt;\r\n&lt;html&gt;\r\n&lt;head&gt;\r\n    &lt;meta charset=<span>\"</span><span>utf-8</span><span>\"</span> /&gt;\r\n    &lt;meta name=<span>\"</span><span>viewport</span><span>\"</span> content=<span>\"</span><span>width=device-width, initial-scale=1.0</span><span>\"</span>&gt;\r\n    &lt;title&gt;@ViewBag.Title&lt;/title&gt;<span>\r\n    @Html.Action(</span><span>\"</span><span>Meta</span><span>\"</span>, <span>\"</span><span>Home</span><span>\"</span><span>)\r\n    </span>&lt;link rel=<span>\"</span><span>stylesheet</span><span>\"</span> href=<span>\"</span><span>~/Content/font-awesome/css/font-awesome.min.css</span><span>\"</span>&gt;\r\n    &lt;link rel=<span>\"</span><span>stylesheet</span><span>\"</span> href=<span>\"</span><span>~/Content/layui/css/layui.css</span><span>\"</span> /&gt;\r\n    &lt;link rel=<span>\"</span><span>stylesheet</span><span>\"</span> href=<span>\"</span><span>~/Content/css/master.css</span><span>\"</span> /&gt;\r\n    &lt;link rel=<span>\"</span><span>stylesheet</span><span>\"</span> href=<span>\"</span><span>~/Content/css/gloable.css</span><span>\"</span> /&gt;\r\n    &lt;link rel=<span>\"</span><span>stylesheet</span><span>\"</span> href=<span>\"</span><span>~/Content/css/nprogress.css</span><span>\"</span> /&gt;<span>\r\n    @RenderSection(</span><span>\"</span><span>css</span><span>\"</span>, required: <span>false</span><span>)\r\n</span>&lt;/head&gt;\r\n&lt;body&gt;<span>\r\n    @Html.Action(</span><span>\"</span><span>Head</span><span>\"</span>, <span>\"</span><span>Home</span><span>\"</span><span>)\r\n    @RenderBody()\r\n    @Html.Action(</span><span>\"</span><span>Foot</span><span>\"</span>, <span>\"</span><span>Home</span><span>\"</span><span>)\r\n    </span>&lt;script src=<span>\"</span><span>~/Content/layui/layui.js</span><span>\"</span>&gt;&lt;/script&gt;\r\n    &lt;script src=<span>\"</span><span>~/Content/js/yss/gloable.js</span><span>\"</span>&gt;&lt;/script&gt;\r\n    &lt;script src=<span>\"</span><span>~/Content/js/plugins/nprogress.js</span><span>\"</span>&gt;&lt;/script&gt;\r\n    &lt;script&gt;NProgress.start();&lt;/script&gt;<span>\r\n    @RenderSection(</span><span>\"</span><span>js</span><span>\"</span>, required: <span>false</span><span>)\r\n    </span>&lt;script&gt;<span>\r\n        window.onload </span>=<span> function () {\r\n            NProgress.done();\r\n        };\r\n    </span>&lt;/script&gt;\r\n    &lt;script&gt;<span>\r\n        (function () {\r\n            </span><span>var</span> bp = document.createElement(<span>\'</span><span>script</span><span>\'</span><span>);\r\n            </span><span>var</span> curProtocol = window.location.protocol.split(<span>\'</span><span>:</span><span>\'</span>)[<span>0</span><span>];\r\n            </span><span>if</span> (curProtocol === <span>\'</span><span>https</span><span>\'</span><span>) {\r\n                bp.src </span>= <span>\'</span><span>https://zz.bdstatic.com/linksubmit/push.js</span><span>\'</span><span>;\r\n            }\r\n            </span><span>else</span><span> {\r\n                bp.src </span>= <span>\'</span><span>http://push.zhanzhang.baidu.com/push.js</span><span>\'</span><span>;\r\n            }\r\n            </span><span>var</span> s = document.getElementsByTagName(<span>\"</span><span>script</span><span>\"</span>)[<span>0</span><span>];\r\n            s.parentNode.insertBefore(bp, s);\r\n        })();\r\n    </span>&lt;/script&gt;\r\n&lt;/body&gt;\r\n&lt;/html&gt;</pre><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div></div><p>我把控制器方法写在了首页，因为博客首页头部尾部不公共的，其实写哪里都一样，返回分部视图就ok。</p><p>首页控制器：/Home</p><p>返回分部视图千万不要用 return View(model.GetWebSiteInfo());&nbsp; 会默认找~Views/Home/ 下面的视图，严重错误，IIS Express直接崩掉自动退出</p><div class=\"cnblogs_code\"><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div><pre><span>using</span><span> RightControl.IService;\r\n</span><span>using</span><span> RightControl.WebApp.Models;\r\n</span><span>using</span><span> System.Web.Mvc;\r\n\r\n</span><span>namespace</span><span> RightControl.WebApp.Controllers\r\n{\r\n    </span><span>public</span> <span>class</span><span> HomeController : Controller\r\n    {\r\n        </span><span>public</span> IArticleService service { <span>get</span>; <span>set</span><span>; }\r\n        WebSiteInfo model </span>= <span>new</span><span> WebSiteInfo();\r\n        </span><span>//</span><span> GET: Home</span>\r\n        <span>public</span><span> ActionResult Index()\r\n        {\r\n            ViewBag.HotArtileList </span>= service.GetHotArticle(<span>3</span><span>);\r\n            </span><span>return</span><span> View(model.GetWebSiteInfo());\r\n        }\r\n        </span><span>public</span><span> ActionResult Meta()\r\n        {\r\n            ViewBag.Site </span>=<span> model.GetWebSiteInfo();\r\n            </span><span>return</span> PartialView(<span>\"</span><span>~/Views/Shared/_Meta.cshtml</span><span>\"</span><span>);\r\n        }\r\n        </span><span>public</span><span> ActionResult Head()\r\n        {\r\n            ViewBag.Site </span>=<span> model.GetWebSiteInfo();\r\n            </span><span>return</span> PartialView(<span>\"</span><span>~/Views/Shared/_Head.cshtml</span><span>\"</span><span>);\r\n        }\r\n        </span><span>public</span><span> ActionResult Foot()\r\n        {\r\n            ViewBag.Site </span>=<span> model.GetWebSiteInfo();\r\n            </span><span>return</span> PartialView(<span>\"</span><span>/Views/Shared/_Foot.cshtml</span><span>\"</span><span>);\r\n        }\r\n    }\r\n}</span></pre><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div></div><p>_Meta.cshtml</p><div class=\"cnblogs_code\"><pre>&lt;meta name=<span>\"</span><span>keywords</span><span>\"</span> content=<span>\"</span><span>@ViewBag.Site.MetaKey</span><span>\"</span> /&gt;\r\n&lt;meta name=<span>\"</span><span>description</span><span>\"</span> content=<span>\"</span><span>@ViewBag.Site.MetaDescribe</span><span>\"</span>&gt;</pre></div><p>_Head.cshtml</p><div class=\"cnblogs_code\"><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div><pre>&lt;div <span>class</span>=<span>\"</span><span>header</span><span>\"</span>&gt;\r\n&lt;/div&gt;\r\n&lt;header <span>class</span>=<span>\"</span><span>gird-header</span><span>\"</span>&gt;\r\n    &lt;div <span>class</span>=<span>\"</span><span>header-fixed</span><span>\"</span>&gt;\r\n        &lt;div <span>class</span>=<span>\"</span><span>header-inner</span><span>\"</span>&gt;\r\n            &lt;a href=<span>\"</span><span>javascript:void(0)</span><span>\"</span> <span>class</span>=<span>\"</span><span>header-logo</span><span>\"</span> id=<span>\"</span><span>logo</span><span>\"</span>&gt;@ViewBag.Site.SiteName&lt;/a&gt;\r\n            &lt;nav <span>class</span>=<span>\"</span><span>nav</span><span>\"</span> id=<span>\"</span><span>nav</span><span>\"</span>&gt;\r\n                &lt;ul&gt;\r\n                    &lt;li&gt;&lt;a href=<span>\"</span><span>/Home</span><span>\"</span>&gt;首页&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=<span>\"</span><span>/Article</span><span>\"</span>&gt;博客&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=<span>\"</span><span>/Feedback</span><span>\"</span>&gt;留言&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=<span>\"</span><span>/Diarys</span><span>\"</span>&gt;日记&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=<span>\"</span><span>/Links</span><span>\"</span>&gt;友链&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=<span>\"</span><span>/About</span><span>\"</span>&gt;关于&lt;/a&gt;&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/nav&gt;\r\n            &lt;a href=<span>\"</span><span>/User/QQLogin</span><span>\"</span> <span>class</span>=<span>\"</span><span>blog-user</span><span>\"</span>&gt;\r\n                &lt;i <span>class</span>=<span>\"</span><span>fa fa-qq</span><span>\"</span>&gt;&lt;/i&gt;\r\n            &lt;/a&gt;\r\n            &lt;a <span>class</span>=<span>\"</span><span>phone-menu</span><span>\"</span>&gt;\r\n                &lt;i&gt;&lt;/i&gt;\r\n                &lt;i&gt;&lt;/i&gt;\r\n                &lt;i&gt;&lt;/i&gt;\r\n            &lt;/a&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/header&gt;</pre><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div></div><p>_Foot.cshtml</p><div class=\"cnblogs_code\"><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div><pre>&lt;footer <span>class</span>=<span>\"</span><span>grid-footer</span><span>\"</span>&gt;\r\n    &lt;div <span>class</span>=<span>\"</span><span>footer-fixed</span><span>\"</span>&gt;\r\n        &lt;div <span>class</span>=<span>\"</span><span>copyright</span><span>\"</span>&gt;\r\n            &lt;div <span>class</span>=<span>\"</span><span>info</span><span>\"</span>&gt;\r\n                &lt;div <span>class</span>=<span>\"</span><span>contact</span><span>\"</span>&gt;\r\n                    &lt;a href=<span>\"</span><span>@ViewBag.Site.Gitee</span><span>\"</span> <span>class</span>=<span>\"</span><span>github</span><span>\"</span> target=<span>\"</span><span>_blank</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-github</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                    &lt;a href=<span>\"</span><span>https://wpa.qq.com/msgrd?v=3&amp;uin=@ViewBag.Site.QQ&amp;site=qq&amp;menu=yes</span><span>\"</span> <span>class</span>=<span>\"</span><span>qq</span><span>\"</span> target=<span>\"</span><span>_blank</span><span>\"</span> title=<span>\"</span><span>@ViewBag.Site.QQ</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-qq</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                    &lt;a href=<span>\"</span><span>https://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=@ViewBag.Site.Mail</span><span>\"</span> <span>class</span>=<span>\"</span><span>email</span><span>\"</span> target=<span>\"</span><span>_blank</span><span>\"</span> title=<span>\"</span><span>@ViewBag.Site.Mail</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-envelope</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                    &lt;a href=<span>\"</span><span>javascript:void(0)</span><span>\"</span> <span>class</span>=<span>\"</span><span>weixin</span><span>\"</span>&gt;&lt;i <span>class</span>=<span>\"</span><span>fa fa-weixin</span><span>\"</span>&gt;&lt;/i&gt;&lt;/a&gt;\r\n                &lt;/div&gt;\r\n                &lt;p <span>class</span>=<span>\"</span><span>mt05</span><span>\"</span>&gt;<span>\r\n                    @ViewBag.Site.CopyRight\r\n                </span>&lt;/p&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/footer&gt;</pre><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div></div><p>最终效果：</p><p><img src=\"/Upload/img/1260852-20190712145453950-818976929.jpg\" alt=\"undefined\"><br></p><p><img src=\"/Upload/img/1260852-20190712145504706-1458531772_1.jpg\" alt=\"undefined\"><br></p><p>头部尾部提取公共部分还有一种做法，不用分部视图，直接用布局页：</p><p>新建BaseController控制器，里面获取网站头部尾部需要的WebSiteInfo信息，除开博客首页每个页面的控制器都继承它，布局页直接使用BaseController的WebSiteInfo信息，通过ViewBag的方式给布局页头尾赋值。</p><p>最后总结，个人还是喜欢用分部视图来抽出头部尾部的，继承BaseController的方法虽然不用新建部分视图，但是也要每个有公共头尾的页面控制器去继承它，想想也有点膈应。</p>', '1', '1', '0', '0', '0', '', '2019-07-29 17:20:34', '2019-07-29 17:21:27');
INSERT INTO `t_article` VALUES ('5', 'Dapper+Mysql 使用LIKE模糊查询写法踩坑', 'LIKE \'%@Title%\' 会解析成\'%\'@Title\'%\' 这里用拼接也是不行的\'%\'+@Title+\'%\' 只能用MySQL函数方法拼接', '/Upload/img/temo123.jpg', '<p><span>LIKE \'%@Title%\' 会解析成\'%\'@Title\'%\' 这里用拼接也是不行的\'%\'+@Title+\'%\' 只能用MySQL函数方法拼接</span></p><div><div class=\"cnblogs_Highlighter sh-gutter\"><div id=\"highlighter_940382\" class=\"syntaxhighlighter  csharp\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"layui-table\"><tbody><tr><td class=\"gutter\"><div class=\"line number1 index0 alt2\" style=\"text-align: right;\">1</div><div class=\"line number2 index1 alt1\" style=\"text-align: right;\">2</div><div class=\"line number3 index2 alt2\" style=\"text-align: right;\">3</div><div class=\"line number4 index3 alt1\" style=\"text-align: right;\">4</div><div class=\"line number5 index4 alt2\" style=\"text-align: right;\">5</div><div class=\"line number6 index5 alt1\" style=\"text-align: right;\">6</div><div class=\"line number7 index6 alt2\" style=\"text-align: right;\">7</div><div class=\"line number8 index7 alt1\" style=\"text-align: right;\">8</div><div class=\"line number9 index8 alt2\" style=\"text-align: right;\">9</div><div class=\"line number10 index9 alt1\" style=\"text-align: right;\">10</div><div class=\"line number11 index10 alt2\" style=\"text-align: right;\">11</div><div class=\"line number12 index11 alt1\" style=\"text-align: right;\">12</div><div class=\"line number13 index12 alt2\" style=\"text-align: right;\">13</div><div class=\"line number14 index13 alt1\" style=\"text-align: right;\">14</div></td><td class=\"code\"><div class=\"container\"><div class=\"line number1 index0 alt2\"><code class=\"csharp keyword\">public</code>&nbsp;<code class=\"csharp plain\">dynamic GetListByFilter(ArticleModel filter, PageInfo pageInfo)</code></div><div class=\"line number2 index1 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">{</code></div><div class=\"line number3 index2 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">string</code>&nbsp;<code class=\"csharp plain\">_where =&nbsp;</code><code class=\"csharp string\">\" where 1=1\"</code><code class=\"csharp plain\">;</code></div><div class=\"line number4 index3 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">if</code>&nbsp;<code class=\"csharp plain\">(!</code><code class=\"csharp keyword\">string</code><code class=\"csharp plain\">.IsNullOrEmpty(filter.Title))</code></div><div class=\"line number5 index4 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">{</code></div><div class=\"line number6 index5 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp comments\">//LIKE \'%@Title%\' 会解析成\'%\'@Title\'%\' 这里用拼接也是不行的\'%\'+@Title+\'%\' 只能用MySQL函数方法拼接</code></div><div class=\"line number7 index6 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">_where +=&nbsp;</code><code class=\"csharp string\">\" and Title LIKE CONCAT(\'%\',@Title,\'%\')\"</code><code class=\"csharp plain\">;</code></div><div class=\"line number8 index7 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">}</code></div><div class=\"line number9 index8 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">if</code>&nbsp;<code class=\"csharp plain\">(filter.Status !=&nbsp;</code><code class=\"csharp keyword\">null</code><code class=\"csharp plain\">)</code></div><div class=\"line number10 index9 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">{</code></div><div class=\"line number11 index10 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">_where +=&nbsp;</code><code class=\"csharp string\">\" and Status=@Status\"</code><code class=\"csharp plain\">;</code></div><div class=\"line number12 index11 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">}</code></div><div class=\"line number13 index12 alt2\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp keyword\">return</code>&nbsp;<code class=\"csharp plain\">GetListByFilter(filter, pageInfo, _where);</code></div><div class=\"line number14 index13 alt1\"><code class=\"csharp spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"csharp plain\">}</code></div></div></td></tr></tbody></table></div></div></div>', '1', '3', '0', '5', '0', '', '2019-07-29 17:24:18', '2019-07-29 17:24:22');
INSERT INTO `t_article` VALUES ('6', 'Mysql开启远程连接', '首先登录mysql： 然后执行下面两条命令就可开启mysql远程连接： 最后成功连上服务器的MySQL，ლ(•̀ _ •́ ლ)', '/Upload/img/mysql.jpg', '<p>首先登录mysql：</p><p><img src=\"/Upload/img/1260852-20190620183134180-861990751.png\" alt=\"undefined\"><br></p><p>然后执行下面两条命令就可开启mysql远程连接：</p><div class=\"cnblogs_code\"><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div><pre><span>#允许所有用户远程访问 修改用户名和密码为你自己的\r\nmysql</span>&gt; GRANT ALL PRIVILEGES ON *.* TO <span>\'</span><span>USERNAME</span><span>\'</span>@<span>\'</span><span>%</span><span>\'</span> IDENTIFIED BY <span>\'</span><span>PASSWORD</span><span>\'</span><span> WITH GRANT OPTION;\r\n#允许单个ip 修改用户名和密码为你自己的\r\nmysql</span>&gt; GRANT ALL PRIVILEGES ON *.* TO <span>\'</span><span>USERNAME</span><span>\'</span>@<span>\'</span><span>1.2.3.4</span><span>\'</span> IDENTIFIED BY <span>\'</span><span>PASSWORD</span><span>\'</span><span> WITH GRANT OPTION;\r\n#最后\r\nmysql</span>&gt; FLUSH PRIVILEGES;</pre><div class=\"cnblogs_code_toolbar\"><span class=\"cnblogs_code_copy\"><a title=\"复制代码\"><img src=\"https://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\"></a></span></div></div><p><img src=\"/Upload/img/1260852-20190620182652975-893533851.png\" alt=\"undefined\"><br></p><p>最后成功连上服务器的MySQL，ლ(•̀ _ •́ ლ)</p>', '1', '3', '0', '0', '0', '', '2019-07-29 17:32:11', '2019-07-29 17:32:18');

-- ----------------------------
-- Table structure for t_article_class
-- ----------------------------
DROP TABLE IF EXISTS `t_article_class`;
CREATE TABLE `t_article_class` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章分类',
  `OrderNo` int(11) DEFAULT NULL COMMENT '排序ID',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_article_class
-- ----------------------------
INSERT INTO `t_article_class` VALUES ('1', 'ASP.NET MVC', '0', '2019-07-09 15:05:08');
INSERT INTO `t_article_class` VALUES ('2', 'ORM', '0', '2019-07-09 15:08:46');
INSERT INTO `t_article_class` VALUES ('3', 'MySQL', '0', '2019-07-09 15:09:14');
INSERT INTO `t_article_class` VALUES ('4', 'SQL Server', '0', '2019-07-09 15:09:38');
INSERT INTO `t_article_class` VALUES ('5', 'WEB前端', '0', '2019-07-09 15:09:40');
INSERT INTO `t_article_class` VALUES ('6', 'IIS', '0', '2019-07-09 15:09:48');
INSERT INTO `t_article_class` VALUES ('7', 'BUG记录', '0', '2019-07-09 15:09:58');

-- ----------------------------
-- Table structure for t_article_type
-- ----------------------------
DROP TABLE IF EXISTS `t_article_type`;
CREATE TABLE `t_article_type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '文章类型',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_article_type
-- ----------------------------
INSERT INTO `t_article_type` VALUES ('1', '原创', '2019-06-25 18:32:10');
INSERT INTO `t_article_type` VALUES ('2', '转载', '2019-06-25 18:32:13');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SendId` int(11) DEFAULT NULL COMMENT '人员ID',
  `AcceptId` int(11) DEFAULT NULL COMMENT '目标人员ID',
  `Content` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `ParentId` int(11) DEFAULT NULL COMMENT '父ID',
  `ArticleId` int(11) DEFAULT NULL COMMENT '文章ID',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_diarys
-- ----------------------------
DROP TABLE IF EXISTS `t_diarys`;
CREATE TABLE `t_diarys` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Content` text CHARACTER SET utf8 COMMENT '日记内容',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_diarys
-- ----------------------------
INSERT INTO `t_diarys` VALUES ('1', '<p><img src=\"http://localhost:27948/Areas/Admin/plugins/layui/images/face/70.gif\" alt=\"[蜡烛]\">2019.7.29 Liu_Cabbage 博客正式上线啦！！！<img src=\"http://localhost:27948/Areas/Admin/plugins/layui/images/face/70.gif\" alt=\"[蜡烛]\"></p>', '2019-07-29 12:18:33');
INSERT INTO `t_diarys` VALUES ('2', '<img src=\"http://localhost:27948/Areas/Admin/plugins/layui/images/face/66.gif\" alt=\"[奥特曼]\">欢迎大家留言评论，不要玩XSS哦！！！', '2019-07-29 16:38:28');

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `SendId` int(11) DEFAULT NULL COMMENT '人员ID',
  `AcceptId` int(11) DEFAULT NULL COMMENT '目标人员ID',
  `Content` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '内容',
  `ParentId` int(11) DEFAULT NULL COMMENT '父ID',
  `City` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市',
  `Equip` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_links
-- ----------------------------
DROP TABLE IF EXISTS `t_links`;
CREATE TABLE `t_links` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `Name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站名称',
  `Url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '网址',
  `Icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图标',
  `Describe` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_links
-- ----------------------------
INSERT INTO `t_links` VALUES ('1', '燕十三', 'https://www.yanshisan.cn', 'https://www.yanshisan.cn/logo.png', '剑气纵横三万里，一剑光寒十九洲。', '2019-06-29 18:16:49');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `LogType` varchar(20) DEFAULT NULL COMMENT '日志类型',
  `UserName` varchar(20) DEFAULT NULL COMMENT '用户名称',
  `RealName` varchar(20) DEFAULT NULL COMMENT '操作账户',
  `ModuleName` varchar(20) DEFAULT NULL COMMENT '日志模块',
  `Description` varchar(200) DEFAULT NULL COMMENT '日志描述',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  `IPAddress` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `IPAddressName` varchar(100) DEFAULT NULL COMMENT 'IP所在地',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of t_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `MenuName` varchar(20) DEFAULT NULL COMMENT '菜单名称',
  `MenuUrl` varchar(60) DEFAULT NULL COMMENT '菜单地址',
  `MenuIcon` varchar(30) DEFAULT NULL COMMENT '菜单图标',
  `OrderNo` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `ParentId` int(4) DEFAULT '0' COMMENT '父菜单',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '编辑者',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '权限管理', null, 'icon-setting-permissions', '1', '0', '', '2019-02-28 15:03:14', '2019-06-17 17:11:25', '0', '1');
INSERT INTO `t_menu` VALUES ('2', '菜单管理', '/permissions/menu', 'icon-caidan', '1', '1', '', '2019-02-28 15:03:20', '2019-02-28 15:03:23', '0', '0');
INSERT INTO `t_menu` VALUES ('3', '角色管理', '/permissions/role', 'icon-jiaoseguanli', '2', '1', '', '2019-02-28 15:03:25', '2019-02-28 15:03:29', '0', '0');
INSERT INTO `t_menu` VALUES ('4', '用户管理', '/permissions/user', 'icon-yonghu', '3', '1', '', '2019-02-28 15:03:32', '2019-02-28 15:03:35', '0', '0');
INSERT INTO `t_menu` VALUES ('5', '操作管理', '/permissions/action', 'icon-shezhi', '4', '1', '', '2019-02-28 15:03:39', '2019-02-28 15:03:43', '0', '0');
INSERT INTO `t_menu` VALUES ('6', '系统设置', null, 'icon-xitong', '2', '0', '', '2019-02-28 15:03:46', '2019-02-28 15:03:48', '0', '0');
INSERT INTO `t_menu` VALUES ('7', '网站设置', '/sysset/website', 'icon-ditu', '1', '6', '', '2019-02-28 15:03:51', '2019-02-28 15:03:53', '0', '0');
INSERT INTO `t_menu` VALUES ('8', '基本资料', '/SysSet/info', 'icon-jibenziliao', '2', '6', '', '2019-02-28 15:03:56', '2019-02-28 15:03:58', '0', '0');
INSERT INTO `t_menu` VALUES ('9', '修改密码', '/SysSet/password', 'icon-xiugaimima', '3', '6', '', '2019-02-28 15:04:02', '2019-02-28 15:04:05', '0', '0');
INSERT INTO `t_menu` VALUES ('10', '日志管理', '/SysSet/Log', 'icon-xitongrizhi', '4', '6', '', '2019-02-28 15:04:07', '2019-02-28 15:04:10', '0', '0');
INSERT INTO `t_menu` VALUES ('11', '博客管理', null, 'icon-zhuye', '0', '0', '', '2019-06-24 14:24:51', '0001-01-01 00:00:00', '1', '0');
INSERT INTO `t_menu` VALUES ('12', '文章类型', '/Blog/ArticleType', 'icon-jibenziliao', '7', '11', '', '2019-06-24 14:32:31', '2019-06-29 17:41:30', '1', '1');
INSERT INTO `t_menu` VALUES ('13', '文章分类', '/Blog/ArticleClass', 'icon-jibenziliao', '6', '11', '', '2019-06-24 14:51:05', '2019-06-25 18:06:46', '1', '1');
INSERT INTO `t_menu` VALUES ('14', '友情链接', '/Blog/Links', 'icon-jibenziliao', '4', '11', '', '2019-06-24 14:55:33', '2019-06-29 18:12:35', '1', '1');
INSERT INTO `t_menu` VALUES ('15', '日记管理', '/Blog/Diarys', 'icon-jibenziliao', '3', '11', '', '2019-06-24 15:00:40', '2019-06-29 23:19:47', '1', '1');
INSERT INTO `t_menu` VALUES ('16', '文章管理', '/Blog/Article', 'icon-jibenziliao', '0', '11', '', '2019-06-24 15:02:17', '2019-07-01 11:11:49', '1', '1');
INSERT INTO `t_menu` VALUES ('17', '评论管理', '/Blog/Comment', 'icon-jibenziliao', '1', '11', '', '2019-06-25 15:45:24', '2019-07-01 11:11:08', '1', '1');
INSERT INTO `t_menu` VALUES ('18', '留言管理', '/Blog/Feedback', 'icon-jibenziliao', '2', '11', '', '2019-06-25 15:45:49', '2019-07-01 11:10:29', '1', '1');
INSERT INTO `t_menu` VALUES ('19', '用户管理', '/Blog/QQUser', 'icon-jibenziliao', '5', '11', '', '2019-06-25 15:46:43', '2019-06-30 19:52:18', '1', '1');

-- ----------------------------
-- Table structure for t_menu_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_action`;
CREATE TABLE `t_menu_action` (
  `MenuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `ActionId` int(11) DEFAULT NULL COMMENT '操作ID',
  UNIQUE KEY `idx_MenuId_ActionId` (`MenuId`,`ActionId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='菜单操作表';

-- ----------------------------
-- Records of t_menu_action
-- ----------------------------
INSERT INTO `t_menu_action` VALUES ('2', '1');
INSERT INTO `t_menu_action` VALUES ('2', '2');
INSERT INTO `t_menu_action` VALUES ('2', '4');
INSERT INTO `t_menu_action` VALUES ('2', '8');
INSERT INTO `t_menu_action` VALUES ('3', '1');
INSERT INTO `t_menu_action` VALUES ('3', '2');
INSERT INTO `t_menu_action` VALUES ('3', '3');
INSERT INTO `t_menu_action` VALUES ('3', '4');
INSERT INTO `t_menu_action` VALUES ('3', '6');
INSERT INTO `t_menu_action` VALUES ('4', '1');
INSERT INTO `t_menu_action` VALUES ('4', '2');
INSERT INTO `t_menu_action` VALUES ('4', '3');
INSERT INTO `t_menu_action` VALUES ('4', '4');
INSERT INTO `t_menu_action` VALUES ('4', '5');
INSERT INTO `t_menu_action` VALUES ('5', '1');
INSERT INTO `t_menu_action` VALUES ('5', '2');
INSERT INTO `t_menu_action` VALUES ('5', '3');
INSERT INTO `t_menu_action` VALUES ('5', '4');
INSERT INTO `t_menu_action` VALUES ('10', '4');
INSERT INTO `t_menu_action` VALUES ('10', '7');
INSERT INTO `t_menu_action` VALUES ('12', '1');
INSERT INTO `t_menu_action` VALUES ('12', '2');
INSERT INTO `t_menu_action` VALUES ('12', '3');
INSERT INTO `t_menu_action` VALUES ('12', '4');
INSERT INTO `t_menu_action` VALUES ('13', '1');
INSERT INTO `t_menu_action` VALUES ('13', '2');
INSERT INTO `t_menu_action` VALUES ('13', '3');
INSERT INTO `t_menu_action` VALUES ('13', '4');
INSERT INTO `t_menu_action` VALUES ('14', '1');
INSERT INTO `t_menu_action` VALUES ('14', '2');
INSERT INTO `t_menu_action` VALUES ('14', '3');
INSERT INTO `t_menu_action` VALUES ('14', '4');
INSERT INTO `t_menu_action` VALUES ('15', '1');
INSERT INTO `t_menu_action` VALUES ('15', '2');
INSERT INTO `t_menu_action` VALUES ('15', '3');
INSERT INTO `t_menu_action` VALUES ('15', '4');
INSERT INTO `t_menu_action` VALUES ('16', '1');
INSERT INTO `t_menu_action` VALUES ('16', '2');
INSERT INTO `t_menu_action` VALUES ('16', '3');
INSERT INTO `t_menu_action` VALUES ('16', '4');
INSERT INTO `t_menu_action` VALUES ('17', '3');
INSERT INTO `t_menu_action` VALUES ('17', '4');
INSERT INTO `t_menu_action` VALUES ('18', '3');
INSERT INTO `t_menu_action` VALUES ('18', '4');
INSERT INTO `t_menu_action` VALUES ('19', '3');
INSERT INTO `t_menu_action` VALUES ('19', '4');

-- ----------------------------
-- Table structure for t_menu_role_action
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_role_action`;
CREATE TABLE `t_menu_role_action` (
  `MenuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `RoleId` int(11) DEFAULT NULL COMMENT '角色ID',
  `ActionId` int(11) DEFAULT NULL COMMENT '操作ID',
  UNIQUE KEY `idx_RoleId_MenuId` (`MenuId`,`RoleId`,`ActionId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='菜单角色表';

-- ----------------------------
-- Records of t_menu_role_action
-- ----------------------------
INSERT INTO `t_menu_role_action` VALUES ('1', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('2', '1', '8');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('3', '1', '6');
INSERT INTO `t_menu_role_action` VALUES ('4', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('4', '1', '5');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('5', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('6', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('7', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('8', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('9', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('10', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('10', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('10', '1', '7');
INSERT INTO `t_menu_role_action` VALUES ('11', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('11', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('12', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('12', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('12', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('12', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('12', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('12', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('13', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('13', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('14', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('14', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('14', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('14', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('14', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('14', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('15', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('15', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('15', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('15', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('15', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('15', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('16', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('16', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('16', '1', '1');
INSERT INTO `t_menu_role_action` VALUES ('16', '1', '2');
INSERT INTO `t_menu_role_action` VALUES ('16', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('16', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('17', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('17', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('17', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('17', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('18', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('18', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('18', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('18', '1', '4');
INSERT INTO `t_menu_role_action` VALUES ('19', '0', '0');
INSERT INTO `t_menu_role_action` VALUES ('19', '1', '0');
INSERT INTO `t_menu_role_action` VALUES ('19', '1', '3');
INSERT INTO `t_menu_role_action` VALUES ('19', '1', '4');

-- ----------------------------
-- Table structure for t_qq_user
-- ----------------------------
DROP TABLE IF EXISTS `t_qq_user`;
CREATE TABLE `t_qq_user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OpenId` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT 'OpenId',
  `NickName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '昵称',
  `Gender` tinyint(4) DEFAULT NULL COMMENT '性别（0：女，1：男）',
  `HeadShot` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '头像',
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `LastLogin` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of t_qq_user
-- ----------------------------
INSERT INTO `t_qq_user` VALUES ('1', '5DB22905E4DA3582E221CE85737059C1', '蚯蚓', '1', 'http://thirdqq.qlogo.cn/g?b=oidb&k=q8BmhyWUTZEpo7Us6QTqhA&s=140&t=1557712926', '', '2019-07-29 21:49:52', '2019-07-29 21:49:52');
INSERT INTO `t_qq_user` VALUES ('2', 'FBAE41D869FA327AB33AA16D9D9C5E97', '小蚯蚓', '1', 'http://thirdqq.qlogo.cn/g?b=oidb&k=g4LbktibR4Q0eC4RIjiagmvw&s=140&t=1552461721', '', '2019-07-29 21:50:35', '2019-07-29 21:50:35');
INSERT INTO `t_qq_user` VALUES ('3', 'D4092B8AFE758DB49252E8B7AEFDC2AC', '煜昕网络工作室', '1', 'http://thirdqq.qlogo.cn/g?b=oidb&k=diaDg89owmSJCjiaxqSJL54Q&s=140&t=1556350484', '', '2019-07-29 21:51:21', '2019-07-29 21:51:21');
INSERT INTO `t_qq_user` VALUES ('4', '7AE01F1862D52C452B296158F17AF25E', '小小小蚯蚓', '1', 'http://thirdqq.qlogo.cn/g?b=oidb&k=TI6MEZXl7gGtkTribiah3icvA&s=140&t=1552461754', '', '2019-07-29 21:55:44', '2019-07-29 21:55:44');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `RoleCode` varchar(20) DEFAULT NULL COMMENT '角色编码',
  `RoleName` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `Remark` varchar(50) DEFAULT NULL COMMENT '角色描述',
  `Status` bit(1) DEFAULT NULL COMMENT '状态(1:有效，0：无效）',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '更新时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '修改者',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'SysAdmin', '超级管理员', null, '', '2019-02-28 15:34:59', '2019-02-28 15:35:03', '0', '0');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `Id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `UserName` varchar(20) DEFAULT NULL COMMENT '用户名（登录）',
  `RealName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `PassWord` char(32) DEFAULT NULL COMMENT '密码',
  `RoleId` int(4) DEFAULT NULL COMMENT '角色ID',
  `Status` bit(1) DEFAULT NULL COMMENT '状态',
  `CreateOn` datetime DEFAULT NULL COMMENT '创建时间',
  `UpdateOn` datetime DEFAULT NULL COMMENT '修改时间',
  `CreateBy` int(4) DEFAULT NULL COMMENT '创建者',
  `UpdateBy` int(4) DEFAULT NULL COMMENT '修改者',
  `Gender` tinyint(4) DEFAULT NULL COMMENT '性别（0：女，1：男）',
  `Phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `Email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `Remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `HeadShot` varchar(200) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', '超级管理员', '0402fc5aab8be090be14171a3dba0357', '1', '', '2019-02-28 16:18:52', '2019-07-29 16:27:09', '0', '1', '1', '11111111111', '178899573@qq.com', '最高权限', '/Upload/img/502.jpg');
