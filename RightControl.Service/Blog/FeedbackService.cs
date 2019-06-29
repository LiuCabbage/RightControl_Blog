using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.Service
{
    public class FeedbackService : BaseService<FeedbackModel>, IFeedbackService
    {
        public dynamic GetListByFilter(FeedbackModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
    }
}
