using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MileS3.Login;

namespace MileS3
{
    public partial class FanHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewMatches_Link(object sender, EventArgs e)
        {
            string connStr = Globals.connStr;
            Response.Redirect("Fan.aspx");

        }
        protected void PurchaseTicket_Link(object sender, EventArgs e)
        {
            string connStr = Globals.connStr;
            Response.Redirect("PurchaseTicket.aspx");

        }
    }
}