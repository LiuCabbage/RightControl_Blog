using RightControl.Model;

namespace RightControl.IService
{
    public interface ILogService:IBaseService<LogModel>
    {
        bool WriteDbLog(LogModel model);
    }
}
