using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SZRBD.Kadry
{
    public partial class Adverts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter("select * from dbo.OGLOSZENIE_STANOWISKO inner join dbo.STANOWISKO on dbo.OGLOSZENIE_STANOWISKO.Id_stanowisko = dbo.STANOWISKO.Id_stanowisko", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "OGLOSZENIE_STANOWISKO");
            advertsList.DataSource = ds.Tables["OGLOSZENIE_STANOWISKO"];
            advertsList.DataBind();
        }

        protected void DeleteItem_Click(object sender, EventArgs e)
        {
            try
            {
                var btn = sender as LinkButton;
                var id = btn.CommandArgument;

                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd1 = new SqlCommand(@"delete from dbo.WNIOSEK_ZATRUDNIENIE where Id_ogloszenie = @Id", con);
                cmd1.Parameters.AddWithValue("@Id", id);
                var rows1 = cmd1.ExecuteNonQuery();

                SqlCommand cmd2 = new SqlCommand(@"delete from dbo.OGLOSZENIE_STANOWISKO where Id_ogloszenie = @Id", con);
                cmd2.Parameters.AddWithValue("@Id", id);

                var rows2 = cmd2.ExecuteNonQuery();

                Response.Redirect(Request.Url.ToString());
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = "Nie można usunąć wpisu.";
                ErrorMessage.ForeColor = Color.Red;
            }
        }
    }
}