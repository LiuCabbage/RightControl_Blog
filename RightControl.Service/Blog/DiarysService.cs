using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.Service
{
    public class DiarysService : BaseService<DiarysModel>, IDiarysService
    {
        public IDiarysRepository repository { get; set; }
        public dynamic GetListByFilter(DiarysModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
        /// <summary>
        /// 获得日记所有年份
        /// </summary>
        /// <returns></returns>
        public IEnumerable<DiarysModel> GetYear()
        {
            return repository.GetYear();
        }
    }
}
