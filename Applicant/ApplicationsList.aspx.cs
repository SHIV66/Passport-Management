using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_ApplicationsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("/");
        }
        else
        {
            if (Session["officer"].ToString() != "0")
            {
                Session["uid"] = null;
                Response.Redirect("/");
            }
        }
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string userid = Session["uid"].ToString();
            SqlCommand cmd = new SqlCommand("spAplnList", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", userid);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvApplicationList.DataSource = dt;
            gvApplicationList.DataBind();

        }
    }



    protected void gvApplicationList_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
        System.Diagnostics.Debug.WriteLine("stage = " + commandArgs[0]);
        System.Diagnostics.Debug.WriteLine("id = " + commandArgs[1]);
        if(commandArgs[0] == "1")
            Response.Redirect("FamilyDetails.aspx?id=" + commandArgs[1]);
        if (commandArgs[0] == "2")
            Response.Redirect("ResidentialDetails.aspx?id=" + commandArgs[1]);
        if (commandArgs[0] == "3")
            Response.Redirect("EmgContact.aspx?id=" + commandArgs[1]);
        if (commandArgs[0] == "4")
            Response.Redirect("DocumentsUpload.aspx?id=" + commandArgs[1]);
        if (commandArgs[0] == "5")
            Response.Redirect("FeeDetails.aspx?id=" + commandArgs[1]);
    }

    protected void gvApplicationList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HiddenField hiddenField = (HiddenField)e.Row.FindControl("HiddenField1");
            LinkButton LinkButton1 = (LinkButton)e.Row.FindControl("LinkButton1");
            Label lblStatus = (Label)e.Row.FindControl("lblStatus");
            if (hiddenField.Value == "6")
            {

                LinkButton1.Visible = false;
                lblStatus.Visible = true;
            }
            else
            {
                LinkButton1.Visible = true;
                lblStatus.Visible = false;
            }
        }
    }
}