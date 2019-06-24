using DapperExtensions;

namespace RightControl.Model
{
    [Table("t_article_type")]
    public class ArticleType : Entity
    {
        /// <summary>
        /// 文章类型
        /// </summary>
        public string Name { get; set; }
    }
}
