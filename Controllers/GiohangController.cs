using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_Nhom__.Models;
namespace Project_Nhom__.Controllers
{
    public class GiohangController : Controller
    {
        DataFlowerDataContext data = new DataFlowerDataContext("");
        // GET: Giohang
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lstgiohang = Session["Giohang"] as List<Giohang>;
            if (lstgiohang == null)
            {
                lstgiohang = new List<Giohang>();
                Session["Giohang"]=lstgiohang;
            }
            return lstgiohang;
        }
        public ActionResult Themgiohang(int iMahoa, string strUrl)
        {
            List<Giohang> lstgiohang = Laygiohang();
            Giohang hoa = lstgiohang.Find(n => n.iMahoa == iMahoa);
            if(hoa == null)
            {
                hoa = new Giohang(iMahoa);
                lstgiohang.Add(hoa);
                return Redirect(strUrl);
            }
            else
            {
                hoa.iSoluong++;
                return Redirect(strUrl);
            }
        }
        private int Tongsoluong()
        {
            int itongsoluong = 0;
            List<Giohang> lstgiohang = Session["Giohang"] as List<Giohang>;
            if (lstgiohang != null)
            {
                itongsoluong=lstgiohang.Sum(n => n.iSoluong);
            }
            return itongsoluong;
        }
        private double Tongtien()
        {
            double itongtien = 0;
            List<Giohang> lstgiohang = Session["Giohang"] as List<Giohang>;
            if(lstgiohang != null)
            {
                itongtien = lstgiohang.Sum(n => n.dThanhtien);
            }
            return itongtien;
        }
        public ActionResult Giohang()
        {
            List<Giohang> lstgiohang = Laygiohang();
            if (lstgiohang.Count == 0)
            {
                return RedirectToAction("Index", "Store");
            }
            ViewBag.Tongsoluong=Tongsoluong();
            ViewBag.Tongtien=Tongtien();
            return View(lstgiohang);
        }
        public ActionResult Giohangpartial()
        {
            ViewBag.Tongsoluong=Tongsoluong();
            ViewBag.Tongtien = Tongtien();
            return PartialView();
        }
        public ActionResult Delete(int iMahoa)
        {
            List<Giohang> lstgohang = Laygiohang();
            Giohang hoa = lstgohang.SingleOrDefault(n => n.iMahoa == iMahoa);
            if (lstgohang != null)
            {
                lstgohang.RemoveAll(n => n.iMahoa == iMahoa);
                return RedirectToAction("Giohang");
            }
            if(lstgohang.Count == 0)
            {
                return RedirectToAction("Index", "Store");
            }
            return RedirectToAction("Giohang");
        }
        public ActionResult Capnhagiohang(int iMahoa, FormCollection f)
        {
            List<Giohang> lstgiohang = Laygiohang();
            Giohang hoa = lstgiohang.SingleOrDefault(n => n.iMahoa == iMahoa);
            if(hoa != null) {
                hoa.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            return RedirectToAction("Giohang");
        }
    }
}