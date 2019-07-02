using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IRepository
{
    public interface IArticleClassRepository : IBaseRepository<ArticleClassModel>
    {
        IEnumerable<ArticleClassModel> GetArticleClassList();
    }
}
