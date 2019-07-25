using RightControl.IService;
using RightControl.WebApp.Models;
using System.Linq;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class ArticleController : Controller
    {
        public IArticleService service { get; set; }
        public IArticleClassService classService { get; set; }
        public IQQUserService userService { get; set; }
        public ICommentService commentService { get; set; }
        // GET: Article
        public ActionResult Index(int? Id = 0)
        {
            ViewBag.ClassList = classService.GetArticleClassList().ToList();
            ViewBag.HotList = service.GetHotArticle(5).ToList();
            ViewBag.DingList = service.GetDingArticle(3).ToList();
            ViewBag.UserList = userService.GetBySkip(0, 12, null, null, null, "ORDER BY CreateOn Desc");
            //每页显示数目
            int PageSize = 10;
            ViewBag.PageSize = PageSize;
            //总条数
            int Count = service.GetByWhere(Id == 0 ? null : string.Format("WHERE ClassId = {0}", Id)).ToList().Count;
            ViewBag.Count = Count;
            //总页数
            int PageCount = (Count + PageSize - 1) / PageSize;
            ViewBag.PageCount = PageCount;
            //文章分类Id
            ViewBag.ClassId = Id;
            return View();
        }
        public ActionResult Detail(int Id)
        {
            WebSiteInfo siteInfo = new WebSiteInfo();
            ViewBag.Site = siteInfo.GetWebSiteInfo();
            //浏览次数+1
            var model = service.GetDetail(Id);
            model.ReadNum++;
            service.UpdateModel(model);
            //获得最新model
            model = service.GetDetail(Id);
            //延伸阅读
            ViewBag.OtherList = service.GetRandomArticleList(2);
            //每页显示数目
            int PageSize = 10;
            ViewBag.PageSize = PageSize;
            //总条数
            int Count = commentService.GetByWhere(Id == 0 ? null : string.Format("WHERE ParentId=0 and ArticleId = {0}", Id)).ToList().Count;
            ViewBag.Count = Count;
            //总页数
            int PageCount = (Count + PageSize - 1) / PageSize;
            ViewBag.PageCount = PageCount;
            return View(model);
        }
        [HttpPost]
        public JsonResult SearchResult(string context)
        {
            var result = service.GetArticleListBySearch(context);
            return Json(result);
        }
        [HttpPost]
        public ContentResult LoadArticleByClass(int classId, int page, int pagesize)
        {
            string result = service.GetListByClassId(classId, page, pagesize);
            return Content(result);
        }
        [HttpPost]
        public ContentResult LoadArticleComment(int articleId, int page, int pagesize)
        {
            string result = service.GetFlowArticleComment(articleId, page, pagesize);
            return Content(result);
        }
    }
}