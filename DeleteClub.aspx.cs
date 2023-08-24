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
    public partial class DeleteClub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DeleteClubSubmit_Click1(object sender, EventArgs e)
        {

            string connStr = Globals.connStr;
            Response.Write(connStr);
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand deleteClub = new SqlCommand("deleteClub", conn);
            deleteClub.CommandType = CommandType.StoredProcedure;
            deleteClub.Parameters.Add(new SqlParameter("@name", ClubName.Text));

            conn.Open();
            deleteClub.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }
    }
}