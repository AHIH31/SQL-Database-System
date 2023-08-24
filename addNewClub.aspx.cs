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
    public partial class addNewClub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void NewClubSubmit_Click(object sender, EventArgs e)
        {

            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addC = new SqlCommand("addClub", conn);
            addC.CommandType = CommandType.StoredProcedure;

            String na = ClubName.Text.ToString();
            String loc = Location.Text.ToString();   
            
            addC.Parameters.Add(new SqlParameter("@cn", na));
            addC.Parameters.Add(new SqlParameter("@cl", loc));

            conn.Open();
            addC.ExecuteNonQuery();
            conn.Close();


        }
    }
}