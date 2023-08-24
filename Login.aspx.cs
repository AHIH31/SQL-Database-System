using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MileS3

{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static class Globals
        {
            public static string connStr;
            public static string username;
            public static string ClubName;
            public static string availableStadiumsDate;
            public static string NationalId;
            public static string StartTimeAllMatches;
            public static string type = "";
            public static string fanType;
            public static string TicketStatus;
            public static string passStatus;    
        }
        public void login(object sender, EventArgs e)
        {
            Globals.connStr = WebConfigurationManager.ConnectionStrings["MileS2"].ToString();
            SqlConnection conn = new SqlConnection(Globals.connStr);
            Globals.username = username.Text;
            string Username = "'" + Globals.username + "'";
            string passwordd = password.Text;
            string pass = "'" + passwordd + "'";
            conn.Open();

            SqlCommand cmd = new SqlCommand($"select dbo.checkuser({Username}) as c", conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                Globals.type = rdr["c"].ToString();
            }
            rdr.Close();
            if (Globals.type.Equals("6"))
            {
                Response.Write("Username does not exist!");
            }
            else
            {
                SqlCommand cmd3 = new SqlCommand($"select dbo.checkpass({Username},{pass}) as c", conn);
                SqlDataReader rdr3 = cmd3.ExecuteReader();
                while (rdr3.Read())
                {
                    Globals.passStatus = rdr3["c"].ToString();
                }
                rdr3.Close();


                SqlCommand cmd2 = new SqlCommand($"select dbo.checkFan({Username}) as c", conn);
                SqlDataReader rdr2 = cmd2.ExecuteReader();
                while (rdr2.Read())
                {
                    Globals.fanType = rdr2["c"].ToString();
                }
                rdr2.Close();


                        switch (Globals.type)
                        {
                            case "1":
                        switch (Globals.passStatus)
                        {
                            case "1":
                                Response.Redirect("SystemAdmin.aspx");
                                break;
                            case "0":
                                Response.Write("Please enter a valid password");
                                break;
                        }
                        break;
                            case "2":
                        switch (Globals.passStatus)
                        {
                            case "1":
                                Response.Redirect("ClubRep.aspx");
                                break;
                            case "0":
                                Response.Write("Please enter a valid password");
                                break;

                        }
                        break;
                                    case "3":
                                if (Globals.fanType.Equals("1"))
                                {
                                    Response.Redirect("FanHomePage.aspx");
                                }
                                else
                                {
                                    Response.Write("YOU ARE BANNED");
                                }
                                break;
                            case "4":
                                        switch (Globals.passStatus)
                                        {
                                            case "1":
                                                Response.Redirect("SAM.aspx");
                                                break;
                                            case "0":
                                                Response.Write("Please enter a valid password");
                                                break;
                                        }
                        break;
                        case "5":
                        
                            switch (Globals.passStatus)
                            {
                                case "1":
                                    Response.Redirect("SM.aspx");
                                    break;
                                case "0":
                                    Response.Write("Please enter a valid password");
                                    break;
                            }
                        break;
                                        case "6":
                                                        Response.Write("User does not Exist!");
                                                        break;
                                                
                                                break;
                                        }
                }
                conn.Close();

            

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Globals.connStr = WebConfigurationManager.ConnectionStrings["MileS2"].ToString();
            Response.Redirect("Register.aspx");
        }
    }
}