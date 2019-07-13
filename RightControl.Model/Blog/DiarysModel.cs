using DapperExtensions;
using System;
using System.ComponentModel.DataAnnotations;

namespace RightControl.Model
{
    [Table("t_diarys")]
    public class DiarysModel
    {
        [DapperExtensions.Key(true)]
        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 日记内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 创建日期
        /// </summary>
        [Display(Name = "创建日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm:ss}")]
        public DateTime CreateOn { get; set; }
        /// <summary>
        /// 年份
        /// </summary>
        [Computed]
        public string Year { get; set; }
    }
}
