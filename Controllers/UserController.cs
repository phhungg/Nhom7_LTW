using Project_Nhom__.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_Nhom__.Controllers
{
    public class UserController : Controller
    {
        DataFlowerDataContext db = new DataFlowerDataContext("");
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Dangky() 
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KhachHang kh)
        {
            var hoten = collection["Hoten"];
            var tendn = collection["Tendn"];
            var matkhau = collection["Matkhau"];
            var matkhaunl = collection["Matkhaunhaplai"];
            var diachi = collection["diachi"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Ngaysinh"]);
            if(String.IsNullOrEmpty(hoten))
            {
                ViewData["loi1"] = "Họ và tên khách hàng không được để trống";
            }
            else if (String.IsNullOrEmpty(tendn)) 
            {
                ViewData["loi2"] = "Tên đăng nhập không được để trống";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["loi3"] = "Vui lòng nhập mật khẩu";
            }
            else if (String.IsNullOrEmpty(matkhaunl))
            {
                ViewData["loi4"] = "Vui lòng nhập lại mật khẩu";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["loi5"] = "Email không được để trống";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["loi6"] = "Số điện thoại không được để trống";
            }
            else
            {
                kh.HoTen = hoten;
                kh.TaiKhoan = tendn;
                kh.MatKhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                kh.DienThoaiKH = dienthoai;
                kh.NgaySinh = DateTime.Parse(ngaysinh);
                db.KhachHangs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("Dangnhap");
            }
            return this.Dangky();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection collection)
        {
            var tendn = collection["Tendn"];
            var matkhau = collection["Matkhau"];
            if(String.IsNullOrEmpty(tendn)) 
            {
                ViewData["loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                //Gán giá trị cho đối tượng mới tạo
                KhachHang kh = db.KhachHangs.SingleOrDefault(n => n.TaiKhoan == tendn && n.MatKhau == matkhau);
                if (kh != null) 
                {
                    ViewBag.Thongbao = "Chúc mừng bạn đã đăng nhập thành công";
                    Session["Taikhoan"] = kh;
                }
                else
                {
                    ViewBag.Thongbao = "tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }

    }
}