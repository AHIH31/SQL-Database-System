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
    public partial class AddNewStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddStadiumSubmit_Click(object sender, EventArgs e)
        {
            string connStr = Globals.connStr;
            SqlConnection conn = new SqlConnection(connStr);

            String n = sName.Text.ToString();
            String l = sLocation.Text.ToString();
            int c = Int16.Parse(sCapacity.Text);
            SqlCommand addS = new SqlCommand("addStadium", conn);
            addS.CommandType = CommandType.StoredProcedure;

            addS.Parameters.Add(new SqlParameter("@name", n));
            addS.Parameters.Add(new SqlParameter("@location", l));
            addS.Parameters.Add(new SqlParameter("@capacity", c));

            conn.Open();
            addS.ExecuteNonQuery();
            conn.Close();
        }
    }
}