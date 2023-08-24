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
    public partial class ClubInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Globals.connStr = WebConfigurationManager.ConnectionStrings["MileS2"].ToString();
            SqlConnection conn = new SqlConnection(Globals.connStr);
            string username = "'" + Globals.username + "'";
            SqlCommand cmd = new SqlCommand($"select * from getClubInfo({username})", conn);

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string c_name = "Club Name: " + rdr["name"].ToString() + " ";
                string loc = "Club Location: " + rdr["location"].ToString() + " ";
                ClubName.Text = c_name;
                Location.Text = loc;
            }
            conn.Close();



        }
    }
}