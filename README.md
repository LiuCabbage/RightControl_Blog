# RightControl_Blog

#### 介绍
前台使用燕十三博客前端模板，后台基于RightControl .NET通用角色权限管理系统搭建，已完成。<br>
项目地址：http://www.baocaige.top

#### 使用说明

1. 先创建数据库，然后执行sql目录下面的rightcontrol_blog.sql即可。
2. 账号：admin
3. 密码：123456

#### 项目说明

1. 前台使用燕十三博客前端模板，美观大气。
2. 后台基于RightControl .NET通用角色权限管理系统搭建，节省开发时间。
3. 接入QQ互联，一键登录，降低注册门槛。
4. 网站设置使用XML配置，新增开启评论，开启留言开关。
5. 关于Layui流加载文章列表，评论，留言都是后台拼接，且每页显示数量在对应控制器里可修改。
6. 新增今日评论，留言最大数量配置，每日提交超过后台设置的数量将自动锁定QQ用户。


#### 项目的其他想法

1. 由于QQ互联不返回QQ号，所以t_qq_user里的Email为空，评论留言的回复邮件通知我没做（要做的话回复的时候判断一下，让用户补充邮箱。）
2. 文章编辑器用的是Layedit，功能有点弱，但是Layui文档全，用的比较舒服（我试过改用wangEditor，只需要引用一个js，但是它上传的图片也是不能右键修改图片大小的，还要重写图片上传方法，我枯了，就退回了Layedit的版本。）
3. 编辑器推荐：KindEditor，UEditor。
4. 流加载文章列表，评论，留言后台拼接代码可优化，双重foreach+if，怎么看都有点沙雕。

#### 项目截图
![输入图片说明](https://images.gitee.com/uploads/images/2019/0730/001705_92a610e2_1130037.png "1.png")
![输入图片说明](https://images.gitee.com/uploads/images/2019/0730/001712_84d46d7f_1130037.png "2.png")
![输入图片说明](https://images.gitee.com/uploads/images/2019/0730/001500_cb7484df_1130037.png "3.png")
![输入图片说明](https://images.gitee.com/uploads/images/2019/0811/193113_6d361d70_1130037.jpeg "1.jpg")