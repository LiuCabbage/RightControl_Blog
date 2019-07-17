using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IService
{
    public interface IArticleService : IBaseService<ArticleModel>
    {
        /// <summary>
        /// 延伸阅读-获取两条随机文章
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        IEnumerable<ArticleModel> GetRandomArticleList(int num);
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
        /// <summary>
        /// 搜索文章
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        IEnumerable<ArticleModel> GetArticleListBySearch(string content);
        string GetListByClassId(int classId, int page, int pagesize);
    }
}
