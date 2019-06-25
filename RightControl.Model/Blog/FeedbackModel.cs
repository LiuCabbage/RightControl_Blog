using DapperExtensions;

namespace RightControl.Model
{
    [Table("t_feedback")]
    public class FeedbackModel : Entity
    {
        /// <summary>
        /// 人员ID
        /// </summary>
        public int SendId { get; set; }
        /// <summary>
        /// 目标人员ID
        /// </summary>
        public int AcceptId { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 父ID
        /// </summary>
        public int ParentId { get; set; }
        /// <summary>
        /// 城市
        /// </summary>
        public string City { get; set; }
        /// <summary>
        /// 设备
        /// </summary>
        public string Equip { get; set; }
    }
}
