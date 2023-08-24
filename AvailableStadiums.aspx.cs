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
    public partial class AvailableStadiums : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Globals.connStr = WebConfigurationManager.ConnectionStrings["MileS2"].ToString();
            SqlConnection conn = new SqlConnection(Globals.connStr);
            string date = "'" + Globals.availableStadiumsDate + "'";
            SqlDataAdapter SqlDa = new SqlDataAdapter($"select * from viewAvailableStadiumsOn({date})", conn);
            DataTable dtbl = new DataTable();
            SqlDa.Fill(dtbl);
            GridView.DataSource = dtbl;
            GridView.DataBind();
            conn.Close();
        }
    }
}