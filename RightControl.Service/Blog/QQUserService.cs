using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using RightControl.Model;
using RightControl.IService;
using RightControl.IRepository;

namespace RightControl.Service
{
    public class QQUserService : BaseService<QQUserModel>, IQQUserService
    {
        public IQQUserRepository repository { get; set; }
        /// <summary>
        /// 修改QQUser
        /// </summary>
        /// <param name="OpenId"></param>
        /// <returns></returns>
        public bool UpdateQQUser(QQUserModel model)
        {
            return repository.Update(model) > 0 ? true : false;
        }

        public dynamic GetListByFilter(QQUserModel filter, PageInfo pageInfo)
        {
            return GetListByFilter(filter, pageInfo, null);
        }
        /// <summary>
        /// 获取QQUser信息
        /// </summary>
        /// <param name="OpenId"></param>
        /// <returns></returns>
        public QQUserModel GetQQUserByOpenId(string OpenId)
        {
            return repository.GetByWhere("WHERE OpenId=@openid", new { openid = OpenId }).FirstOrDefault();
        }
    }
}
