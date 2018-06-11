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
    public partial class EditEmployee : System.Web.UI.Page
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
                    SqlDataAdapter dataAdapter = new SqlDataAdapter("select * from dbo.PRACOWNIK where Id_pracownik = @Id_pracownik", con);
                    dataAdapter.SelectCommand.Parameters.AddWithValue("@Id_pracownik", id);
                    DataSet ds = new DataSet();
                    dataAdapter.Fill(ds, "PRACOWNIK");

                    if (ds.Tables["PRACOWNIK"].Rows.Count > 0)
                    {
                        var row = ds.Tables["PRACOWNIK"].Rows[0];

                        DateTime date = DateTime.Parse(row["Data_urodzenia"].ToString());

                        EmployeeID.Value = row["Id_pracownik"].ToString();
                        Name.Text = row["Imie_pracownik"].ToString();
                        Surname.Text = row["Nazwisko_pracownik"].ToString();
                        Birthday.Text = date.ToString("yyyy-MM-dd");
                        PESEL.Text = row["PESEL"].ToString();
                        HolidayRest.Text = row["Urlop_wypoczynkowy"].ToString();
                        HolidayTraining.Text = row["Urlop_szkoleniowy"].ToString();
                        HolidayHealth.Text = row["Urlop_zdrowotny"].ToString();
                        HolidayMaternal.Text = row["Urlop_macierzynski"].ToString();
                        Email.Text = row["Email"].ToString();

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

            var result = new List<ListItem>();
            foreach(DataRow row in ds.Tables["STANOWISKO"].Rows)
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
            SqlCommand cmd = new SqlCommand(@"update dbo.PRACOWNIK set Imie_pracownik = @Imie_pracownik,
                                                                       Nazwisko_pracownik = @Nazwisko_pracownik,
                                                                       Data_urodzenia = @Data_urodzenia,
                                                                       PESEL = @PESEL,
                                                                       Urlop_wypoczynkowy = @Urlop_wypoczynkowy,
                                                                       Urlop_szkoleniowy = @Urlop_szkoleniowy,
                                                                       Urlop_zdrowotny = @Urlop_zdrowotny,
                                                                       Urlop_macierzynski = @Urlop_macierzynski,
                                                                       Email = @Email,
                                                                       Id_stanowisko = @Id_stanowisko
                                                                       where Id_pracownik = @Id", con);

            cmd.Parameters.AddWithValue("@Id", EmployeeID.Value);
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

            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("People.aspx");
        }
    }
}