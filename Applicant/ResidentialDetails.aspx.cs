using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_ResidentialDetails : System.Web.UI.Page
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
            Panel1.Visible = false;
            Panel2.Visible = false;

            cb_District.Enabled = false;
            String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            //Load Countries
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spDisplayCountryEXP", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                cbCountries.DataSource = dt;
                cbCountries.DataTextField = "name";
                cbCountries.DataValueField = "id";
                cbCountries.DataBind();

            }

            //Load States
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spDisplayStates", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                cb_State.DataSource = dt;
                cb_State.DataTextField = "state";
                cb_State.DataBind();

            }

            //Load States
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spDisplayStates", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                cb_PermState.DataSource = dt;
                cb_PermState.DataTextField = "state";
                cb_PermState.DataBind();

            }
        }
    }
    

    protected void cb_State_SelectedIndexChanged(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string selectedStae = cb_State.SelectedValue.ToString();
            SqlCommand cmd = new SqlCommand("spDisplayDist", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@state", selectedStae);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            cb_District.DataSource = dt;
            cb_District.DataTextField = "district";
            cb_District.DataValueField = "id";
            cb_District.DataBind();
            cb_District.Enabled = true;
            //btnNext.Enabled = true;
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        
        Guid id = Guid.Parse(Request.QueryString["id"]);
        
        string pmdb = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(pmdb))
        {
            SqlCommand cmd = new SqlCommand("spNewApplicationS3", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            System.Diagnostics.Debug.WriteLine("id = "+id);
            reqDoc(1, id);
            reqDoc(2, id);
            reqDoc(4, id);
            if (rbAddressOOI.SelectedValue == "YES")
            {
                reqDoc(5, id);
                System.Diagnostics.Debug.WriteLine("inside Yes");
                cmd.Parameters.AddWithValue("@isIndianResident", "YES");
                cmd.Parameters.AddWithValue("@ooi_country",cbCountries.SelectedValue);
                System.Diagnostics.Debug.WriteLine("country = "+ cbCountries.SelectedValue);
                cmd.Parameters.AddWithValue("@ooi_address", OOI_address.Text.ToUpper());

                System.Diagnostics.Debug.WriteLine("address = " + OOI_address.Text.ToUpper());
                cmd.Parameters.AddWithValue("@ind_address", "");

                cmd.Parameters.AddWithValue("@ind_district", 594);
                cmd.Parameters.AddWithValue("@ind_pincode", "");
                cmd.Parameters.AddWithValue("@permAddress", "");
                cmd.Parameters.AddWithValue("@permDistrict", 594);
                cmd.Parameters.AddWithValue("@permPincode", "");
            }
            if(rbAddressOOI.SelectedValue == "NO")
            {
                System.Diagnostics.Debug.WriteLine("inside No");
                cmd.Parameters.AddWithValue("@isIndianResident", "NO");
                cmd.Parameters.AddWithValue("@ooi_country",240);
                cmd.Parameters.AddWithValue("@ooi_address", "");
                cmd.Parameters.AddWithValue("@ind_address", txt_ind_address.Text.ToUpper());
                cmd.Parameters.AddWithValue("@ind_district", cb_District.SelectedValue);
                cmd.Parameters.AddWithValue("@ind_pincode", txtPincode.Text);
                cmd.Parameters.AddWithValue("@permAddress", txt_perm_ind_address.Text.ToUpper());
                cmd.Parameters.AddWithValue("@permDistrict", cb_PermDistrict.SelectedValue);
                cmd.Parameters.AddWithValue("@permPincode", txtPermPincode.Text);
            }

            cmd.Parameters.AddWithValue("@mobile",txtMobileNo.Text);
            cmd.Parameters.AddWithValue("@telephone",txtTelephone.Text);
            cmd.Parameters.AddWithValue("@email",txtEmail.Text);

            con.Open();
            Guid checkid = (Guid)cmd.ExecuteScalar();
            Response.Redirect(string.Format("EmgContact.aspx?id={0}", checkid));
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

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(rbAddressOOI.SelectedValue == "NO")
        {
            Panel2.Visible = true;
            Panel1.Visible = false;

        }
        if (rbAddressOOI.SelectedValue == "YES")
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
        }
    }

    protected void cb_PermState_SelectedIndexChanged(object sender, EventArgs e)
    {
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            string selectedStae = cb_PermState.SelectedValue.ToString();
            SqlCommand cmd = new SqlCommand("spDisplayDist", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@state", selectedStae);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            cb_PermDistrict.DataSource = dt;
            cb_PermDistrict.DataTextField = "district";
            cb_PermDistrict.DataValueField = "id";
            cb_PermDistrict.DataBind();
            cb_PermDistrict.Enabled = true;
            //btnNext.Enabled = true;
        }
    }

    protected void chk_perm_CheckedChanged(object sender, EventArgs e)
    {
        if(chk_perm.Checked)
        {
            txt_perm_ind_address.Text = txt_ind_address.Text;
            txt_perm_ind_address.Enabled = false;
            cb_PermState.SelectedValue = cb_State.SelectedValue;
            String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string selectedStae = cb_PermState.SelectedValue.ToString();
                SqlCommand cmd = new SqlCommand("spDisplayDist", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@state", selectedStae);
                con.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                cb_PermDistrict.DataSource = dt;
                cb_PermDistrict.DataTextField = "district";
                cb_PermDistrict.DataValueField = "id";
                cb_PermDistrict.DataBind();
                //btnNext.Enabled = true;
            }
            cb_PermState.Enabled = false;
            cb_PermDistrict.SelectedValue = cb_District.SelectedValue;
            cb_PermDistrict.Enabled = false;
            txtPermPincode.Text = txtPincode.Text;
            txtPermPincode.Enabled = false;
        }
        else
        {
            txt_perm_ind_address.Enabled = true;
            cb_PermState.Enabled = true;
            cb_PermDistrict.Enabled = true;
            txtPermPincode.Enabled = true;
        }
    }

    
}