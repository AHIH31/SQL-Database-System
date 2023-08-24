using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MileS3.Login;

namespace MileS3
{
    public partial class RegisterSAM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            
            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addSAM = new SqlCommand("addAssociationManager", conn);
            addSAM.CommandType = CommandType.StoredProcedure;

            String na = name.Text.ToString();
            String user = un.Text.ToString();
            Globals.username = user;
            String pass = ps.Text.ToString();

            addSAM.Parameters.Add(new SqlParameter("@name", na));
            addSAM.Parameters.Add(new SqlParameter("@username", user));
            addSAM.Parameters.Add(new SqlParameter("@password", pass));

            conn.Open();
            addSAM.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SAM.aspx");
        }
    }
}