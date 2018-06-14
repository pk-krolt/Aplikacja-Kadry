using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SZRBD.Kadry.Applications
{
    public partial class DispEmplRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public Models.EmploymentRequest GetItem([QueryString("ID")] int? Id)
        {
            Models.EmploymentRequest item = new Models.EmploymentRequest();

            if (Id != null)
            {
                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from dbo.WNIOSEK_ZATRUDNIENIE inner join dbo.OGLOSZENIE_STANOWISKO on dbo.WNIOSEK_ZATRUDNIENIE.Id_ogloszenie = dbo.OGLOSZENIE_STANOWISKO.Id_ogloszenie where Id_aplikacja = @Id_aplikacja", con);
                dataAdapter.SelectCommand.Parameters.AddWithValue("@Id_aplikacja", Id);
                DataSet ds = new DataSet();
                dataAdapter.Fill(ds, "WNIOSEK_ZATRUDNIENIE");

                if (ds.Tables["WNIOSEK_ZATRUDNIENIE"].Rows.Count > 0)
                {
                    var row = ds.Tables["WNIOSEK_ZATRUDNIENIE"].Rows[0];

                    item.AdvertName = row["Nazwa_ogloszenie"].ToString();
                    item.AdvertLink = "/Job/Advert.aspx?ID=" + row["Id_ogloszenie"].ToString();
                    item.Name = row["Imie_aplikant"].ToString();
                    item.Surname = row["Nazwisko_aplikant"].ToString();
                    item.Date = row["Data_wniosku"].ToString();
                    item.Phone = row["Telefon"].ToString();
                    item.Email = row["Email"].ToString();
                    item.Status = row["Status"].ToString();

                    if(!String.IsNullOrEmpty(row["Feedback"].ToString()))
                    {
                        YourAnswerBox.Text = row["Feedback"].ToString();
                        YourAnswerBox.Enabled = false;
                    }

                    if(row["Status"].ToString() != "Oczekuje")
                    {
                        Accept.Visible = false;
                        Decline.Visible = false;
                    }
                    
                }
            }
            
            return item;
        }

        protected void Accept_Click(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];

            if (id != null)
            {
                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                SqlCommand cmd = new SqlCommand(@"update dbo.WNIOSEK_ZATRUDNIENIE set Status = @Status,
                                                                                      Feedback = @Feedback
                                                                                      where Id_aplikacja = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Status", "Zaakceptowano");
                cmd.Parameters.AddWithValue("@Feedback", YourAnswerBox.Text);
                cmd.ExecuteNonQuery();
                con.Close();

                //Send email
                if (YourAnswerBox.Text != null)
                {

                }

                Response.Redirect("Employment.aspx");
            }
        }

        protected void Decline_Click(object sender, EventArgs e)
        {
            var id = Request.QueryString["ID"];

            if(id != null)
            {
                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd = new SqlCommand(@"update dbo.WNIOSEK_ZATRUDNIENIE  set Status = @Status
                                                                                   where Id_aplikacja = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Status", "Odrzucony");
                cmd.ExecuteNonQuery();

                Response.Redirect("Employment.aspx");
            }
        }
    }
}