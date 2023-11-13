using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Officer_SubmittedApplicationsList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string status;


        if (Session["privilege"].ToString() == "1")
        {
            status = "lvl_1_approved";
        }
        else if (Session["privilege"].ToString() == "2")
        {
            status = "level_2_approved";
        }
        else if (Session["privilege"].ToString() == "3")
        {
            status = "level_3_approved";
        }
        else if (Session["privilege"].ToString() == "4")
        {
            status = "level_4_approved";
        }
        else
        {
            status = "nologinerror";
        }
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            //string userid = Session["uid"].ToString();
            SqlCommand cmd = new SqlCommand("spSubmittedAplnList", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status", status);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvSubmittedApplicationList.DataSource = dt;
            gvSubmittedApplicationList.DataBind();

        }
    }

    protected void gvSubmittedApplicationList_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}