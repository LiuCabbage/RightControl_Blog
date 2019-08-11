using RightControl.Model;

namespace RightControl.IService
{
    public interface IQQUserService : IBaseService<QQUserModel>
    {
        QQUserModel GetQQUserByOpenId(string OpenId);
        bool UpdateQQUser(QQUserModel model);
    }
}
