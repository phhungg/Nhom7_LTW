using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_Nhom__.Models
{
    public class Giohang
    {
        DataFlowerDataContext data = new DataFlowerDataContext("");
        public int iMahoa { get; set; }
        public string iTenhoa { get; set; }
        public string iAnhbia { get; set; }
        public Double iDongia { get; set; }
        public int iSoluong { get; set; }
        public Double dThanhtien
        {
            get { return iSoluong * iDongia; }
        }
        public Giohang(int Mahoa)
        {
            iMahoa = Mahoa;
            Hoa hoa = data.Hoas.Single(n => n.Mahoa == iMahoa);
            iTenhoa = hoa.Tenloaihoa;
            iAnhbia = hoa.AnhBia;
            iDongia = double.Parse(hoa.GiaBan.ToString());
            iSoluong = 1;
        }
    }
}