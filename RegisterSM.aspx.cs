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
    public partial class RegisterSM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // a) Register with a name, username, a password and a name of an already existing stadium.


        }
        protected void manager_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(Globals.connStr);

            String name = managerName.Text.ToString();
            String username = managerUsername.Text.ToString();
            String stadium = managerStadium.Text.ToString();
            String password = managerPassword.Text.ToString();
            Globals.username = username;
            SqlCommand addManager = new SqlCommand("addStadiumManager", conn);
            addManager.CommandType = CommandType.StoredProcedure;
            addManager.Parameters.Add(new SqlParameter("@stadiumManagerName", name));
            addManager.Parameters.Add(new SqlParameter("@stadiumName", stadium));
            addManager.Parameters.Add(new SqlParameter("@username", username));
            addManager.Parameters.Add(new SqlParameter("@password", password));

            conn.Open();
            addManager.ExecuteNonQuery();
            conn.Close();



        }
    }
}