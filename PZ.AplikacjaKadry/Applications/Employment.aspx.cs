using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SZRBD.Kadry.Applications
{
    public partial class Employment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter("select * from dbo.WNIOSEK_ZATRUDNIENIE inner join dbo.OGLOSZENIE_STANOWISKO on dbo.WNIOSEK_ZATRUDNIENIE.Id_ogloszenie = dbo.OGLOSZENIE_STANOWISKO.Id_ogloszenie where Status = 'Oczekuje'", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "WNIOSEK_ZATRUDNIENIE");
            applicationList.DataSource = ds.Tables["WNIOSEK_ZATRUDNIENIE"];
            applicationList.DataBind();
        }
    }
}