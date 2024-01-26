using Project_Nhom__.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Project_Nhom__.Controllers
{
    public class StoreController : Controller
    {
        //Tạo 1 đối tượng lưu trữ database
        DataFlowerDataContext data = new DataFlowerDataContext("");
        private List<Hoa> Layhoamoi(int count)
        {
            //Sắp xếp giảm dần theo ngaycapnhat, lay count đóng dấu
            return data.Hoas.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();  
        }
        // GET: Store
        public ActionResult Index()
        {
            //Lấy ra toàn bộ
            var hoamoi = Layhoamoi(14);
            return View(hoamoi);
        }
        public ActionResult Loaihoa()
        {
            var loaihoa = from lh in data.Loaihoas select lh;
            return PartialView(loaihoa);
        }
        public ActionResult Nhacungcap()
        {
            var ncc = from nc in data.Nhacungcaps select nc;
            return PartialView(ncc);  
        }
        public ActionResult Hoatheoloai(int id)
        {
            var hoa = from h in data.Hoas where h.MaLH == id select h;
            return View(hoa);
        }
        public ActionResult Hoatheoncc(int id)
        {
            var hoa = from h in data.Hoas where h.MaNCC == id select h;
            return View(hoa);
        }
        public ActionResult Details(int id)
        {
            var hoa = from h in data.Hoas where h.Mahoa == id select h;
            return View(hoa.Single());
        }
    }
}