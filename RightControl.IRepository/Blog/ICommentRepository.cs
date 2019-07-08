using RightControl.Model;

namespace RightControl.IRepository
{
    public interface ICommentRepository : IBaseRepository<CommentModel>
    {
        CommentModel GetDetail(int Id);
    }
}
