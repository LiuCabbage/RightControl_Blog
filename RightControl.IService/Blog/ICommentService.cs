using RightControl.Model;

namespace RightControl.IService
{
    public interface ICommentService : IBaseService<CommentModel>
    {
        CommentModel GetDetail(int Id);
        int GetTodayCommentNum(string OpenId);
    }
}
