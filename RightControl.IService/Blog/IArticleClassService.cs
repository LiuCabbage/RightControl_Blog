using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IService
{
    public interface IArticleClassService : IBaseService<ArticleClassModel>
    {
        IEnumerable<ArticleClassModel> GetArticleClassList();
    }
}
