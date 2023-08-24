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
    public partial class RegisterCR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(Globals.connStr);

            String na = name.Text.ToString();
            String user = username.Text.ToString();
            Globals.username = user;
            String pass = password.Text.ToString();
            String cn = clubName.Text.ToString();


            SqlCommand addRep = new SqlCommand("addRepresentative", conn);
            addRep.CommandType = CommandType.StoredProcedure;
            addRep.Parameters.Add(new SqlParameter("@name", na));
            addRep.Parameters.Add(new SqlParameter("@club_name", cn));
            addRep.Parameters.Add(new SqlParameter("@username", user));
            addRep.Parameters.Add(new SqlParameter("@password", pass));

            conn.Open();
            addRep.ExecuteNonQuery();
            conn.Close();

            //mResponse.Write("Done");


        }
    }
}