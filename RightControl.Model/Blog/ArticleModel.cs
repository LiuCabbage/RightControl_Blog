using DapperExtensions;

namespace RightControl.Model
{
    [Table("t_article")]
    public class ArticleModel : Entity
    {
        /// <summary>
        /// 标题
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 摘要
        /// </summary>
        public string ZhaiYao { get; set; }
        /// <summary>
        /// 内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 文章类型
        /// </summary>
        public int TypeId { get; set; }
        /// <summary>
        /// 文章分类
        /// </summary>
        public int ClassId { get; set; }
        /// <summary>
        /// 是否置顶：0否，1是
        /// </summary>
        public int Ding { get; set; }
        /// <summary>
        /// 阅读数
        /// </summary>
        public int ReadNum { get; set; }
        /// <summary>
        /// 评论数
        /// </summary>
        public int CommentNum { get; set; }
        /// <summary>
        /// 是否可见：0可见，1不可见
        /// </summary>
        public int Visible { get; set; }
    }
}
