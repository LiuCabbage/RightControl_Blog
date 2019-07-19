using DapperExtensions;
using System;
using System.ComponentModel.DataAnnotations;

namespace RightControl.Model
{
    [Table("t_feedback")]
    public class FeedbackModel
    {
        [DapperExtensions.Key(true)]
        /// <summary>
        /// ID
        /// </summary>
        public int Id { get; set; }
        /// <summary>
        /// 人员ID
        /// </summary>
        public int SendId { get; set; }
        /// <summary>
        /// 人员昵称
        /// </summary>
        [Computed]
        public string SendNickName { get; set; }
        /// <summary>
        /// 目标人员ID
        /// </summary>
        public int AcceptId { get; set; }
        /// <summary>
        /// 目标人员昵称
        /// </summary>
        [Computed]
        public string AcceptNickName { get; set; }
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
        /// <summary>
        /// 创建日期
        /// </summary>
        [Display(Name = "创建日期")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm:ss}")]
        public DateTime CreateOn { get; set; }
        [Computed]
        public string HeadShot { get; set; }
    }
}
