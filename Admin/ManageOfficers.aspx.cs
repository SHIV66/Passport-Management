using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageOfficers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("/");
        }
        else
        {
            if (Session["officer"].ToString() != "2")
            {
                Session["uid"] = null;
                Response.Redirect("/");
            }
        }
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spDisplayOfficers", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvOfficerList.DataSource = dt;
            gvOfficerList.DataBind();
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spNewOfficer", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@firstname", txtFname.Text);
                cmd.Parameters.AddWithValue("@lastname", txtLname.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@level", ddLevel.SelectedValue);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                con.Open();
                int i = cmd.ExecuteNonQuery();
                if (i != 0)
                {
                    txtFname.Text = "";
                    txtLname.Text = "";
                    txtEmail.Text = "";
                    txtUsername.Text = "";
                    txtPassword.Text = "";
                }
            }
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Officer Registered Successfully');location.reload();", true);
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spDisplayOfficers", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                gvOfficerList.DataSource = dt;
                gvOfficerList.DataBind();
            }
        }

    }

    protected void gvOfficerList_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spUserToggle", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", e.CommandArgument.ToString());
            con.Open();
            cmd.ExecuteNonQuery();
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Officer status changed');location.reload();", true);
        }


        //Response.Redirect("EmgContact.aspx?id=" + commandArgs[1]);
    }

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
            if (i == 0)
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

    protected void gvOfficerList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hiddenField = (HiddenField)e.Row.FindControl("HiddenField2");
            LinkButton LinkButton1 = (LinkButton)e.Row.FindControl("LinkButton1");
            System.Diagnostics.Debug.WriteLine("" + hiddenField.Value);
            //Label lblStatus = (Label)e.Row.FindControl("lblStatus");
            if (hiddenField.Value == "enabled")
            {
                LinkButton1.Text = "Disable";
            }
            else if (hiddenField.Value == "disabled")
            {
                LinkButton1.Text = "Enable";
            }
        }

    }
}