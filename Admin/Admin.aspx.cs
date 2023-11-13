using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
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
        lblLvl1.Text = "" + getOfficerCount(1);
        lblLvl2.Text = "" + getOfficerCount(2);
        lblLvl3.Text = "" + getOfficerCount(3);
        lblLvl4.Text = "" + getOfficerCount(4);
    }

    int getOfficerCount(int lvl)
    {
        int count = 0;
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spCountOfficers", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@lvl",lvl);
            con.Open();
            count = (int)cmd.ExecuteScalar();
        }

        return count;
    }
}