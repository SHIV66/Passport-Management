using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OfficerLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        int output = -1;
        int oid = -1;
        String username = txtUsername.Text;
        String password = txtPassword.Text;
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spOfficerLogin", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);
            con.Open();
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            while(dr.Read())
            {
                output = (int)dr[1];
                oid = (int)dr[0];
            }
           // int output = (int)cmd.ExecuteScalar();
            test.Text = output.ToString();
            if (output != -1)
            {
                Session["uid"] = output;
                System.Diagnostics.Debug.WriteLine("output uid - " +output);
                System.Diagnostics.Debug.WriteLine("output oid - " +oid);
                using (SqlConnection con1 = new SqlConnection(cs))
                {
                    SqlCommand cmd1 = new SqlCommand("spOfficerPrivilege", con1);
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@id", oid);
                    con1.Open();
                    int output1 = (int)cmd1.ExecuteScalar();
                    Session["privilege"] = output1;
                    if(output1 == 5)
                    {
                        Session["officer"] = 2;
                        Response.Redirect("/Admin/Admin.aspx");
                    }
                    else
                    {
                        Session["officer"] = 1;
                        Response.Redirect("/Officer/OfficerDashboard.aspx");
                    }
                }
            }
        }
    }
}