using Microsoft.Owin;
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
    public partial class EditPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var id = Request.QueryString["ID"] as string;
                if (id != null)
                {
                    var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(constr);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from dbo.STANOWISKO where Id_stanowisko = '" + id + "'", con);
                    DataSet ds = new DataSet();
                    dataAdapter.Fill(ds, "STANOWISKO");

                    if (ds.Tables["STANOWISKO"].Rows.Count > 0)
                    {
                        var row = ds.Tables["STANOWISKO"].Rows[0];

                        PositionID.Value = row["Id_stanowisko"].ToString();
                        Name.Text = row["Nazwa_stanowisko"].ToString();
                        Department.SelectedValue = Department.Items.FindByText(row["Dzial"].ToString()).Value;
                    }
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"update dbo.STANOWISKO set Nazwa_stanowisko = @Nazwa_stanowisko,
                                                                        Dzial = @Dzial
                                                                        where Id_stanowisko = @Id", con);
            cmd.Parameters.AddWithValue("@Id", PositionID.Value);
            cmd.Parameters.AddWithValue("@Nazwa_stanowisko", Name.Text);
            cmd.Parameters.AddWithValue("@Dzial", Department.SelectedItem.Text);

            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Positions.aspx");
        }
    }
}