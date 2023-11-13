using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DocumentAdvisor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        if(!IsPostBack)
        {
            //Load Countries
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spDisplaydocType", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                cbDocType.DataSource = dt;
                cbDocType.DataTextField = "docType";
                cbDocType.DataValueField = "id";

                cbDocType.DataBind();

            }
        }
        //Load Countries
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spDisplayEligibleDocs", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", cbDocType.SelectedValue);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvEligibleDocs.DataSource = dt;

            gvEligibleDocs.DataBind();


        }
    }

    protected void cbDocType_SelectedIndexChanged(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        //Load Countries
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spDisplayEligibleDocs", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", cbDocType.SelectedValue);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvEligibleDocs.DataSource = dt;

            gvEligibleDocs.DataBind();


        }
    }
}