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
    public partial class AddAdvert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ListItem> positions = GetPositionsList();
            Position.Items.AddRange(positions.ToArray());
        }


        private List<ListItem> GetPositionsList()
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from dbo.STANOWISKO", con);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds, "STANOWISKO");

            var result = new List<ListItem>();
            foreach (DataRow row in ds.Tables["STANOWISKO"].Rows)
            {
                result.Add(new ListItem(row["Nazwa_stanowisko"].ToString(), row["Id_stanowisko"].ToString()));
            }

            return result;
        }


        protected void Add_Click(object sender, EventArgs e)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand(@"insert into dbo.OGLOSZENIE_STANOWISKO (Id_stanowisko, Nazwa_ogloszenie, Status_ogloszenie, Opis_ogloszenie, Data_poczatek)
                                            values (@Id_stanowisko, @Nazwa_ogloszenie, @Status_ogloszenie, @Opis_ogloszenie, @Data_poczatek)", con);

            cmd.Parameters.AddWithValue("@Id_stanowisko", Position.SelectedValue);
            cmd.Parameters.AddWithValue("@Nazwa_ogloszenie", Name.Text);
            cmd.Parameters.AddWithValue("@Status_ogloszenie", Status.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@Opis_ogloszenie", Description.Text);
            cmd.Parameters.AddWithValue("@Data_poczatek", DateTime.Today);

            int rows = cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Adverts.aspx");
        }
    }
}