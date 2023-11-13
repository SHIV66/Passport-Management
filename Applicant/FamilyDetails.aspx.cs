using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_FamilyDetails : System.Web.UI.Page
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
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Guid id = Guid.Parse(Request.QueryString["id"]);
        string pmdb = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(pmdb))
        {
            SqlCommand cmd = new SqlCommand("spNewApplicationS2", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id",id);
            cmd.Parameters.AddWithValue("@guardianType",rbGuardianType.SelectedValue.ToString().ToUpper());
            cmd.Parameters.AddWithValue("@guardianFirstname",txtGuardFname.Text.ToUpper());
            cmd.Parameters.AddWithValue("@guardianLastname", txtGuardLname.Text.ToUpper());
            cmd.Parameters.AddWithValue("@motherFirstname", txtMotherFname.Text.ToUpper());
            cmd.Parameters.AddWithValue("@motherLastname", txtMotherLname.Text.ToUpper());
            con.Open();
            Guid checkid=(Guid)cmd.ExecuteScalar();
            Response.Redirect(string.Format("ResidentialDetails.aspx?id={0}",checkid));
        }
    }

    protected void btnSaveDetails_Click(object sender, EventArgs e)
    {
        Guid id = Guid.Parse(Request.QueryString["id"]);
        string pmdb = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(pmdb))
        {
            SqlCommand cmd = new SqlCommand("spNewApplicationS2", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@guardianType", rbGuardianType.SelectedValue.ToString().ToUpper());
            cmd.Parameters.AddWithValue("@guardianFirstname", txtGuardFname.Text.ToUpper());
            cmd.Parameters.AddWithValue("@guardianLastname", txtGuardLname.Text.ToUpper());
            cmd.Parameters.AddWithValue("@motherFirstname", txtMotherFname.Text.ToUpper());
            cmd.Parameters.AddWithValue("@motherLastname", txtMotherLname.Text.ToUpper());
            con.Open();
            Guid checkid = (Guid)cmd.ExecuteScalar();
        }
    }
}