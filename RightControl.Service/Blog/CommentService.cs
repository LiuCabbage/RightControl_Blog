using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.Service
{
    public class CommentService : BaseService<CommentModel>, ICommentService
    {
        public dynamic GetListByFilter(CommentModel filter, PageInfo pageInfo)
        {
            throw new NotImplementedException();
        }
    }
}
