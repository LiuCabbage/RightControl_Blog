using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System;
using System.Collections.Generic;

namespace RightControl.Service
{
    public class ArticleService : BaseService<ArticleModel>, IArticleService
    {
        public IArticleRepository repository { get; set; }
        public ArticleModel GetDetail(int Id)
        {
            return repository.GetDetail(Id);
        }

        public IEnumerable<ArticleModel> GetDingArticle(int num)
        {
            string _where = "WHERE Ding=1 and Status=1";
            string _orderby = @"ORDER BY ReadNum DESC,CreateOn DESC
                                LIMIT 0,"+num;
            return repository.GetByWhere(_where,null,null,_orderby);
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
            pageInfo.returnFields = string.Format("{0}Id,{0}Title,c.`Name` as TypeName,b.`Name` as ClassName,{0}Ding,{0}ReadNum,{0}Status,{0}CreateOn", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }
    }
}
