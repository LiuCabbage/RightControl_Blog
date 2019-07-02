using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.Service
{
    public class ArticleTypeService : BaseService<ArticleTypeModel>, IArticleTypeService
    {
        public IArticleTypeRepository repository { get; set; }
        public dynamic GetListByFilter(ArticleTypeModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
        public IEnumerable<ArticleTypeModel> GetArticleTypeList()
        {
            return repository.GetArticleTypeList();
        }
    }
}
