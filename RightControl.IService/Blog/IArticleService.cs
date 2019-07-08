using RightControl.Model;

namespace RightControl.IService
{
    public interface IArticleService : IBaseService<ArticleModel>
    {
        ArticleModel GetDetail(int Id);
    }
}
