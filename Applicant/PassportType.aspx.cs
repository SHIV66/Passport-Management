using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_PassportType : System.Web.UI.Page
{
    string district;
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
        district = Request.QueryString["dst"];
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        string ptype=null, psize=null;
        ptype = rbPassportType.SelectedValue.ToString();
        psize = rbPassportPages.SelectedValue.ToString();
        Response.Redirect(string.Format("PersonalDetails.aspx?dst={0}&pt={1}&ps={2}",district,ptype,psize));
    }
    
}