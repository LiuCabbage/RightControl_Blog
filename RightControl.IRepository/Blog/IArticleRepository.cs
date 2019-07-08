using RightControl.Model;

namespace RightControl.IRepository
{
    public interface IArticleRepository : IBaseRepository<ArticleModel>
    {
        ArticleModel GetDetail(int Id);
    }
}
