using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;

namespace RightControl.Service
{
    public class FeedbackService : BaseService<FeedbackModel>, IFeedbackService
    {
        public IFeedbackRepository repository { get; set; }
        public FeedbackModel GetDetail(int Id)
        {
            return repository.GetDetail(Id);
        }
        public dynamic GetListByFilter(FeedbackModel filter, PageInfo pageInfo)
        {
            pageInfo.prefix = "a.";
            string _where = @"t_feedback a
                            LEFT OUTER JOIN t_qq_user b on a.SendId=b.Id
                            LEFT OUTER JOIN t_qq_user c on a.AcceptId=c.Id";
            pageInfo.returnFields = string.Format("{0}*,b.NickName as SendNickName,c.NickName as AcceptNickName", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }
    }
}
