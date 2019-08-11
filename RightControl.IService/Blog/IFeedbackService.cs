using RightControl.Model;

namespace RightControl.IService
{
    public interface IFeedbackService : IBaseService<FeedbackModel>
    {
        FeedbackModel GetDetail(int Id);
        string GetFlowFeedback(int page, int pagesize);
        int GetTodayFeedbackNum(string OpenId);
    }
}
