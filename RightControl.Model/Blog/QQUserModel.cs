using DapperExtensions;
using System;
using System.ComponentModel.DataAnnotations;

namespace RightControl.Model
{
    [Table("t_qq_user")]
    public class QQUserModel : Entity
    {
        /// <summary>
        /// OpenID
        /// </summary>
        public string OpenId { get; set; }
        /// <summary>
        /// 昵称
        /// </summary>
        public string NickName { get; set; }
        /// <summary>
        /// 性别（0：女，1：男）
        /// </summary>
        public int Gender { get; set; }
        /// <summary>
        /// 头像
        /// </summary>
        public string HeadShot { get; set; }
        /// <summary>
        /// 邮箱
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// 最后一次登录时间
        /// </summary>
        [Display(Name = "最后一次登录时间")]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm:ss}")]
        public DateTime LastLogin { get; set; }
    }
}
