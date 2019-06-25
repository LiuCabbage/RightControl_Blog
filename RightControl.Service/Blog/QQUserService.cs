using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.Service
{
    public class QQUserService : BaseService<QQUserModel>, IQQUserService
    {
        public dynamic GetListByFilter(QQUserModel filter, PageInfo pageInfo)
        {
            throw new NotImplementedException();
        }
    }
}
