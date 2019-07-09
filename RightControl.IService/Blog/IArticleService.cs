using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IService
{
    public interface IArticleService : IBaseService<ArticleModel>
    {
        ArticleModel GetDetail(int Id);
        /// <summary>
        /// 热门文章
        /// </summary>
        /// <param name="num">记录数</param>
        /// <returns></returns>
        IEnumerable<ArticleModel> GetHotArticle(int num);
        /// <summary>
        /// 置顶文章
        /// </summary>
        /// <param name="num">记录数</param>
        /// <returns></returns>
        IEnumerable<ArticleModel> GetDingArticle(int num);
    }
}
