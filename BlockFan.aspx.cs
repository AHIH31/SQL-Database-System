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
    public partial class BlockFan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
       

        protected void blockF_Click(object sender, EventArgs e)
        {

            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand blockF = new SqlCommand("blockFan", conn);
            blockF.CommandType = CommandType.StoredProcedure;
            blockF.Parameters.Add(new SqlParameter("@nationalID", nationalID.Text));

            conn.Open();
            blockF.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Login.aspx");
        }
    }
}