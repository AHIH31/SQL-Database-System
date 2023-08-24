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
    public partial class SAM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addNewMatch_Click(object sender, EventArgs e)
        {

            Response.Redirect("NewMatch.aspx");

        }

        protected void viewUpcomingMatches_Click(object sender, EventArgs e)
        {
            Response.Redirect("SAMViewUpcomingMatches.aspx");

        }

        protected void viewPair_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewPairsNeverPlayed.aspx");
        }

        protected void viewPlayedMatches_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewPlayedMatches.aspx");
        }
    }
}