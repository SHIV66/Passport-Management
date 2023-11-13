using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OfficerDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["uid"] == null)
        {
            Response.Redirect("/");
        }
        else
        {
            if(Session["officer"].ToString() != "1")
            {
                Session["uid"] = null;
                Response.Redirect("/");
            }
        }

        lblApproved.Text = ""+getApplicationCount("spCountApprovedApplications");
        lblPending.Text = ""+getApplicationCount("spCountPendingApplications");
        lblRejected.Text = ""+getApplicationCount("spCountRejectedApplications");

    }
    int getApplicationCount(string query)
    {
        int count = 0;
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            count = (int)cmd.ExecuteScalar();
        }

        return count;
    }
}