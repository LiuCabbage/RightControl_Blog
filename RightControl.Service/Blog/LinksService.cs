using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;

namespace RightControl.Service
{
    public class LinksService : BaseService<LinksModel>, ILinksService
    {
        public dynamic GetListByFilter(LinksModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
    }
}
