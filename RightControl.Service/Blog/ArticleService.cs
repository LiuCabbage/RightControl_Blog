using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.Service
{
    public class ArticleService : BaseService<ArticleModel>, IArticleService
    {
        public dynamic GetListByFilter(ArticleModel filter, PageInfo pageInfo)
        {
            string _where = " where 1=1";
            if (!string.IsNullOrEmpty(filter.Title))
            {
                //LIKE '%@Title%' 会解析成'%'@Title'%' 这里用拼接也是不行的'%'+@Title+'%' 只能用MySQL函数方法拼接
                _where += " and Title LIKE CONCAT('%',@Title,'%')";
            }
            if (filter.Status != null)
            {
                _where += " and Status=@Status";
            }
            return GetListByFilter(filter, pageInfo, _where);
        }
    }
}
