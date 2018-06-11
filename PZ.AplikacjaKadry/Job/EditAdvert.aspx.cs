using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SZRBD.Kadry.Job
{
    public partial class EditAdvert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var id = Request.QueryString["ID"] as string;
                if (id != null)
                {
                    var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                    SqlConnection con = new SqlConnection(constr);
                    SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from dbo.OGLOSZENIE_STANOWISKO where Id_ogloszenie = @Id_ogloszenie", con);
                    dataAdapter.SelectCommand.Parameters.AddWithValue("@Id_ogloszenie", id);
                    DataSet ds = new DataSet();
                    dataAdapter.Fill(ds, "OGLOSZENIE_STANOWISKO");

                    if (ds.Tables["OGLOSZENIE_STANOWISKO"].Rows.Count > 0)
                    {
                        var row = ds.Tables["OGLOSZENIE_STANOWISKO"].Rows[0];

                        AdvertID.Value = row["Id_ogloszenie"].ToString();
                        Name.Text = row["Nazwa_ogloszenie"].ToString();
                        Description.Text = row["Opis_ogloszenie"].ToString();

                        Status.SelectedValue = row["Status_ogloszenie"].ToString();
                        List<ListItem> positions = GetPositionsList();
                        Position.Items.AddRange(positions.ToArray());
                        Position.SelectedValue = Position.Items.FindByValue(row["Id_stanowisko"].ToString()).Value;
                    }
                }
            }
        }

        private List<ListItem> GetPositionsList()
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from dbo.STANOWISKO", con);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds, "STANOWISKO");
            con.Close();

            var result = new List<ListItem>();
            foreach (DataRow row in ds.Tables["STANOWISKO"].Rows)
            {
                result.Add(new ListItem(row["Nazwa_stanowisko"].ToString(), row["Id_stanowisko"].ToString()));
            }

            return result;
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"update dbo.OGLOSZENIE_STANOWISKO set Id_stanowisko = @Id_stanowisko,
                                                                                   Nazwa_ogloszenie = @Nazwa_ogloszenie,
                                                                                   Opis_ogloszenie = @Opis_ogloszenie,
                                                                                   Status_ogloszenie = @Status_ogloszenie
                                                                                   where Id_ogloszenie = @Id", con);

            cmd.Parameters.AddWithValue("@Id", AdvertID.Value);
            cmd.Parameters.AddWithValue("@Id_stanowisko", Position.SelectedValue);
            cmd.Parameters.AddWithValue("@Nazwa_ogloszenie", Name.Text);
            cmd.Parameters.AddWithValue("@Opis_ogloszenie", Description.Text);
            cmd.Parameters.AddWithValue("@Status_ogloszenie", Status.SelectedItem.Text);

            cmd.ExecuteNonQuery();

            Response.Redirect("Adverts.aspx");
        }
    }
}