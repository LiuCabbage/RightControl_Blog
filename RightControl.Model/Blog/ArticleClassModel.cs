using DapperExtensions;

namespace RightControl.Model
{
    [Table("t_article_class")]
    public class ArticleClassModel : Entity
    {
        /// <summary>
        /// 文章分类
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 排序号
        /// </summary>
        public int OrderNo { get; set; }
    }
}
