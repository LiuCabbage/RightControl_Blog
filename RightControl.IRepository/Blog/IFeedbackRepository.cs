using RightControl.Model;

namespace RightControl.IRepository
{
    public interface IFeedbackRepository : IBaseRepository<FeedbackModel>
    {
        FeedbackModel GetDetail(int Id);
    }
}
