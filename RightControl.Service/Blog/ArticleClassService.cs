using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.Service
{
    public class ArticleClassService : BaseService<ArticleClassModel>, IArticleClassService
    {
        public IArticleClassRepository repository { get; set; }
        public dynamic GetListByFilter(ArticleClassModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }

        public IEnumerable<ArticleClassModel> GetArticleClassList()
        {
            return repository.GetArticleClassList();
        }

        public bool DeleteClassAllByClassId(int classId)
        {
            return repository.DeleteClassAllByClassId(classId);
        }
    }
}
