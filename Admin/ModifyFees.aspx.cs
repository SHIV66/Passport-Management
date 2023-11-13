using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ModifyFees : System.Web.UI.Page
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
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spFeesDisplay", con);
            cmd.Parameters.AddWithValue("@name", "base");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblOldBaseFee.Text = dr["fees"].ToString();
            }
        }
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spFeesDisplay", con);
            cmd.Parameters.AddWithValue("@name", "tatkal");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblOldTatkalFee.Text = dr["fees"].ToString();
            }
        }
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spFeesDisplay", con);
            cmd.Parameters.AddWithValue("@name", "extrapages");
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblOldEPFees.Text = dr["fees"].ToString();
            }
        }


    }

    void updateFees(string name, string newFee)
    {

        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spUpdateFees", con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@fees", newFee);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
        }
    }

    protected void btnUpdateBase_Click(object sender, EventArgs e)
    {
        updateFees("base", txtBaseFees.Text);
        Response.Redirect(Request.RawUrl);
    }

    protected void btnUpdateTatkal_Click(object sender, EventArgs e)
    {
        updateFees("tatkal", txtTatkalFees.Text);
        Response.Redirect(Request.RawUrl);
    }

    protected void btnUpdateEPFees_Click(object sender, EventArgs e)
    {
        updateFees("extrapages", txtEPFees.Text);
        Response.Redirect(Request.RawUrl);
    }
}