using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IService
{
    public interface IArticleTypeService : IBaseService<ArticleTypeModel>
    {
        IEnumerable<ArticleTypeModel> GetArticleTypeList();
    }
}
