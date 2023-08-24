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
    public partial class NewMatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddMatch_Click(object sender, EventArgs e)
        {
            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand addM = new SqlCommand("addNewMatch", conn);
            addM.CommandType = CommandType.StoredProcedure;

            String hn = HostName.Text.ToString();
            String gn = GuestName.Text.ToString();
            String st = StartTime.Text.ToString();
            String et = EndTime.Text.ToString();

            addM.Parameters.Add(new SqlParameter("@host", hn));
            addM.Parameters.Add(new SqlParameter("@guest", gn));
            addM.Parameters.Add(new SqlParameter("@start", st));
            addM.Parameters.Add(new SqlParameter("@end", et));

            conn.Open();
            addM.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SAM.aspx");
        }

        protected void DeleteMatch_Click(object sender, EventArgs e)
        {
            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand deleteM = new SqlCommand("deleteMatch", conn);
            deleteM.CommandType = CommandType.StoredProcedure;

            String hn = HostName.Text.ToString();
            String gn = GuestName.Text.ToString();
            String st = StartTime.Text.ToString();
            String et = EndTime.Text.ToString();

            deleteM.Parameters.Add(new SqlParameter("@host", hn));
            deleteM.Parameters.Add(new SqlParameter("@guest", gn));
            deleteM.Parameters.Add(new SqlParameter("@st", st));
            deleteM.Parameters.Add(new SqlParameter("@et", et));

            conn.Open();
            deleteM.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("SAM.aspx");
        }
    }
}