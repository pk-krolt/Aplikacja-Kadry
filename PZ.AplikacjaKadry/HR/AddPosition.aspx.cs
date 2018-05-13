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
    public partial class AddPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into dbo.STANOWISKO (Nazwa_stanowisko, Dzial) values (@Nazwa_stanowisko, @Dzial)", con);
            cmd.Parameters.AddWithValue("@Nazwa_stanowisko", Name.Text);
            cmd.Parameters.AddWithValue("@Dzial", Department.SelectedItem.Text);
            int rows = cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Positions.aspx");
        }
    }
}