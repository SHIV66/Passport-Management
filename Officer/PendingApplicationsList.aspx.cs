using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Officer_PendingApplicationsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("/");
        }
        else
        {
            if (Session["officer"].ToString() != "1")
            {
                Session["uid"] = null;
                Response.Redirect("/");
            }
        }

        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string status;
            //System.Diagnostics.Debug.WriteLine("Level - "+Session["privilege"].ToString());
            
            if(Session["privilege"].ToString() == "1")
            {
                status = "submitted";
            }
            else if (Session["privilege"].ToString() == "2")
            {
                status = "lvl_1_approved";
            }
            else if (Session["privilege"].ToString() == "3")
            {
                status = "lvl_2_approved";
            }
            else if (Session["privilege"].ToString() == "4")
            {
                status = "lvl_3_approved";
            }
            else
            {
                status = "nologinerror";
            }

            System.Diagnostics.Debug.WriteLine("status - " + status);
            //string userid = Session["uid"].ToString();
            SqlCommand cmd = new SqlCommand("spPendingAplnList", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status", status);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvPendingApplicationList.DataSource = dt;
            gvPendingApplicationList.DataBind();

        }
    }

    

    protected void gvPendingApplicationList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //HiddenField hiddenField = (HiddenField)e.Row.FindControl("HiddenField1");
            //LinkButton LinkButton1 = (LinkButton)e.Row.FindControl("LinkButton1");
            //Label lblStatus = (Label)e.Row.FindControl("lblStatus");
            //if (hiddenField.Value == "4")
            //{

            //    LinkButton1.Visible = false;
            //    lblStatus.Visible = true;
            //}
            //else
            //{
            //    LinkButton1.Visible = true;
            //    lblStatus.Visible = false;
            //}
        }
    }

    protected void gvPendingApplicationList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Redirect(string.Format("verifyApplication.aspx?id={0}", e.CommandArgument));
    }
}