using Dapper;
using RightControl.IRepository;
using RightControl.Model;
using System.Linq;

namespace RightControl.Repository
{
    public class FeedbackRepository : BaseRepository<FeedbackModel>, IFeedbackRepository
    {
        public FeedbackModel GetDetail(int Id)
        {
            using (var conn = MySqlHelper.GetConnection())
            {
                var sql = @"SELECT *,
                        (SELECT NickName FROM t_qq_user WHERE Id=(SELECT SendId FROM t_feedback WHERE Id=@Id) ) as SendNickName,
                        (SELECT NickName FROM t_qq_user WHERE Id=(SELECT AcceptId FROM t_feedback WHERE Id=@Id) ) as AcceptNickName
                         FROM t_feedback
                        where Id=@Id; ";
                return conn.Query<FeedbackModel>(sql, new { Id }).FirstOrDefault();
            }
        }
    }
}
