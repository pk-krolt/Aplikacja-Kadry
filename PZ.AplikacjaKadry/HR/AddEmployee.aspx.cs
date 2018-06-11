using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SZRBD.Kadry.Models;

namespace SZRBD.Kadry.HR
{
    public partial class AddEmployee : System.Web.UI.Page
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
            IdentityResult result = CreateUser(Email.Text, Password.Text);
            if(result.Succeeded)
            {
                //CREATE PRACOWNIK
                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                SqlCommand cmd = new SqlCommand(@"insert into dbo.PRACOWNIK (Id_stanowisko, Imie_pracownik, Nazwisko_pracownik, Data_urodzenia, PESEL, Urlop_wypoczynkowy, Urlop_szkoleniowy, Urlop_zdrowotny, Urlop_macierzynski, Email)
                                                  values (@Id_stanowisko, @Imie_pracownik, @Nazwisko_pracownik, @Data_urodzenia, @PESEL, @Urlop_wypoczynkowy, @Urlop_szkoleniowy, @Urlop_zdrowotny, @Urlop_macierzynski, @Email);
                                                  select SCOPE_IDENTITY();", con);

                cmd.Parameters.AddWithValue("@Id_stanowisko", Position.SelectedValue);
                cmd.Parameters.AddWithValue("@Imie_pracownik", Name.Text);
                cmd.Parameters.AddWithValue("@Nazwisko_pracownik", Surname.Text);
                cmd.Parameters.AddWithValue("@Data_urodzenia", Birthday.Text);
                cmd.Parameters.AddWithValue("@PESEL", PESEL.Text);
                cmd.Parameters.AddWithValue("@Urlop_wypoczynkowy", HolidayRest.Text);
                cmd.Parameters.AddWithValue("@Urlop_szkoleniowy", HolidayTraining.Text);
                cmd.Parameters.AddWithValue("@Urlop_zdrowotny", HolidayHealth.Text);
                cmd.Parameters.AddWithValue("@Urlop_macierzynski", HolidayMaternal.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);

                decimal id_pracownik = (decimal)cmd.ExecuteScalar();
                con.Close();


                //UPDATE USER ENTRY

                constr = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                con = new SqlConnection(constr);
                con.Open();
                cmd = new SqlCommand(@"update dbo.AspNetUsers set Id_pracownik = @Id_pracownik output INSERTED.Id where Email = @Email", con);
                cmd.Parameters.AddWithValue("@Id_pracownik", id_pracownik);
                cmd.Parameters.AddWithValue("@Email", Email.Text);
                string userID = cmd.ExecuteScalar()?.ToString();

                //SET USER ROLE
                cmd = new SqlCommand(@"insert into dbo.AspNetUserRoles (UserId, RoleId) values (@UserId, @RoleId)", con);
                cmd.Parameters.AddWithValue("@UserId", userID);
                cmd.Parameters.AddWithValue("@RoleId", 3);
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("People.aspx");
            }
            else
            {
                foreach(var error in result.Errors)
                {
                    FailureText.Text += error + "\n";
                }
                ErrorMessage.Visible = true;
            }

        
        }

        private IdentityResult CreateUser(string email, string password)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            return result;
        }
    }
}