using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        lblDate.Text = DateTime.Now.ToString("dddd, dd MMMM yyyy HH:mm:ss");
        if (Session["uid"] == null)
        {
            
            lblLoginStatus.Text = "<a href=\"\\ApplicantLogin.aspx\">Login</a>";
            btnLogout.Visible = false;
        }
        else
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetusername", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", Session["uid"]);
                SqlParameter outparameter = new SqlParameter("@username", System.Data.SqlDbType.VarChar, 255) { Direction = System.Data.ParameterDirection.Output};
               
                con.Open();
                cmd.Parameters.Add(outparameter);
                cmd.ExecuteNonQuery();
                string username = outparameter.Value.ToString();
                lblLoginStatus.Text = "Welcome <a href=\"#\">"+username+ "</a> &nbsp; | &nbsp;  ";
                lblLoginStatus.ForeColor = System.Drawing.Color.BlanchedAlmond;
                btnLogout.Visible = true;

            }
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Session["officer"] = null;
        Session["privilege"] = null;
        Response.Redirect("/");
    }

    protected void lbtnHome_Click(object sender, EventArgs e)
    {
        if (Session["uid"] != null)
        {
            if (Session["officer"] != null && Session["privilege"] != null)
            {
                Response.Redirect("/Officer/OfficerDashboard.aspx");
            }
            else
            {
                Response.Redirect("/Applicant/ApplicantDashboard.aspx");
            }
        }
        else
        {
            Response.Redirect("/Default.aspx");
        }
            

    }
}
