using Dapper;
using RightControl.IRepository;
using RightControl.Model;
using System.Collections.Generic;
using System.Data;

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
        public bool DeleteClassAllByClassId(int classId)
        {
            string sql1 = string.Format("DELETE FROM t_article_class WHERE Id={0}", classId);
            string sql2 = string.Format("DELETE FROM t_article WHERE ClassId={0}", classId);
            using (var conn = MySqlHelper.GetConnection())
            {
                IDbTransaction transaction = conn.BeginTransaction();
                try
                {
                    conn.Execute(sql1, null, transaction);
                    conn.Execute(sql2, null, transaction);
                    transaction.Commit();
                    return true;
                }
                catch (System.Exception)
                {
                    transaction.Rollback();
                    return false;
                }
            }
        }
    }
}
