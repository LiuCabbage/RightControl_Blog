namespace RightControl.Model
{
    public class uploadFile
    {
        public int code { get; set; }
        public string msg { get; set; }
        public dynamic data { get; set; }

        //{
        //  "code": 0 //0表示成功，其它失败
        //  ,"msg": "" //提示信息 //一般上传失败后返回
        //  ,"data": {
        //    "src": "图片路径"
        //    ,"title": "图片名称" //可选
        //  }
        //}
    }
}
