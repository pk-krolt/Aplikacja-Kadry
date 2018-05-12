using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SZRBD.Kadry.HR
{
    public partial class Departments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter("select * from dbo.PRACOWNIK inner join dbo.STANOWISKO on dbo.PRACOWNIK.Id_stanowisko = dbo.STANOWISKO.Id_stanowisko", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "PRACOWNIK");

            DataView dv1 = ds.Tables["PRACOWNIK"].AsDataView();
            dv1.RowFilter = "Dzial='Produkcja'";
            ProductionList.DataSource = dv1;
            ProductionList.DataBind();

            DataView dv2 = ds.Tables["PRACOWNIK"].AsDataView();
            dv2.RowFilter = "Dzial='Ksiegowosc'";
            BookKeepingList.DataSource = dv2;
            BookKeepingList.DataBind();

            DataView dv3 = ds.Tables["PRACOWNIK"].AsDataView();
            dv3.RowFilter = "Dzial='Zarzad'";
            ManagementList.DataSource = dv3;
            ManagementList.DataBind();

            DataView dv4 = ds.Tables["PRACOWNIK"].AsDataView();
            dv4.RowFilter = "Dzial='Magazyn'";
            StorageList.DataSource = dv4;
            StorageList.DataBind();

            DataView dv5 = ds.Tables["PRACOWNIK"].AsDataView();
            dv5.RowFilter = "Dzial='Sprzedaz'";
            SaleList.DataSource = dv5;
            SaleList.DataBind();

            DataView dv6 = ds.Tables["PRACOWNIK"].AsDataView();
            dv6.RowFilter = "Dzial='Marketing'";
            MarketingList.DataSource = dv6;
            MarketingList.DataBind();

            DataView dv7 = ds.Tables["PRACOWNIK"].AsDataView();
            dv7.RowFilter = "Dzial='Transport'";
            TransportList.DataSource = dv7;
            TransportList.DataBind();

            DataView dv8 = ds.Tables["PRACOWNIK"].AsDataView();
            dv8.RowFilter = "Dzial='IT'";
            ITList.DataSource = dv8;
            ITList.DataBind();

            DataView dv9 = ds.Tables["PRACOWNIK"].AsDataView();
            dv9.RowFilter = "Dzial='Inne'";
            OtherList.DataSource = dv9;
            OtherList.DataBind();
        }

        protected void DeleteItem_Click(object sender, EventArgs e)
        {

        }
    }
}