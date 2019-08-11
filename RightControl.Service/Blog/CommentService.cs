using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;

namespace RightControl.Service
{
    public class CommentService : BaseService<CommentModel>, ICommentService
    {
        public ICommentRepository repository { get; set; }
        public CommentModel GetDetail(int Id)
        {
            return repository.GetDetail(Id);
        }
        public dynamic GetListByFilter(CommentModel filter, PageInfo pageInfo)
        {
            pageInfo.prefix = "a.";
            string _where = @"t_comment a
                            LEFT OUTER JOIN t_qq_user b on a.SendId=b.Id
                            LEFT OUTER JOIN t_qq_user c on a.AcceptId=c.Id
                            left OUTER JOIN t_article d on a.ArticleId=d.Id";
            pageInfo.returnFields = string.Format("{0}*,b.NickName as SendNickName,c.NickName as AcceptNickName,d.Title as ArticleTitle", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }

        public int GetTodayCommentNum(string OpenId)
        {
            return repository.GetTodayCommentNum(OpenId);
        }
    }
}
