using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IRepository
{
    public interface IArticleRepository : IBaseRepository<ArticleModel>
    {
        ArticleModel GetDetail(int Id);
        IEnumerable<ArticleModel> GetYear();
    }
}
