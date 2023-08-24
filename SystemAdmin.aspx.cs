using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MileS3
{
    public partial class SystemAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddNewClub(object sender, EventArgs e)
        {
            Response.Redirect("addNewClub.aspx");
        }
        protected void DeleteClub(object sender, EventArgs e)
        {
            Response.Redirect("DeleteClub.aspx");
        }
        protected void AddNewStadium(object sender, EventArgs e)
        {
            Response.Redirect("AddNewStadium.aspx");
        }
        protected void DeleteStadium(object sender, EventArgs e)
        {
            Response.Redirect("DeleteStadium.aspx");
        }
        protected void BlockFan(object sender, EventArgs e)
        {
            Response.Redirect("BlockFan.aspx");
        }
    }
}