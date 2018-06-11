using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SZRBD.Kadry.HR
{
    public partial class People : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter da = new SqlDataAdapter("select * from dbo.PRACOWNIK inner join dbo.STANOWISKO on dbo.PRACOWNIK.Id_stanowisko = dbo.STANOWISKO.Id_stanowisko", con);
            DataSet ds = new DataSet();
            da.Fill(ds, "PRACOWNIK");
            positionsList.DataSource = ds.Tables["PRACOWNIK"];
            positionsList.DataBind();
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
                SqlCommand cmd = new SqlCommand(@"delete from dbo.PRACOWNIK where Id_pracownik = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                var rows = cmd.ExecuteNonQuery();
                con.Close();

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