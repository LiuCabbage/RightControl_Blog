using RightControl.IService;
using RightControl.Model;

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
