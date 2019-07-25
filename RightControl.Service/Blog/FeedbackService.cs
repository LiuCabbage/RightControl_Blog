using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System.Collections.Generic;
using System.Text;

namespace RightControl.Service
{
    public class FeedbackService : BaseService<FeedbackModel>, IFeedbackService
    {
        public IFeedbackRepository repository { get; set; }
        public FeedbackModel GetDetail(int Id)
        {
            return repository.GetDetail(Id);
        }

        public dynamic GetListByFilter(FeedbackModel filter, PageInfo pageInfo)
        {
            pageInfo.prefix = "a.";
            string _where = @"t_feedback a
                            LEFT OUTER JOIN t_qq_user b on a.SendId=b.Id
                            LEFT OUTER JOIN t_qq_user c on a.AcceptId=c.Id";
            pageInfo.returnFields = string.Format("{0}*,b.NickName as SendNickName,c.NickName as AcceptNickName", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }

        public string GetFlowFeedback(int page, int pagesize)
        {
            string prefix = "a.";
            string _where = @"a
                            LEFT OUTER JOIN t_qq_user b on a.SendId=b.Id
                            LEFT OUTER JOIN t_qq_user c on a.AcceptId=c.Id";
            long total = 0;
            string _orderBy = @"ORDER BY a.CreateOn DESC";
            string returnFields = string.Format("{0}*,b.NickName as SendNickName,c.NickName as AcceptNickName,b.HeadShot", prefix);
            //根据这里的_where条件
            //返回的total是不对的，也用不上，就不管啦。
            IEnumerable<FeedbackModel> parentList = repository.GetByPage(new SearchFilter { pageIndex = page, pageSize = pagesize, returnFields = returnFields, param = null, where = _where + " WHERE a.ParentId=0", orderBy = _orderBy }, out total);
            IEnumerable<FeedbackModel> list = repository.GetByWhere(_where + " WHERE a.ParentId!=0", null, returnFields, _orderBy);
            string feedbackHtml = CreateFeedbackHtml(parentList, list);
            return feedbackHtml;
        }
        private string CreateFeedbackHtml(IEnumerable<FeedbackModel> parentList, IEnumerable<FeedbackModel> list)
        {
            StringBuilder sb = new StringBuilder();
            if (parentList != null && list != null)
            {
                foreach (FeedbackModel item in parentList)
                {
                    sb.AppendFormat(@"<li class='zoomIn article'>
                    <div class='comment-parent'>
                        <a name='remark-{0}'></a>
                        <img src='{1}' />
                        <div class='info'>
                            <span class='username'>{2}</span>
                        </div>
                        <div class='comment-content'>{3}</div>
                        <p class='info info-footer'>
                            <i class='fa fa-map-marker' aria-hidden='true'></i>
                            <span>{4}</span>
                            <i class='fa fa-safari' aria-hidden='true'></i>
                            <span>{8}</span>
                            <span class='comment-time'>{5}</span>
                            <a href='javascript:;' class='btn-reply' data-targetid='{6}' data-targetname='{7}'>回复</a>
                        </p>
                    </div>
                    <hr />", item.Id, item.HeadShot, item.SendNickName, item.Content, item.City, item.CreateOn, item.SendId, item.SendNickName,item.Equip);
                    foreach (FeedbackModel model in list)
                    {
                        if (item.Id == model.ParentId)
                        {
                            sb.AppendFormat(@"<div class='comment-child'>
                                <a name='reply-{0}'></a>
                                <img src='{1}' >
                                <div class='info'>
                                    <span class='username'>{2}</span>
                                    <span style='padding-right:0;margin-left:-5px;'> 回复 </ span>
                                    <span class='username'>{3}</span>
                                    <span>{4}</span>
                                </div>
                                <p class='info'>
                                    <i class='fa fa-map-marker' aria-hidden='true'></i>
                                    <span>{5}</span>
                                    <i class='fa fa-safari' aria-hidden='true'></i>
                                    <span>{9}</span>
                                    <span class='comment-time'>{6}</span>
                                    <a href='javascript:;' class='btn-reply' data-targetid='{7}' data-targetname='{8}'>回复</a>
                                </p>
                            </div>", model.Id, model.HeadShot, model.SendNickName, model.AcceptNickName, model.Content, model.City, model.CreateOn, model.SendId, model.SendNickName,model.Equip);
                        }
                    }
                    sb.AppendFormat(@"<div class='replycontainer layui-hide'>
                            <form class='layui-form' action=''>
                                <input type='hidden' name='remarkId' value='{0}'>
                                <input type='hidden' name='targetUserId' value='0'>
                                <div class='layui-form-item'>
                                    <textarea name='replyContent' lay-verify='replyContent' placeholder='请输入回复内容' class='layui-textarea' style='min-height:80px;'></textarea>
                                </div>
                                <div class='layui-form-item'>
                                    <button class='layui-btn layui-btn-xs' lay-submit='formReply' lay-filter='formReply'>提交</button>
                                </div>
                            </form>
                        </div>
                    </li>", item.Id);
                }
            }
            return sb.ToString();
        }
    }
}
