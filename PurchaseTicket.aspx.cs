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
    public partial class PurchaseTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PurchaseTicket_Link(object sender, EventArgs e)
        {
            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand purchase = new SqlCommand("purchaseTicket", conn);
            purchase.CommandType = CommandType.StoredProcedure;

            string username = "'" + Globals.username + "'";
            SqlCommand cmd = new SqlCommand($"select * from getNationalId({username})", conn);

            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Globals.NationalId = rdr["national_ID"].ToString();
            }
            rdr.Close();
            String hostclubname = Host_Club_Name.Text.ToString();
            String guestclubname = Guest_Club_Name.Text.ToString();
            String starttime = StartTime.Text.ToString();
            String nationalid = Globals.NationalId;

            purchase.Parameters.Add(new SqlParameter("@nationalID", nationalid));
            purchase.Parameters.Add(new SqlParameter("@host", hostclubname));
            purchase.Parameters.Add(new SqlParameter("@guest", guestclubname));
            purchase.Parameters.Add(new SqlParameter("@start", starttime));

            string host = "'" + hostclubname + "'";
            string guest = "'" + guestclubname + "'";
            string start = "'" + starttime + "'";
            SqlCommand cmd2 = new SqlCommand($"select dbo.checkTicketStatus({host},{guest},{start}) as c", conn);
            
            SqlDataReader rdr3 = cmd2.ExecuteReader();
            while (rdr3.Read())
            {
                Globals.TicketStatus = rdr3["c"].ToString();
            }
            rdr3.Close();
            if (Globals.TicketStatus.Equals("1")){
                
                Response.Write("Done");
                SqlDataReader rdr2 = purchase.ExecuteReader();
                rdr2.Close();
            }
            else
            {
                Response.Write("Sorry, tickets for this match are sold out");
            }
            conn.Close();
        }
    }
}