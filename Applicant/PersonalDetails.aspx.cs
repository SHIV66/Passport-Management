using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class Applicant_PersonalDetails : System.Web.UI.Page
{
    string district,ptype,psize;
    Boolean valid = false;
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

            Panel1.Visible = false;
            pnl_birth.Visible = false;
        }
        RangeValidator1.MaximumValue = DateTime.Now.ToString("dd-MM-yyyy");
    }

    protected void rbOaYes_CheckedChanged(object sender, EventArgs e)
    {
        if(rbOaYes.Checked)
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
    }

    protected void rbOaNo_CheckedChanged(object sender, EventArgs e)
    {
        if (rbOaNo.Checked)
        {
            Panel1.Visible = false;
        }
        else
        {
            Panel1.Visible = true;
        }
    }

    protected void rbBoI_yes_CheckedChanged(object sender, EventArgs e)
    {
        if (rbBoI_yes.Checked)
        {
            pnl_birth.Visible = true;
        }
        else
        {
            pnl_birth.Visible = false;
        }
    }

    protected void rbBoI_no_CheckedChanged(object sender, EventArgs e)
    {
        if (rbBoI_no.Checked)
        {
            pnl_birth.Visible = false;
        }
        else
        {
            pnl_birth.Visible = true;
        }
    }

    

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Boolean valid = true;

        if (Page.IsValid)
        {
            Label1.Text = "Details validated..";
            string pmdb = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(pmdb))
            {

                district = Request.QueryString["dst"];
                ptype = Request.QueryString["pt"];
                psize = Request.QueryString["ps"];
                Label1.Text = "DB Initialized..";
                SqlCommand cmd = new SqlCommand("spNewApplicationS1", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                Label1.Text = "Connection opened";
                cmd.Parameters.AddWithValue("@district", district);
                cmd.Parameters.AddWithValue("@ptype", ptype);
                cmd.Parameters.AddWithValue("@psize", psize);
                cmd.Parameters.AddWithValue("@ap_date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                cmd.Parameters.AddWithValue("@firstname", txtFname.Text.ToUpper());
                cmd.Parameters.AddWithValue("@lastname", txtLname.Text.ToUpper());
                cmd.Parameters.AddWithValue("@gender", rbGender.SelectedValue.ToString().ToUpper());
                cmd.Parameters.AddWithValue("@dob", DateTime.Parse(txtDob.Text).ToString("yyyy-MM-dd"));
                if (rbOaYes.Checked)
                {
                    
                    cmd.Parameters.AddWithValue("@other_alias1", "YES");
                    cmd.Parameters.AddWithValue("@oa1_fname", txtOaFname.Text.ToUpper());
                    cmd.Parameters.AddWithValue("@oa1_lname", txtOaLname.Text.ToUpper());
                }
                if (rbOaNo.Checked)
                {
                    cmd.Parameters.AddWithValue("@other_alias1", "NO");
                    cmd.Parameters.AddWithValue("@oa1_fname", "");
                    cmd.Parameters.AddWithValue("@oa1_lname", "");
                }
                if (rbBoI_yes.Checked)
                {
                    cmd.Parameters.AddWithValue("@isBirthplaceIndia", "NO");
                    cmd.Parameters.AddWithValue("@country", cbCountries.SelectedValue);
                }
                if (rbBoI_no.Checked)
                {
                    cmd.Parameters.AddWithValue("@isBirthplaceIndia", "YES");
                    cmd.Parameters.AddWithValue("@country", 99);
                }
                cmd.Parameters.AddWithValue("@location", txtPlaceofBirth.Text.ToUpper());
                cmd.Parameters.AddWithValue("@marital_status", cbMarital.SelectedValue.ToUpper());
                cmd.Parameters.AddWithValue("@education", cbEduQual.SelectedValue.ToUpper());
                cmd.Parameters.AddWithValue("@citizenship_by", rbCitizen.SelectedValue.ToUpper());
                cmd.Parameters.AddWithValue("@pan_no", txtPAN.Text.ToUpper());
                cmd.Parameters.AddWithValue("@voter_id", txtVoterID.Text.ToUpper());
                cmd.Parameters.AddWithValue("@employment_type", cbEmploymentType.SelectedValue.ToUpper());
                cmd.Parameters.AddWithValue("@isGovServent", rbParentGovSrv.SelectedValue.ToUpper());
                cmd.Parameters.AddWithValue("@aadhar", txtAadhar.Text.ToUpper());
                cmd.Parameters.AddWithValue("@ecr", rbECR.SelectedValue.ToUpper());
                cmd.Parameters.AddWithValue("@visibleMark", txtVisibleMark.Text.ToUpper());
                cmd.Parameters.AddWithValue("@userid", Session["uid"].ToString());
                //SqlParameter outparameter = new SqlParameter("@aid", SqlDbType.UniqueIdentifier) { Direction = ParameterDirection.Output };
                Label1.Text = "Inserting values...";
                Guid id = (Guid)cmd.ExecuteScalar();
                Label1.Text = "Inserting values success";

                if (rbOaYes.Checked)
                {
                    reqDoc(3, id);
                }
                Response.Redirect(string.Format("FamilyDetails.aspx?id={0}", id));
            }
        }
    }
    void reqDoc(int docType, Guid id)
    {
        string pmdb = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(pmdb))
        {
            SqlCommand cmd = new SqlCommand("spRequestDoc", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@docType", docType);
            con.Open();
            int i = cmd.ExecuteNonQuery();
        }
    }
}