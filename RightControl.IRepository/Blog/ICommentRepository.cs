using RightControl.Model;

namespace RightControl.IRepository
{
    public interface ICommentRepository : IBaseRepository<CommentModel>
    {
        CommentModel GetDetail(int Id);
        int GetTodayCommentNum(string OpenId);
    }
}
