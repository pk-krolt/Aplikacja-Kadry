using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SZRBD.Kadry.Job
{
    public partial class Advert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public Models.Advert GetItem([QueryString("ID")] int? Id)
        {
            Models.Advert item = new Models.Advert();

            if (Id != null)
            {
                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from dbo.OGLOSZENIE_STANOWISKO inner join dbo.STANOWISKO on dbo.OGLOSZENIE_STANOWISKO.Id_stanowisko = dbo.STANOWISKO.Id_stanowisko where Id_ogloszenie = '" + Id + "'", con);
                DataSet ds = new DataSet();
                dataAdapter.Fill(ds, "OGLOSZENIE_STANOWISKO");

                if (ds.Tables["OGLOSZENIE_STANOWISKO"].Rows.Count > 0)
                {
                    var row = ds.Tables["OGLOSZENIE_STANOWISKO"].Rows[0];

                    item.Name = row["Nazwa_ogloszenie"].ToString();
                    item.Description = row["Opis_ogloszenie"].ToString();
                    item.Created = row["Data_poczatek"].ToString();
                    item.Status = row["Status_ogloszenie"].ToString();
                    item.Department = row["Dzial"].ToString();
                }
            }

            return item;
        }

        protected void Send_Click(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"] as string;

            if(id != null)
            {
                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd = new SqlCommand(@"insert into dbo.WNIOSEK_ZATRUDNIENIE (Id_ogloszenie, Imie_aplikant, Nazwisko_aplikant, Telefon, Email, Dodatkowy_opis, Plik_CV, Data_wniosku, Status)
                                            values (@Id_ogloszenie, @Imie_aplikant, @Nazwisko_aplikant, @Telefon, @Email, @Dodatkowy_opis, @Plik_CV, @Data_wniosku, @Status)", con);

                cmd.Parameters.AddWithValue("@Id_ogloszenie", id);
                cmd.Parameters.AddWithValue("@Imie_aplikant", Name.Text);
                cmd.Parameters.AddWithValue("@Nazwisko_aplikant", Surname.Text);
                cmd.Parameters.AddWithValue("@Telefon", Phone.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);
                cmd.Parameters.AddWithValue("@Dodatkowy_opis", Message.Text);
                cmd.Parameters.AddWithValue("@Plik_CV", CV.FileBytes);
                cmd.Parameters.AddWithValue("@Data_wniosku", DateTime.Today);
                cmd.Parameters.AddWithValue("@Status", "Oczekuje");

                int rows = cmd.ExecuteNonQuery();
                con.Close();

                MessageLabel.Text = "Twoje zgłoszenie zostało wysłane pomyślnie";
                MessageLabel.ForeColor = Color.DarkGreen;
                Name.Text = String.Empty;
                Surname.Text = String.Empty;
                Phone.Text = String.Empty;
                Email.Text = String.Empty;
                Message.Text = String.Empty;
            }
        }
    }
}