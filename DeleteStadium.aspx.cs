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
    public partial class DeleteStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void deleteS_Click(object sender, EventArgs e)
        {

            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand deleteS = new SqlCommand("deleteStadium", conn);
            deleteS.CommandType = CommandType.StoredProcedure;
            deleteS.Parameters.Add(new SqlParameter("@name", StadiumName.Text));

            conn.Open();
            deleteS.ExecuteNonQuery();
            conn.Close();
            Response.Write("Kosom fograk yahaysom");
            Response.Redirect("Login.aspx");
           
        }
    }
}