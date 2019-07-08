using Dapper;
using RightControl.IRepository;
using RightControl.Model;
using System.Linq;

namespace RightControl.Repository
{
    public class ArticleRepository : BaseRepository<ArticleModel>, IArticleRepository
    {
        /// <summary>
        /// 文章详细信息
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public ArticleModel GetDetail(int Id)
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = @"SELECT a.Id,a.Title,a.ZhaiYao,a.Content,a.TypeId,a.ClassId,c.`Name` as TypeName,b.`Name` as ClassName,a.Ding,a.ReadNum,
                            (SELECT COUNT(1) FROM t_comment WHERE ArticleId = @Id) as CommentNum,
                            a.`Status`,a.UpdateOn,a.CreateOn FROM t_article a
                            INNER JOIN t_article_class b ON a.ClassId = b.Id
                            INNER JOIN t_article_type c ON a.TypeId = c.Id
                            where a.Id = @Id; ";
                return conn.Query<ArticleModel>(sql, new { Id }).FirstOrDefault();
            }
        }
    }
}
