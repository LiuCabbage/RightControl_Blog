using DapperExtensions;

namespace RightControl.Model
{
    [Table("t_links")]
    public class Links : Entity
    {
        /// <summary>
        /// 网站名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 网址
        /// </summary>
        public string Url { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        public string Icon { get; set; }
        /// <summary>
        /// 描述
        /// </summary>
        public string Describe { get; set; }
    }
}
