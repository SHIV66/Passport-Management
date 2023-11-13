using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_FeeDetails : System.Web.UI.Page
{

    String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
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
        string id = Request.QueryString["id"];
        string ptype = null, psize=null;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spPassportTS", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                ptype = dr[0].ToString();
                psize = dr[1].ToString();
            }
        }

        int total = 0;
        if (ptype == "Normal")
            total += getFee("base");
        if (ptype == "Tatkal")
            total = total + getFee("base") + getFee("tatkal");
        if (psize == "60")
            total += getFee("extrapages");

        lblFees.Text = "Rs. " + total;
    }

    int getFee(string type)
    {
        int amount = 0;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spFeesDisplay", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@name", type);
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                amount = Int32.Parse(dr["fees"].ToString());
            }
        }
        return amount;
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        bool valid = false;
        if(cbSelf.Checked)
        {
            valid = true;
        }
        else
        {
            lblError.Text = "Please confrm selfdeclarations";
        }

        if(valid)
        {
            string guid = Request.QueryString["id"];
            string cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spNewApplicationS6", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", guid);
                con.Open();
                cmd.ExecuteNonQuery();

            }
            Response.Redirect("ApplicationsList.aspx");
        }
    }
}