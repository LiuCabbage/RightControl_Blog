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
            return GetListByFilter(filter, pageInfo, null);
        }
    }
}
