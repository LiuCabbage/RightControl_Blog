using DapperExtensions;

namespace RightControl.Model
{
    [Table("t_diarys")]
    public class DiarysModel : Entity
    {
        /// <summary>
        /// 日记内容
        /// </summary>
        public string Content { get; set; }
    }
}
