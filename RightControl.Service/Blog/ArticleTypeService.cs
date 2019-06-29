using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.Service
{
    public class ArticleTypeService : BaseService<ArticleTypeModel>, IArticleTypeService
    {
        public dynamic GetListByFilter(ArticleTypeModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
    }
}
