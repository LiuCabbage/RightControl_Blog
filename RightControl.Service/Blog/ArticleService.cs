using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System;
using System.Collections.Generic;
using System.Text;
using RightControl.Common;

namespace RightControl.Service
{
    public class ArticleService : BaseService<ArticleModel>, IArticleService
    {
        public IArticleRepository repository { get; set; }
        public ICommentRepository commentRepository { get; set; }
        /// <summary>
        /// 获得文章所有年份
        /// </summary>
        /// <returns></returns>
        public IEnumerable<ArticleModel> GetYear()
        {
            return repository.GetYear();
        }
        /// <summary>
        /// 延伸阅读-获取两条随机文章
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        public IEnumerable<ArticleModel> GetRandomArticleList(int num)
        {
            string _where = "WHERE Id >= ((SELECT MAX(Id) FROM t_article)-(SELECT MIN(Id) FROM t_article)) * RAND() + (SELECT MIN(Id) FROM t_article) LIMIT " + num;
            return repository.GetByWhere(_where, null, null, null); ;
        }

        public IEnumerable<ArticleModel> GetArticleListBySearch(string content)
        {
            string _where = "WHERE Title LIKE CONCAT('%',@Title,'%')";
            string _orderby = @"ORDER BY ReadNum DESC,CreateOn DESC";
            return repository.GetByWhere(_where, new { Title = content }, null, _orderby);
        }

        public ArticleModel GetDetail(int Id)
        {
            return repository.GetDetail(Id);
        }

        public IEnumerable<ArticleModel> GetDingArticle(int num)
        {
            string _where = "WHERE Ding=1 and Status=1";
            string _orderby = @"ORDER BY ReadNum DESC,CreateOn DESC
                                LIMIT 0," + num;
            return repository.GetByWhere(_where, null, null, _orderby);
        }

        public IEnumerable<ArticleModel> GetHotArticle(int num)
        {
            string _where = "WHERE Status=1";
            string _orderby = @"ORDER BY ReadNum DESC,CreateOn DESC
                                LIMIT 0," + num;
            return repository.GetByWhere(_where, null, null, _orderby);
        }

        public dynamic GetListByFilter(ArticleModel filter, PageInfo pageInfo)
        {
            pageInfo.prefix = "a.";
            string _where = @"t_article a
                            INNER JOIN t_article_class b ON a.ClassId = b.Id
                            INNER JOIN t_article_type c ON a.TypeId = c.Id";
            if (!string.IsNullOrEmpty(filter.Title))
            {
                //LIKE '%@Title%' 会解析成'%'@Title'%' 这里用拼接也是不行的'%'+@Title+'%' 只能用MySQL函数方法拼接
                _where += " and Title LIKE CONCAT('%',@Title,'%')";
            }
            if (filter.ClassId != 0)
            {
                _where += string.Format(" and {0}ClassId=@ClassId", pageInfo.prefix);
            }
            if (filter.TypeId != 0)
            {
                _where += string.Format(" and {0}TypeId=@TypeId", pageInfo.prefix);
            }
            if (filter.Status != null)
            {
                _where += string.Format(" and {0}Status=@Status", pageInfo.prefix);
            }
            if (!string.IsNullOrEmpty(pageInfo.field))
            {
                pageInfo.field = pageInfo.prefix + pageInfo.field;
            }
            pageInfo.returnFields = string.Format("{0}Id,{0}Title,a.ImgUrl,c.`Name` as TypeName,b.`Name` as ClassName,{0}Ding,{0}ReadNum,{0}Status,{0}CreateOn", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }
        public string GetListByClassId(int classId, int page, int pagesize)
        {
            string prefix = "a.";
            string _where = @"a
                            INNER JOIN t_article_class b on a.ClassId=b.Id
                            INNER JOIN t_article_type c on a.TypeId=c.Id
                            LEFT JOIN t_comment d on a.Id=d.ArticleId";
            if (classId != 0)
            {
                _where += " WHERE a.Status=1 and a.ClassId=" + classId;
            }
            else
            {
                _where += " WHERE a.Status=1";
            }
            long total = 0;
            string _orderBy = @"GROUP BY a.Id 
                                ORDER BY Ding DESC,CreateOn DESC";
            string returnFields = string.Format("{0}Id,{0}Title,{0}ZhaiYao,{0}ImgUrl,c.`Name` as TypeName,b.`Name` as ClassName,{0}Ding,{0}ReadNum,COUNT(d.Id) as CommentNum,{0}Status,{0}CreateOn", prefix);
            //根据这里的_where条件
            //返回的total是不对的，也用不上，就不管啦。
            IEnumerable<ArticleModel> list = repository.GetByPage(new SearchFilter { pageIndex = page, pageSize = pagesize, returnFields = returnFields, param = null, where = _where, orderBy = _orderBy }, out total);
            string articleHtml = CreateArticleHtml(list);
            return articleHtml;
        }
        private string CreateArticleHtml(IEnumerable<ArticleModel> list)
        {
            StringBuilder sb = new StringBuilder();
            if (list != null)
            {
                foreach (ArticleModel item in list)
                {
                    string links = "/Article/Detail/" + item.Id;
                    sb.AppendFormat(@"<section class='article-item zoomIn article'>
                                        {0}
                                        <h5 class='title'>
                                            <span class='fc-blue'>【{1}】</span>
                                            <a href='{11}'>{2}</a>
                                        </h5>
                                        <div class='time'>
                                            <span class='day'>{3}</span>
                                            <span class='month fs-18'>{4}<span class='fs-14'>月</span></span>
                                            <span class='year fs-18 ml10'>{5}</span>
                                        </div>
                                        <div class='content'>
                                            <a href='{12}' class='cover img-light'>
                                                <img src='{6}' >
                                            </a>
                                            {7}
                                        </div>
                                        <div class='read-more'>
                                            <a href='{13}' class='fc-black f-fwb'>继续阅读</a>
                                        </div>
                                        <aside class='f-oh footer'>
                                            <div class='f-fl tags'>
                                                <span class='fa fa-tags fs-16'></span>
                                                <a class='tag'>{8}</a>
                                            </div>
                                            <div class='f-fr'>
                                                <span class='read'>
                                                    <i class='fa fa-eye fs-16'></i>
                                                    <i class='num'>{9}</i>
                                                </span>
                                                <span class='ml20'>
                                                    <i class='fa fa-comments fs-16'></i>
                                                    <a href = 'javascript:void(0)' class='num fc-grey'>{10}</a>
                                                </span>
                                            </div>
                                        </aside>
                                    </section>", item.Ding == 1 ? "<div class='fc-flag'>置顶</div>" : "", item.TypeName, item.Title, item.CreateOn.ToString("dd"), item.CreateOn.ToString("MM"), item.CreateOn.ToString("yyyy"), item.ImgUrl, item.ZhaiYao, item.ClassName, item.ReadNum, item.CommentNum, links, links, links);

                }
            }
            return sb.ToString();
        }

        public string GetFlowArticleComment(int articleId, int page, int pagesize)
        {
            string prefix = "a.";
            string _where = @"a
                            LEFT OUTER JOIN t_qq_user b on a.SendId=b.Id
                            LEFT OUTER JOIN t_qq_user c on a.AcceptId=c.Id";
            long total = 0;
            string _orderBy = @"ORDER BY a.CreateOn DESC";
            string returnFields = string.Format("{0}*,b.NickName as SendNickName,c.NickName as AcceptNickName,b.HeadShot", prefix);
            //根据这里的_where条件
            //返回的total是不对的，也用不上，就不管啦。
            IEnumerable<CommentModel> parentList = commentRepository.GetByPage(new SearchFilter { pageIndex = page, pageSize = pagesize, returnFields = returnFields, param = null, where = _where + " WHERE a.ParentId=0 and a.ArticleId=" + articleId, orderBy = _orderBy }, out total);
            IEnumerable<CommentModel> list = commentRepository.GetByWhere(_where + " WHERE a.ParentId!=0 and a.ArticleId=" + articleId, null, returnFields, _orderBy);
            string articleCommentHtml = CreateArticleCommentHtml(parentList, list);
            return articleCommentHtml;
        }
        private string CreateArticleCommentHtml(IEnumerable<CommentModel> parentList, IEnumerable<CommentModel> list)
        {
            string OpenComment = Configs.GetValue("OpenComment");
            string replyBtn = "<a href='javascript:;' class='btn-reply' data-targetid='{0}' data-targetname='{1}'>回复</a>";
            StringBuilder sb = new StringBuilder();
            if (parentList != null && list != null)
            {
                foreach (CommentModel item in parentList)
                {
                    sb.AppendFormat(@"<li>
                                <div class='comment-parent'>
                                    <a name='remark-{0}'></a><img src='{1}'>
                                    <div class='info'>
                                        <span class='username'>{2}</span>
                                    </div>
                                    <div class='comment-content'>{3}</div>
                                    <p class='info info-footer'>
                                        <span class='comment-time'>{4}</span>{5}
                                    </p>

                                </div>
                                <hr>", item.Id, item.HeadShot, item.SendNickName, item.Content, item.CreateOn, OpenComment == "true" ? string.Format(replyBtn, item.SendId, item.SendNickName) : "回复已关闭");
                    foreach (CommentModel model in list)
                    {
                        if (item.Id == model.ParentId)
                        {
                            sb.AppendFormat(@"<div class='comment-child'>
                                            <a name='reply-{0}'></a><img src='{1}'>
                                            <div class='info'>
                                                <span class='username'>{2}</span><span style='padding-right:0;margin-left:-5px;'> 回复 </span><span class='username'>{3}</span><span>{4}</span>
                                            </div>
                                            <p class='info'>
                                                <span class='comment-time'>{5}</span>{6}
                                            </p>
                                        </div>", model.Id, model.HeadShot, model.SendNickName, model.AcceptNickName, model.Content, model.CreateOn, OpenComment == "true" ? string.Format(replyBtn, model.SendId, model.SendNickName) : "回复已关闭");
                        }
                    }
                    sb.AppendFormat(@"<div class='replycontainer layui-hide'>
                                    <form class='layui-form' action=''>
                                        <input type='hidden' name='remarkId' value='{0}'><input type='hidden' name='targetUserId' value='0'><input type='hidden' name='articleId' value='{1}'>
                                        <div class='layui-form-item'>
                                            <textarea name='replyContent' lay-verify='replyContent' placeholder='请输入回复内容' class='layui-textarea' style='min-height:80px;'></textarea>
                                        </div>
                                        <div class='layui-form-item'>
                                            <button class='layui-btn layui-btn-xs' lay-submit='formReply' lay-filter='formReply'>提交</button>
                                        </div>
                                    </form>
                                </div>
                            </li>", item.Id, item.ArticleId);
                }
            }
            return sb.ToString();
        }
    }
}
