using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Officer_verifyApplication : System.Web.UI.Page
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
        string id = Request.QueryString["id"];
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            //string userid = Session["uid"].ToString();
            SqlCommand cmd = new SqlCommand("spApplicationDisplay", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            
            while(dr.Read())
            {
                lblFullName.Text = dr["firstname"] + " " + dr["lastname"];
                lblGender.Text = dr["gender"].ToString();
                lblDOB.Text = DateTime.Parse( dr["dob"].ToString()).ToString("dd-MM-yyyy");
                lblotherName.Text = dr["oa1_fname"] + " " + dr["oa1_lname"];
                lblbirthplace.Text = dr["location"].ToString();
                lblMarital.Text = dr["marital_status"].ToString();
                lblCitizenship.Text = dr["citizenship_by"].ToString();
                lblPan.Text = dr["pan_no"].ToString();
                lbl_voterId.Text = dr["voter_id"].ToString();
                lblEmployment.Text = dr["employement_type"].ToString();
                lblGovtserv.Text = dr["isGovServent"].ToString();
                lblGDType.Text = dr["guardianType"].ToString();
                lblGDname.Text = dr["guardianFirstname"].ToString() + " " + dr["guardianLastname"].ToString();
                lblMotherName.Text = dr["motherFirstname"].ToString() +" "+ dr["motherLastname"].ToString();
                if(dr["isIndianResident"].ToString() == "YES")
                {
                    lblPresentAddress.Text = dr["ooi_address"].ToString() + " " + dr["ooicname"].ToString();
                }
                else
                {
                    lblPresentAddress.Text = dr["ind_address"].ToString() + ", " + dr["state1"].ToString() + ", " + dr["dist1"].ToString() + ", " + dr["ind_pincode"].ToString();
                }
                lblPermanentAddress.Text =  dr["permAddress"].ToString() + ", " + dr["state2"].ToString() + ", " + dr["dist2"].ToString() + ", " + dr["permPincode"].ToString();
                lblMobile.Text = dr["mobile"].ToString();
                lblTelephone.Text = dr["telephone"].ToString();
                lblEmail.Text = dr["email"].ToString();
                lblEmgName.Text = dr["emgName"].ToString();
                lblEmgAddress.Text = dr["emgAddress"].ToString();
                lblEmgContact.Text = dr["emgContact"].ToString();
            }

        }
        using (SqlConnection con = new SqlConnection(cs))
        {
            string userid = Session["uid"].ToString();
            SqlCommand cmd = new SqlCommand("spGetSubmittedDocs", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            gvDocList.DataSource = dt;
            gvDocList.DataBind();

        }
    }

    protected void btnreject_Click(object sender, EventArgs e)
    {
        string comments = txtComments.Text;
        string id = Request.QueryString["id"];
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            //string userid = Session["uid"].ToString();
            SqlCommand cmd = new SqlCommand("spRejectApplication", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@uid", Session["uid"]);
            cmd.Parameters.AddWithValue("@comment", comments);
            cmd.Parameters.AddWithValue("@status", "lvl_" + Session["privilege"] + "_rejected");
            con.Open();
            cmd.ExecuteNonQuery();
        }
        updateApplicationStatus("Rejected by Level " + Session["privilege"] + " - Officer\nReason : "+comments);
        Response.Redirect("PendingApplicationsList.aspx");
    }

    protected void btnapprove_Click(object sender, EventArgs e)
    {
        string comments = txtComments.Text;
        string id = Request.QueryString["id"];
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            //string userid = Session["uid"].ToString();
            SqlCommand cmd = new SqlCommand("spApproveApplication", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@uid", Session["uid"]);
            cmd.Parameters.AddWithValue("@comment", comments);
            if(Int32.Parse(Session["privilege"].ToString()) < 4)
            { 
                cmd.Parameters.AddWithValue("@status", "lvl_" + Session["privilege"] + "_approved");
            }
            else
            {
                cmd.Parameters.AddWithValue("@status", "application_approved");
               
            }
            con.Open();
            cmd.ExecuteNonQuery();
        }
        if (Int32.Parse(Session["privilege"].ToString()) < 4)
        {
            updateApplicationStatus("Approved by Level " + Session["privilege"] + " - Officer");
        }
        else
        {
            updateApplicationStatus("Approved by Level " + Session["privilege"] + " - Officer.\nYour Details are now verified. You will receive your passport in next 7 working days.");

        }
        Response.Redirect("PendingApplicationsList.aspx");

    }

    void updateApplicationStatus(string status)
    {
        string aid = Request.QueryString["id"];
        string uid = Session["uid"].ToString();

        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spUpdateApplicationStatus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@aid", aid);
            cmd.Parameters.AddWithValue("@status", status);
            cmd.Parameters.AddWithValue("@updated_by", uid);
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    protected void gvDocList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        Response.Redirect("/Documents/" + id + ".pdf");
    }
}