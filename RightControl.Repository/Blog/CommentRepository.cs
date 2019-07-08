using Dapper;
using RightControl.IRepository;
using RightControl.Model;
using System.Linq;

namespace RightControl.Repository
{
    public class CommentRepository : BaseRepository<CommentModel>, ICommentRepository
    {
        public CommentModel GetDetail(int Id)
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = @"SELECT *,
                        (SELECT NickName FROM t_qq_user WHERE Id=(SELECT SendId FROM t_feedback WHERE Id=@Id) ) as SendNickName,
                        (SELECT NickName FROM t_qq_user WHERE Id=(SELECT AcceptId FROM t_feedback WHERE Id=@Id) ) as AcceptNickName,
                        (SELECT Title FROM t_article WHERE Id=(SELECT ArticleId FROM t_feedback WHERE Id=@Id) ) as ArticleTitle
                         FROM t_comment
                        where Id=@Id;";
                return conn.Query<CommentModel>(sql, new { Id }).FirstOrDefault();
            }
        }
    }
}
