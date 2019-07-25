namespace RightControl.WebApp.Models
{
    public class QQUserInfo
    {
        //一些多余返回的参数，但是文档没有标注
        public int is_lost { get; set; }
        public string province { get; set; }
        public string city { get; set; }
        public string year { get; set; }
        public string constellation { get; set; }
        public string figureurl_qq { get; set; }
        public string figureurl_type { get; set; }
        /// <summary>
        /// 返回码
        /// </summary>
        public int ret { get; set; }
        /// <summary>
        /// 如果ret小于0，会有相应的错误信息提示，返回数据全部用UTF-8编码。
        /// </summary>
        public string msg { get; set; }
        /// <summary>
        /// 用户在QQ空间的昵称。
        /// </summary>
        public string nickname { get; set; }
        /// <summary>
        /// 大小为30×30像素的QQ空间头像URL。
        /// </summary>
        public string figureurl { get; set; }
        /// <summary>
        /// 大小为50×50像素的QQ空间头像URL。
        /// </summary>
        public string figureurl_1 { get; set; }
        /// <summary>
        /// 大小为100×100像素的QQ空间头像URL。
        /// </summary>
        public string figureurl_2 { get; set; }
        /// <summary>
        /// 大小为40×40像素的QQ头像URL。
        /// </summary>
        public string figureurl_qq_1 { get; set; }
        /// <summary>
        /// 大小为100×100像素的QQ头像URL。需要注意，不是所有的用户都拥有QQ的100x100的头像，但40x40像素则是一定会有。
        /// </summary>
        public string figureurl_qq_2 { get; set; }
        /// <summary>
        /// 性别。 如果获取不到则默认返回"男"
        /// </summary>
        public string gender { get; set; }
        /// <summary>
        /// 是否黄钻
        /// </summary>
        public string is_yellow_vip { get; set; }
        /// <summary>
        /// 是否vip
        /// </summary>
        public string vip { get; set; }
        /// <summary>
        /// 黄钻等级
        /// </summary>
        public string yellow_vip_level { get; set; }
        /// <summary>
        /// vip等级
        /// </summary>
        public string level { get; set; }
        /// <summary>
        /// 是否年费黄钻
        /// </summary>
        public string is_yellow_year_vip { get; set; }
    }
}