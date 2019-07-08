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
            return GetListByFilter(filter, pageInfo, null);
        }
    }
}
