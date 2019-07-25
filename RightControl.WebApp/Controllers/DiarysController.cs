using RightControl.IService;
using System.Web.Mvc;

namespace RightControl.WebApp.Controllers
{
    public class DiarysController : Controller
    {
        public IDiarysService service { get; set; }
        // GET: Diarys
        public ActionResult Index()
        {
            ViewData["Year"] = service.GetYear();
            ViewData["DiarysList"] = service.GetAll();
            return View();
        }
    }
}