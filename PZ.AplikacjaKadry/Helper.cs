using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SZRBD.Kadry
{
    static public class Helper
    {

        static public string GetEmployeeIdByEmail(string email)
        {
            var constr = System.Configuration.ConfigurationManager.ConnectionStrings["KadryConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);

            SqlDataAdapter dataAdapter = new SqlDataAdapter(@"select * from dbo.PRACOWNIK where Email = @Email", con);
            dataAdapter.SelectCommand.Parameters.AddWithValue("@Email", email);
            DataSet ds = new DataSet();
            dataAdapter.Fill(ds, "PRACOWNIK");

            if (ds.Tables["PRACOWNIK"].Rows.Count > 0)
            {
                var row = ds.Tables["PRACOWNIK"].Rows[0];
                var id_pracownik = row["Id_pracownik"]?.ToString();

                return id_pracownik;
            }
            else
            {
                return null;
            }
        }
    }

    static public class Consts
    {
        static public class Roles
        {
            static public string Administrator = "Administrator";
            static public string Manager = "Manager";
            static public string Worker = "Worker";
            static public string Applicant = "Applicant";
        }
    }
}