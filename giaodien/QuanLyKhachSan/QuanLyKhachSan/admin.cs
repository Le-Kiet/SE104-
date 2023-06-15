using QuanLyKhachSan;
using QuanLyKhachSan.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyKhachSan
{
    public partial class admin : Form
    {
        public admin()
        {
            InitializeComponent();
            //loadAccountlist();
        }
        void loadAccountlist()
        {           
            string query = "exec USP_GetListAccount @Username";

//            DataProvider provider = new Dataprovider();

            dtgvAccount.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] {"Tri", "Kiet", "Minh" });

        }

        private void btnViewRoom_Click(object sender, EventArgs e)
        {

        }

        private void btnViewBill_Click(object sender, EventArgs e)
        {

        }

        private void btnAddRoom_Click(object sender, EventArgs e)
        {

        }

        /*private class Dataprovider : DataProvider
        {
            public Dataprovider()
            {
            }
        }*/
    }
}
