using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.IO;
using System.Text;
using System.Net.Mail;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.UrlReferrer == null)
        {
            Response.Redirect("LoginCheck.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                if (Session.Count == 0)
                {
                    Response.Redirect("LoginCheck.aspx");
                }
                else
                {
                    ((Label)Master.FindControl("lblName")).Text = Session["Name"].ToString();



                }
            }
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand Cmd = new SqlCommand("sp_GetiCareDetails", Conn);
        Cmd.CommandType = CommandType.StoredProcedure;
        Cmd.Parameters.Add("@niCareNo", SqlDbType.NVarChar, (20)).Value = txtiCareNumber.Text;
        Cmd.ExecuteNonQuery();

        SqlDataAdapter sdiCare = new SqlDataAdapter(Cmd);
        DataTable dtiCare = new DataTable();
        sdiCare.Fill(dtiCare);

        if (dtiCare.Rows.Count == 0)
        {
        }
        else if (dtiCare.Rows[0][16].ToString() == "Yes")
        {
            //chkYes.Checked = true;
            //chkYes.Enabled = false;
            //txtRMSresolution.Enabled = false;
            txtActionOutstandingNew.Enabled = false;
            lblMsg.Text = "Complaint Closed = YES";
            //btnSubmit.Enabled = false;
        }
        else
        {
            //chkYes.Checked = false;
            //chkYes.Enabled = true;
            //txtRMSresolution.Enabled = false;
            txtActionOutstandingNew.Enabled = true;
            lblMsg.Text = "";
            //btnSubmit.Enabled = true;

        }
        if (dtiCare.Rows.Count == 0)
        {
            lblMsg.Text = "iCare Number not found in the database";
            txtDate.Text = "";
            txtFileNo.Text = "";
            txtAccountNo.Text = "";
            txtChannel.Text = "";
            txtModeOfComm.Text = "";
            txtComplaintLoggedOn.Text = "";
            txtRmsDueDate.Text = "";
            txtiCaredate.Text = "";
            txtComplaintCategory.Text = "";
            txtComplaintSummary.Text = "";
            txtComplaintCloseDueDate.Text = "";
            txtActionOutstandingPrev.Text = "";
            txtAging.Text = "";
            //txtRMSresolution.Text = "";

            txtActionOutstandingNew.Enabled = false;
            //chkYes.Checked = false;
            //chkYes.Enabled = true;
            //btnSubmit.Enabled = false;
        }
        else
        {
            txtClientCode.Text = dtiCare.Rows[0][1].ToString();
            txtDate.Text = dtiCare.Rows[0][2].ToString();
            txtFileNo.Text = dtiCare.Rows[0][3].ToString();
            txtAccountNo.Text = dtiCare.Rows[0][4].ToString();
            txtCustName.Text = dtiCare.Rows[0][5].ToString();

            txtModeOfComm.Text = dtiCare.Rows[0][6].ToString();
            txtChannel.Text = dtiCare.Rows[0][7].ToString();
            txtComplaintLoggedOn.Text = dtiCare.Rows[0][8].ToString();
            txtiCareNo.Text = dtiCare.Rows[0][11].ToString();
            txtRmsDueDate.Text = dtiCare.Rows[0][10].ToString();
            txtiCaredate.Text = dtiCare.Rows[0][12].ToString();
            txtComplaintCategory.Text = dtiCare.Rows[0][13].ToString();
            txtComplaintSummary.Text = dtiCare.Rows[0][14].ToString();
            txtComplaintCloseDueDate.Text = dtiCare.Rows[0][15].ToString();
            txtActionOutstandingPrev.Text = dtiCare.Rows[0][16].ToString();
            txtAging.Text = dtiCare.Rows[0][17].ToString();

            txtComRejDate.Text = dtiCare.Rows[0][28].ToString();
            txtComRejCom.Text = dtiCare.Rows[0][29].ToString();
            txtRejResDate.Text = dtiCare.Rows[0][30].ToString();
            txtRejResCom.Text = dtiCare.Rows[0][31].ToString();
            // txtRMSresolution.Text = dtiCare.Rows[0][18].ToString();
        }
        Conn.Close();
        Conn.Dispose();

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand Cmd = new SqlCommand("sp_UpdateActionOutanding", Conn);
        Cmd.CommandType = CommandType.StoredProcedure;

        Cmd.Parameters.Add("@niCareNo", SqlDbType.NVarChar, (20)).Value = txtiCareNumber.Text;
        if (txtAccountNo.Text == "")
        {
            lblMsg.Text = "Please enter iCare no. in search field";
            txtiCareNumber.Focus();
        }
        else
        {

            if (txtActionOutstandingNew.Text == "")
            {
            }
            else
            {
                Cmd.Parameters.Add("@nActionOutstanding", SqlDbType.NVarChar, (2000)).Value = txtActionOutstandingPrev.Text + "\r\n" + "\r\n" + txtActionOutstandingNew.Text + " " + " - " + "Added By :" + Session["Name"].ToString() + " " + "On :" + DateTime.Now.ToString(); ;
            }

            Cmd.ExecuteNonQuery();
            mtdClearAllData();
            lblMsg.Text = "Data Saved successfully";

            Conn.Close();
            Conn.Dispose();
        }
    }
  
    public void mtdClearAllData()
    {
        txtiCareNumber.Text = "";
        txtDate.Text = "";
        txtFileNo.Text = "";
        txtAccountNo.Text = "";
        txtChannel.Text = "";
        txtModeOfComm.Text = "";
        txtCustName.Text = "";
        txtComplaintLoggedOn.Text = "";
        txtRmsDueDate.Text = "";
        txtiCaredate.Text = "";
        txtComplaintCategory.Text = "";
        txtComplaintSummary.Text = "";
        txtComplaintCloseDueDate.Text = "";
        txtActionOutstandingNew.Text = "";
        txtActionOutstandingPrev.Text = "";
        txtAging.Text = "";
        //chkYes.Checked = false;
        //txtRMSresolution.Text = "";

    }
}