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
            throw new NotImplementedException();
        }
    }
}
