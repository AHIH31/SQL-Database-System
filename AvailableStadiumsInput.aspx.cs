using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static MileS3.Login;

namespace MileS3
{
    public partial class AvailableStadiumsInput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void availableStadiums_Click(object sender, EventArgs e)
        {
            Globals.availableStadiumsDate = TextBox1.Text.ToString();
            Response.Redirect("AvailableStadiums.aspx");
        }
    }
}