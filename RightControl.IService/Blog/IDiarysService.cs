using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IService
{
    public interface IDiarysService : IBaseService<DiarysModel>
    {
        IEnumerable<DiarysModel> GetYear();
    }
}
