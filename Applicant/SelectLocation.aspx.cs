using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Applicant_SelectLocation : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            cbDistrict.Enabled = false;
            btnNext.Enabled = false;

            String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spDisplayStates", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                cbState.DataSource = dt;
                cbState.DataTextField = "state";
                cbState.DataBind();

            }
        }
        
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("PassportType.aspx?dst=" + cbDistrict.SelectedValue);
    }

   

    protected void cbState_SelectedIndexChanged1(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string selectedStae = cbState.SelectedValue.ToString();
            SqlCommand cmd = new SqlCommand("spDisplayDist", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@state", selectedStae);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            cbDistrict.DataSource = dt;
            cbDistrict.DataTextField = "district";
            cbDistrict.DataValueField = "id";
            cbDistrict.DataBind();
            cbDistrict.Enabled = true;
            btnNext.Enabled = false;
        }
    }
    

    protected void btnNext_Click1(object sender, EventArgs e)
    {
        Response.Redirect("PassportType.aspx?dst=" + cbDistrict.SelectedValue);
    }

    protected void cbDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {

        btnNext.Enabled = true;
    }
}