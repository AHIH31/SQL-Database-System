﻿using System;
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
    public partial class ClubRep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ClubInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("ClubInfo.aspx");
        }

        protected void UpcomingMatches_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpcomingMatches.aspx");
        }

        protected void AvailableStadiums_Click(object sender, EventArgs e)
        {
            Response.Redirect("AvailableStadiumsInput.aspx");
        }

        protected void HostRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("SendHostRequestForm.aspx");
        }
    }
}