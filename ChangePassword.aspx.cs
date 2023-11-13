using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string pmdb = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(pmdb))
        {
            SqlCommand cmd = new SqlCommand("spPasswordCheck", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@password", txtOldPassword.Text);
            cmd.Parameters.AddWithValue("@id", Session["uid"]);
            con.Open();
            int output = (int)cmd.ExecuteScalar();
            //test.Text = output.ToString();
            if (output == -1)
            {
                args.IsValid = false;
            }
            else
            {
               // Session["uid"] = output;
                if (Session["officer"].ToString() == "0")
                    Response.Redirect("/Applicant/ApplicantDashboard.aspx");
                else
                    Response.Redirect("/Officer/OfficerDashboard.aspx");
            }
        }
    }
}