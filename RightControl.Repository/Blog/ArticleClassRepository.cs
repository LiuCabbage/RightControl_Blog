using Dapper;
using RightControl.IRepository;
using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.Repository
{
    public class ArticleClassRepository : BaseRepository<ArticleClassModel>, IArticleClassRepository
    {
        public IEnumerable<ArticleClassModel> GetArticleClassList()
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = "SELECT Id,Name from t_article_class ORDER BY OrderNo ASC";
                return conn.Query<ArticleClassModel>(sql);
            }
        }
    }
}
