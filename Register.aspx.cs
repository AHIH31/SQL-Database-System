using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MileS3
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void regSAM_Click(object sender, EventArgs e)
        {

            Response.Redirect("RegisterSAM.aspx");
        }

        protected void regCR_Click(object sender, EventArgs e)
        {

            Response.Redirect("RegisterCR.aspx");
        }

        protected void regSM_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterSM.aspx");
        }

        protected void regF_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register Fan.aspx");
        }

    }
}