using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IRepository
{
    public interface IArticleTypeRepository : IBaseRepository<ArticleTypeModel>
    {
        IEnumerable<ArticleTypeModel> GetArticleTypeList();
    }
}
