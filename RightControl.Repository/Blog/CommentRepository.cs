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

        public int GetTodayCommentNum(string OpenId)
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = @"SELECT count(1) as commentNum FROM t_comment a
                    INNER JOIN t_qq_user b on a.SendId=b.Id
                    WHERE DATE_FORMAT(a.CreateOn,'%y-%m-%d')=DATE_FORMAT(NOW(),'%y-%m-%d')
                    and b.OpenId=@OpenId";
                return conn.Query<int>(sql, new { OpenId }).FirstOrDefault();
            }
        }
    }
}
