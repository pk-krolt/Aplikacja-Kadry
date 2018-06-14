using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SZRBD.Kadry;

namespace SZRBD.Kadry.Applications
{
    public partial class Holidays : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string login = HttpContext.Current.User.Identity. Name;
            string id_pracownik = Helper.GetEmployeeIdByEmail(login);

            if (id_pracownik != null)
            {
                bool isManager = HttpContext.Current.User.IsInRole(Consts.Roles.Administrator) || HttpContext.Current.User.IsInRole(Consts.Roles.Manager);

                var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);

                if (isManager)
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(@"select * from dbo.WNIOSEK_URLOP
                                                                  inner join dbo.PRACOWNIK on dbo.WNIOSEK_URLOP.Id_pracownik = dbo.PRACOWNIK.Id_pracownik
                                                                  where Status_urlop = 'Oczekuje'", con);
                    DataSet ds = new DataSet();
                    adapter.Fill(ds, "WNIOSEK_URLOP");

                    DataView dv1 = ds.Tables["WNIOSEK_URLOP"].AsDataView();
                    dv1.RowFilter = "Id_pracownik = '" + id_pracownik + "'";
                    MyHolidaysList.DataSource = dv1;
                    MyHolidaysList.DataBind();

                    DataView dv2 = ds.Tables["WNIOSEK_URLOP"].AsDataView();
                    dv2.RowFilter = "Id_pracownik <> '" + id_pracownik + "'";
                    EmployeesHolidaysList.DataSource = dv2;
                    EmployeesHolidaysList.DataBind();
                }
                else
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(@"select * from dbo.WNIOSEK_URLOP
                                                                  inner join dbo.PRACOWNIK on dbo.WNIOSEK_URLOP.Id_pracownik = dbo.PRACOWNIK.Id_pracownik
                                                                  where dbo.WNIOSEK_URLOP.Id_pracownik = @Id_pracownik", con);
                    adapter.SelectCommand.Parameters.AddWithValue("@Id_pracownik", id_pracownik);

                    DataSet ds = new DataSet();
                    adapter.Fill(ds, "WNIOSEK_URLOP");
                    MyHolidaysList.DataSource = ds.Tables["WNIOSEK_URLOP"];
                    MyHolidaysList.DataBind();
                }
            }
        }
    }
}