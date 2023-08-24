using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MileS3.Login;

namespace MileS3
{
    public partial class Fan1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewAllMatches_Click(object sender, EventArgs e)
        {
            string connstr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connstr);
            Globals.StartTimeAllMatches = Time.Text.ToString();
            Response.Redirect("ViewAllMatches2.aspx");

        }
    }
}