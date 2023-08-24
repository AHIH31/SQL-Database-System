using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MileS3.Login;

namespace MileS3
{
    public partial class Register_Fan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void NewFanSubmit_Link(object sender, EventArgs e)
        {
            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addF = new SqlCommand("addFan", conn);
            addF.CommandType = CommandType.StoredProcedure;

            String name = Name.Text.ToString();
            String user = Username.Text.ToString();
            String pass = Password.Text.ToString();
            String nid = NationalIdNumber.Text.ToString();
            String pn = PhoneNumber.Text.ToString();
            String bd = BirthDate.Text.ToString();
            String add = Address.Text.ToString();

            addF.Parameters.Add(new SqlParameter("@name", name));
            addF.Parameters.Add(new SqlParameter("@username", user));
            addF.Parameters.Add(new SqlParameter("@password ", pass));
            addF.Parameters.Add(new SqlParameter("@nationalID", nid));
            addF.Parameters.Add(new SqlParameter("@birthDate", bd));
            addF.Parameters.Add(new SqlParameter("@phone ", pn));
            addF.Parameters.Add(new SqlParameter("@address ", add));

            Globals.NationalId = nid;
            Globals.username = user;

            conn.Open();
            addF.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("FanHomePage.aspx");


        }
    }
}