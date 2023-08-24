using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MileS3.Login;

namespace MileS3
{
    public partial class SM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Globals.connStr = WebConfigurationManager.ConnectionStrings["MileS2"].ToString();
            SqlConnection conn = new SqlConnection(Globals.connStr);
            string username = "'" + Globals.username + "'";
            conn.Open();
            SqlDataAdapter SqlDa = new SqlDataAdapter($"select * from getStadiumDetails({username})", conn);
           SqlDataAdapter SqlDa1 = new SqlDataAdapter($"select * from getRequestDetails({username})", conn);

            DataTable dtbl = new DataTable();
            DataTable dtbl1 = new DataTable();

            SqlDa.Fill(dtbl);
           SqlDa1.Fill(dtbl1);

            gridRequestDetails.DataSource = dtbl1;
            gridRequestDetails.DataBind();
            gridStaidumDetails.DataSource = dtbl;
            gridStaidumDetails.DataBind();
           
            conn.Close();
        }

        protected void acceptBtn_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = new SqlConnection(Globals.connStr);


            String hostNameInput = hostName.Text;
            String guestNameInput = guestName.Text;
            String startTimeInput = startTime.Text;

            SqlCommand accept = new SqlCommand("acceptRequest", conn);
            accept.CommandType = CommandType.StoredProcedure;
            accept.Parameters.Add(new SqlParameter("@smun", Globals.username));
            accept.Parameters.Add(new SqlParameter("@hcn", hostNameInput));
            accept.Parameters.Add(new SqlParameter("@gcn", guestNameInput));
            accept.Parameters.Add(new SqlParameter("@st", startTimeInput));

            conn.Open();
            accept.ExecuteNonQuery();
            conn.Close();
        }

        protected void rejBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(Globals.connStr);


            String hostNameInput = hostName.Text;
            String guestNameInput = guestName.Text;
            String startTimeInput = startTime.Text;

            SqlCommand reject = new SqlCommand("rejectRequest", conn);
            reject.CommandType = CommandType.StoredProcedure;
            reject.Parameters.Add(new SqlParameter("@smun", Globals.username));
            reject.Parameters.Add(new SqlParameter("@hcn", hostNameInput));
            reject.Parameters.Add(new SqlParameter("@gcn", guestNameInput));
            reject.Parameters.Add(new SqlParameter("@st", startTimeInput));

            conn.Open();
            reject.ExecuteNonQuery();
            conn.Close();

        }

    }
}




