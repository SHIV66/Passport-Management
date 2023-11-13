using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BotDetect;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["uid"] != null)
        {
            if(Session["officer"].ToString() == "1")
            {
                if(Session["privilege"].ToString() == "5")
                {
                    Response.Redirect("/admin/admin.aspx");
                }
                else
                {
                    Response.Redirect("/officer/officerdashboard.aspx");
                }
            }
            else
            {
                Response.Redirect("/applicant/applicantdashboard.aspx");
            }
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        bool isValidCaptcha = captchaBox.Validate(txtCaptcha.Text);
        

        if(Page.IsValid)
        {
            if (!isValidCaptcha)
            {

            }
            else
            {
                String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spNewUSer", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@firstname", txtFirstname.Text);
                    cmd.Parameters.AddWithValue("@lastname", txtLastname.Text);
                    cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        txtFirstname.Text = "";
                        txtLastname.Text = "";
                        txtEmail.Text = "";
                        txtUsername.Text = "";
                        txtPassword.Text = "";
                    }
                }

                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('User Registered Successfully');window.location.href='Default.aspx'", true);

            }
        }
        //ShowMessageAndRedirect("User Registered", "/Default.aspx");
    }

   // public static void ShowMessageAndRedirect(string message, string lpRedirectPage)
   // {
   //     string cleanMessage = message.Replace("'", "\'");
   //     Page page = HttpContext.Current.CurrentHandler as Page;
   //     string script = string.Format("alert('{0}');", cleanMessage);
   //     script += " window.location.href='" + lpRedirectPage + "';";
   //if (page != null && !page.ClientScript.IsClientScriptBlockRegistered("alert"))
   //     {
   //         page.ClientScript.RegisterClientScriptBlock(page.GetType(), "alert", script, true /* addScriptTags */);
   //     }
   // }

    protected void txtUsername_TextChanged(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spCheckUsername", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            con.Open();
            int i = (int)cmd.ExecuteScalar();
            if(i==0)
            {
                lblUsername.Visible = true;
                lblUsername.ForeColor = System.Drawing.Color.Green;
                lblUsername.Text = "Username is available";
            }
            else
            {
                lblUsername.Visible = true;
                lblUsername.ForeColor = System.Drawing.Color.Red;
                lblUsername.Text = "Username is not available";
            }
        }
    }




    //protected void valLastname_ServerValidate(object source, ServerValidateEventArgs args)
    //{
    //    RegexStringValidator r = new RegexStringValidator(@"^[\\p{L} .'-]+$");
    //    try
    //    {
    //        r.Validate(args.Value);
    //        args.IsValid = true;
    //    }
    //    catch (ArgumentException ee)
    //    {
    //        ee.Message.ToString();
    //        args.IsValid = false;
    //    }
    //}


    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spCheckUsername", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            con.Open();
            int i = (int)cmd.ExecuteScalar();
            if (i == 0)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}