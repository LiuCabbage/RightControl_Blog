using DapperExtensions;

namespace RightControl.Model
{
    [Table("t_comment")]
    public class Comment : Entity
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
        /// 状态
        /// </summary>
        public int State { get; set; }
        /// <summary>
        /// 父ID
        /// </summary>
        public int ParentId { get; set; }
        /// <summary>
        /// 文章ID
        /// </summary>
        public int ArticleId { get; set; }
    }
}
