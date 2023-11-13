using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FeeCalucator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    int getFee(string type)
    {
        int amount = 0;
        String cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
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
                amount = Int32.Parse( dr["fees"].ToString());
            }
        }
        return amount;
    }



    protected void btnCheck_Click(object sender, EventArgs e)
    {
        int total = 0;
        if (rbPtype.SelectedValue == "Normal")
            total += getFee("base");
        if (rbPtype.SelectedValue == "Tatkal")
            total = total + getFee("base") + getFee("tatkal");
        if (rbPsize.SelectedValue == "60")
            total += getFee("extrapages");

        lblFees.Text = "Total Amount Rs. " + total;
    }
}