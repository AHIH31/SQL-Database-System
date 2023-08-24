using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MileS3.Login;

namespace MileS3
{
    public partial class ViewPairsNeverPlayed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Globals.connStr = WebConfigurationManager.ConnectionStrings["MileS2"].ToString();
            SqlConnection conn = new SqlConnection(Globals.connStr);
            conn.Open();
            string sql = "SELECT * from dbo.clubsNeverPlayedEachOther";
            SqlCommand cmd = new SqlCommand(sql, conn);
            GridView.DataBind();
            conn.Close();
        }
    }
}