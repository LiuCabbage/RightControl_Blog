using RightControl.Model;
using System.Collections.Generic;

namespace RightControl.IRepository
{
    public interface IDiarysRepository : IBaseRepository<DiarysModel>
    {
        IEnumerable<DiarysModel> GetYear();
    }
}
