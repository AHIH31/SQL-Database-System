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
    public partial class SendHostRequestForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendHostRequest_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(Globals.connStr);
            string username = "'" + Globals.username + "'";
            SqlCommand cmd = new SqlCommand($"select * from getClubInfo({username})", conn);

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                Globals.ClubName = rdr["name"].ToString();
            }
            rdr.Close();
            String stadium = Stadium.Text.ToString();
            String start = Start.Text.ToString();

            SqlCommand sendReq = new SqlCommand("addHostRequest", conn);
            sendReq.CommandType = CommandType.StoredProcedure;
            sendReq.Parameters.Add(new SqlParameter("@cn", Globals.ClubName));
            sendReq.Parameters.Add(new SqlParameter("@sn", stadium));
            sendReq.Parameters.Add(new SqlParameter("@start", start));

            conn.Open();
            sendReq.ExecuteNonQuery();
            conn.Close();


        }
    }
}