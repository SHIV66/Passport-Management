using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Applicant_DocumentsUpload : System.Web.UI.Page
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
            string id = Request.QueryString["id"];
            string pmdb = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(pmdb))
            {
                SqlCommand cmd = new SqlCommand("spGetRequiredDocs", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    if (Int32.Parse(dr[0].ToString()) == 1)
                    {
                        Panel1.Visible = true;
                        Session["address"] = dr[1].ToString();
                        Session["chkaddress"] = 0;
                    }
                    if (Int32.Parse(dr[0].ToString()) == 2)
                    {
                        Panel2.Visible = true;
                        Session["idproof"] = dr[1].ToString();
                        Session["chkidproof"] = 0;

                    }
                    if (Int32.Parse(dr[0].ToString()) == 3)
                    {
                        Panel3.Visible = true;
                        Session["namechange"] = dr[1].ToString();
                        Session["chknamechange"] = 0;
                    }
                    if (Int32.Parse(dr[0].ToString()) == 4)
                    {
                        Panel4.Visible = true;
                        Session["nationality"] = dr[1].ToString();
                        Session["chknationality"] = 0;
                    }
                    if (Int32.Parse(dr[0].ToString()) == 5)
                    {
                        Panel5.Visible = true;
                        Session["annexureh"] = dr[1].ToString();
                        Session["chkannexureh"] = 0;
                    }

                }
            }
            loadRBL(rblAddress, 1);
            loadRBL(rblIDproof, 2);
            loadRBL(rblNameChange, 3);
            loadRBL(rblNationality, 4);
            loadRBL(rblAnnexureH, 5);

        }

    }



    void loadRBL(RadioButtonList rbl, int docType)
    {

        string cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spDisplayEligibleDocs", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", docType);
            con.Open();
            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            rbl.DataSource = dt;
            rbl.DataTextField = "dname";
            rbl.DataValueField = "did";
            rbl.DataBind();

        }
    }



    protected void afIDproof_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        
        string fileNametoupload = Server.MapPath("~/Documents/" + Session["idproof"].ToString() + ".pdf");
        afIDproof.SaveAs(fileNametoupload);
        int id = Int32.Parse(Session["idproof"].ToString());
        int docId = Int32.Parse(Session["idproofrb"].ToString());
        updateUploadStatus(id,docId);
        lblError.Visible = false;
        Session["chkidproof"] = 1;
    }

    protected void afAddress_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        string fileNametoupload = Server.MapPath("~/Documents/" + Session["address"].ToString() + ".pdf");
        afAddress.SaveAs(fileNametoupload);
        int id = Int32.Parse(Session["address"].ToString());
        int docId = Int32.Parse(Session["addressrb"].ToString());
        updateUploadStatus(id, docId);
        lblError.Visible = false;
        Session["chkaddress"] = 1;

    }

    protected void afNameChange_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        string fileNametoupload = Server.MapPath("~/Documents/" + Session["namechange"].ToString() + ".pdf");
        afNameChange.SaveAs(fileNametoupload);
        int id = Int32.Parse(Session["namechange"].ToString());
        int docId = Int32.Parse(Session["namechangerb"].ToString());
        updateUploadStatus(id, docId);
        lblError.Visible = false;
        Session["chknamechange"] = 1;
    }

    protected void afNationality_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        string fileNametoupload = Server.MapPath("~/Documents/" + Session["nationality"].ToString() + ".pdf");
        afNationality.SaveAs(fileNametoupload);
        int id = Int32.Parse(Session["nationality"].ToString());
        int docId = Int32.Parse(Session["nationalityrb"].ToString());
        updateUploadStatus(id, docId);
        lblError.Visible = false;
        Session["chknationality"] = 1;
    }

    protected void afAnnexure_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
    {
        string fileNametoupload = Server.MapPath("~/Documents/" + Session["annexureh"].ToString() + ".pdf");
        afAnnexure.SaveAs(fileNametoupload);
        int id = Int32.Parse(Session["annexureh"].ToString());
        int docId = Int32.Parse(Session["annexurehrb"].ToString());
        updateUploadStatus(id, docId);
        lblError.Visible = false;
        Session["chkannexureh"] = 1;
    }


    protected void rblIDproof_SelectedIndexChanged(object sender, EventArgs e)
    {
        afIDproof.Enabled = true;
        Session["idproofrb"] = rblIDproof.SelectedValue;
    }
    protected void rblNameChange_SelectedIndexChanged(object sender, EventArgs e)
    {
        afNameChange.Enabled = true;
        Session["namechangerb"]=rblNameChange.SelectedValue;
    }

    protected void rblNationality_SelectedIndexChanged(object sender, EventArgs e)
    {
        afNationality.Enabled = true;
        Session["nationalityrb"] = rblNationality.SelectedValue;
    }

    protected void rblAnnexureH_SelectedIndexChanged(object sender, EventArgs e)
    {
        afAnnexure.Enabled = true;
        Session["annexurehrb"]=rblAnnexureH.SelectedValue;
    }

    protected void rblAddress_SelectedIndexChanged(object sender, EventArgs e)
    {
        afAddress.Enabled = true;
        Session["addressrb"] = rblAddress.SelectedValue;
    }

    void updateUploadStatus(int id, int docID)
    {

        string cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spUpdateUploadStatus", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@docId", docID);
            con.Open();
            cmd.ExecuteNonQuery();

        }

    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        string msg = "";
        bool valid = true;
        if (Session["chknationality"] != null)
        {

            if (Int32.Parse(Session["chknationality"].ToString()) == 0)
            {
                msg += "* Nationality proof upload error<br>";
                valid = false;
            }
        }
        if (Session["chkannexureh"] != null)
        {

            if (Int32.Parse(Session["chkannexureh"].ToString()) == 0)
            {
                msg += "* Annexure H upload error<br>";

                valid = false;
            }
        }
        if (Session["chkaddress"] != null)
        {

            if (Int32.Parse(Session["chkaddress"].ToString()) == 0)
            {
                msg += "* Address proof upload error<br>";

                valid = false;
            }
        }
        if (Session["chknamechange"] != null)
        {

            if (Int32.Parse(Session["chknamechange"].ToString()) == 0)
            {
                msg += "* Namechange proof upload error<br>";

                valid = false;
            }
        }
        if (Session["chkidproof"] != null)
        {

            if (Int32.Parse(Session["chkidproof"].ToString()) == 0)
            {
                msg += "* ID proof upload error<br>";
                valid = false;
            }
        }
        System.Diagnostics.Debug.WriteLine(msg);

        if (!valid)
        {
            lblError.Text = msg;
            lblError.Visible = true;
        }
        else
        {
            Session["idproofrb"] = Session["namechangerb"] = Session["addressrb"] = Session["annexurehrb"] = Session["nationalityrb"] = null;
            Session["idproof"] = Session["namechange"] = Session["address"] = Session["annexureh"] = Session["nationality"] = null;
            Session["chkidproof"] = Session["chknamechange"] = Session["chkaddress"] = Session["chkannexureh"] = Session["chknationality"] = null;

            string guid = Request.QueryString["id"];
            string cs = ConfigurationManager.ConnectionStrings["pmdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spNewApplicationS5", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", guid);
                con.Open();
                cmd.ExecuteNonQuery();

            }
            Response.Redirect(string.Format("FeeDetails.aspx?id={0}", guid));
        }


    }

}
