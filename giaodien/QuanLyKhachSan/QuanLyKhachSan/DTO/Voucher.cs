using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKhachSan.DTO
{
    public class Voucher
    {
        private string maphieuthuephong;
        private DateTime? ngaybatdauthue;
        private string maphong;
        private int dongiathue1ngay;
        private int sokhachtrongphong;
        public Voucher (string maphieuthuephong,DateTime? ngaybatdauthue,string maphong, int dongiathue1ngay,int sokhachtrongphong)
        {
            this.Maphieuthuephong = maphieuthuephong;
            this.Ngaybatdauthue = ngaybatdauthue;
            //this.Maphong = maphong;
            this.Dongiathue1ngay = dongiathue1ngay;
            this.Sokhachtrongphong = sokhachtrongphong;
        }
        public Voucher(DataRow row)
        {
            this.Maphieuthuephong = row["maphieuthuephong"].ToString();
            this.Ngaybatdauthue = (DateTime?)row["ngaybatdauthue"];
            //this.Maphong = row["maphong"].ToString();
            this.Dongiathue1ngay = (int)row["dongiathue1ngay"];
            this.Sokhachtrongphong = (int)row["sokhachtrongphong"];
        }
        public string Maphieuthuephong
        {
            get
            {
                return maphieuthuephong;
            }

            set
            {
                maphieuthuephong = value;
            }
        }

        public DateTime? Ngaybatdauthue
        {
            get
            {
                return ngaybatdauthue;
            }

            set
            {
                ngaybatdauthue = value;
            }
        }

        public string Maphong
        {
            get
            {
                return maphong;
            }

            set
            {
                maphong = value;
            }
        }

        public int Dongiathue1ngay
        {
            get
            {
                return dongiathue1ngay;
            }

            set
            {
                dongiathue1ngay = value;
            }
        }

        public int Sokhachtrongphong
        {
            get
            {
                return sokhachtrongphong;
            }

            set
            {
                sokhachtrongphong = value;
            }
        }
    }
}
