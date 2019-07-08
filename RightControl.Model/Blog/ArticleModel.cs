using DapperExtensions;
using System;
using System.ComponentModel.DataAnnotations;

namespace RightControl.Model
{
    [Table("t_article")]
    public class ArticleModel
    {
        [DapperExtensions.Key(true)]
        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }
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
        /// 文章类型名称
        /// </summary>
        [Computed]
        public string TypeName { get; set; }
        /// <summary>
        /// 文章分类
        /// </summary>
        public int ClassId { get; set; }
        /// <summary>
        /// 文章分类名称
        /// </summary>
        [Computed]
        public string ClassName { get; set; }
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
        /// 状态
        /// </summary>
        public bool? Status { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        [Display(Name = "创建日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm:ss}")]
        public DateTime CreateOn { get; set; }
        /// <summary>
        /// 修改日期
        /// </summary>
        [Display(Name = "修改日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm:ss}")]
        public DateTime UpdateOn { get; set; }
    }
}
