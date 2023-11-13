using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApplicantLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["uid"] != null)
        {
            Response.Redirect("/Applicant/ApplicantDashboard.aspx");
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        bool isValidCaptcha = captchaBox.Validate(txtCaptcha.Text);
        if (!isValidCaptcha)
        {
            Label1.Text = "Captcha Failed";
        }
        else
        {

            String username = txtUsername.Text;
            String password = txtPassword.Text;
            String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spLogin", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password);
                con.Open();
                int output = (int)cmd.ExecuteScalar();
                test.Text = output.ToString();
                if (output != -1)
                {
                    Session["uid"] = output;
                    Session["officer"] = 0;
                    Response.Redirect("/Applicant/ApplicantDashboard.aspx");

                }
            }
        }

    }
}