using RightControl.Model;

namespace RightControl.IService
{
    public interface IFeedbackService : IBaseService<FeedbackModel>
    {
        FeedbackModel GetDetail(int Id);
    }
}
