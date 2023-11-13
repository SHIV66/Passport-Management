using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ModifyDocumentAdvisors : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
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
    }

    void docModify(string procedure,string parameter)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(procedure, con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", parameter);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i != 0)
            {
            }
        }
    }


    protected void btnAddDoc_Click(object sender, EventArgs e)
    {
        docModify("spAddNewDoc", txtDoc.Text);
    }

    protected void btnAddDocType_Click(object sender, EventArgs e)
    {
        docModify("spAddNewDocType", txtDocType.Text);
    }

    protected void cbDocType_SelectedIndexChanged(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        //Load Countries
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spDisplayEligibleDocs", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",cbDocType.SelectedValue);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvEligibleDocs.DataSource = dt;
            gvEligibleDocs.DataBind();

        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spDisplayEligibleDocsInv", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", cbDocType.SelectedValue);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            cblAllDocs.DataSource = dt;
            cblAllDocs.DataTextField = "name";
            cblAllDocs.DataValueField = "id";
            cblAllDocs.DataBind();

        }
    }

    protected void btnAddEligibleDocs_Click(object sender, EventArgs e)
    {

        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;

        
        foreach(ListItem item in cblAllDocs.Items)
        {
            if(item.Selected)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spAddEligibleDocs", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@dtid", cbDocType.SelectedValue);
                    cmd.Parameters.AddWithValue("@did",item.Value);
                    con.Open();
                    int j = cmd.ExecuteNonQuery();
                    if (j != 0)
                    {
                    }
                }
            }
        }

        
    }
}