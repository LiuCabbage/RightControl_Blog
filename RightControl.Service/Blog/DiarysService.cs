using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.Service
{
    public class DiarysService : BaseService<DiarysModel>, IDiarysService
    {
        public dynamic GetListByFilter(DiarysModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
    }
}
