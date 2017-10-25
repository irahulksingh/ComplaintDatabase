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
       if(!IsPostBack)
       {
        if (Session.Count == 0)
        {
            Response.Redirect("LoginCheck.aspx");
        }
        else
        {
            ((Label)Master.FindControl("lblName")).Text = Session["Name"].ToString();
            btnClearAll.Visible = false;
            
         
        }
    }
    }
    #region Calling Search method on click of search button
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        mtdSearchResult();
        
    }

    public void mtdSearchResult()
    {
        mtdClearAll();

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_GetSearchResults", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@nSearchResult", SqlDbType.NVarChar, (100)).Value = txtSearchBox.Text;

        SqlDataAdapter sdaSearchResults = new SqlDataAdapter(cmd);
        DataTable dtSearchResult = new DataTable();

        sdaSearchResults.Fill(dtSearchResult);

        if (dtSearchResult.Rows.Count == 0)
        {
            lblMsg.Text = "No data found";
        }
        else
        {
            lblMsg.Text = "";
            grdSearchResult.DataSource = dtSearchResult;
            grdSearchResult.DataBind();

            grdSearchResult.Columns[15].Visible = false;
            grdSearchResult.Columns[16].Visible = false;
            grdSearchResult.Columns[17].Visible = false;

            Conn.Close();
            Conn.Dispose();
            btnSearch.Visible = false;
            btnClearAll.Visible = true;

        }

    }

    #endregion

    #region Filling all text boxes with data in Gridview
    protected void grdSearchResult_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Select")
        {
            Int16 num = Convert.ToInt16(e.CommandArgument);
            txtDate.Text = grdSearchResult.Rows[num].Cells[1].Text;
            txtFileNo.Text = grdSearchResult.Rows[num].Cells[2].Text;
            txtAccountNo.Text = grdSearchResult.Rows[num].Cells[3].Text;
            txtCustName.Text = grdSearchResult.Rows[num].Cells[4].Text;
            txtModeOfComm.Text = grdSearchResult.Rows[num].Cells[5].Text;
            txtChannel.Text = grdSearchResult.Rows[num].Cells[6].Text;
            txtComplaintLoggedOn.Text = grdSearchResult.Rows[num].Cells[7].Text;
            txtRmsDueDate.Text = grdSearchResult.Rows[num].Cells[8].Text;
            txtiCaredate.Text = grdSearchResult.Rows[num].Cells[9].Text;
            txtiCareNo.Text = grdSearchResult.Rows[num].Cells[10].Text;
            txtAging.Text = grdSearchResult.Rows[num].Cells[13].Text;
            txtComplaintSummary.Text = grdSearchResult.Rows[num].Cells[13].Text;
            txtComplaintCategory.Text = grdSearchResult.Rows[num].Cells[11].Text;
            txtComplaintCloseDueDate.Text = grdSearchResult.Rows[num].Cells[12].Text;
            txtActionStanding.Text = grdSearchResult.Rows[num].Cells[17].Text;
            txtComplaintSummary.Text = grdSearchResult.Rows[num].Cells[16].Text;
            txtRMSresolution.Text = grdSearchResult.Rows[num].Cells[15].Text;
            if (grdSearchResult.Rows[num].Cells[14].Text == "Yes")
            {
                chkYes.Checked = true;
                chkYes.Enabled = false;
                txtComplaintSummaryNew.Enabled = false;
                chkReopen.Enabled = true;
            }
            else
            {
                chkYes.Checked = false;
                chkYes.Enabled = true;
                txtComplaintSummaryNew.Enabled = true;
                chkReopen.Enabled = false;
            }
            lblMsg.Text = "";

        }

    }
    #endregion

    #region Submitting new Complaint summary in the database adding to the old one
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtDate.Text == "")
        {
            lblMsg.Text = "Please select a complaint";
        }
        else
        {
            // string txtUser = Session["Name"].ToString();
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
            Conn.Open();
            SqlCommand cmd = new SqlCommand("sp_UpdateComplaintSummary", Conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@niCareNo", SqlDbType.NVarChar, (20)).Value = txtiCareNo.Text;
            if (chkYes.Checked == true)
            {
                cmd.Parameters.Add("@nComplaintClosed", SqlDbType.NVarChar, (50)).Value = "Yes";
            }
            else if (chkYes.Checked == false)
            {
                cmd.Parameters.Add("@nComplaintClosed", SqlDbType.NVarChar, (50)).Value = "No";
            }

            if (chkReopen.Checked == true)
            {
                cmd.Parameters.Add("@nComplaintReopened", SqlDbType.NVarChar, (50)).Value = "Yes";
                cmd.Parameters.Add("@nComplaintReopenedBy", SqlDbType.NVarChar, (50)).Value = Session["Name"].ToString();
            }
            else if (chkReopen.Checked == false)
            {
                cmd.Parameters.Add("@nComplaintReopened", SqlDbType.NVarChar, (50)).Value = "No";
                cmd.Parameters.Add("@nComplaintReopenedBy", SqlDbType.NVarChar, (50)).Value = "N/A";
            }

            cmd.Parameters.Add("@nComplaintSummary", SqlDbType.NVarChar, (1000)).Value = txtComplaintSummary.Text + "\r\n" + "\r\n" + txtComplaintSummaryNew.Text + " " + "-" + "Added By :" + Session["name"].ToString() + " " + "On :" + DateTime.Now.ToString();

            cmd.ExecuteNonQuery();

            Conn.Close();
            Conn.Dispose();
            Response.Redirect("Edit_Complaints.aspx");
        }
    }
    #endregion

    #region Clear all text boxes on button click
    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        Response.Redirect("Edit_Complaints.aspx");

    }
    #endregion

    #region Clear all text boxes
    public void mtdClearAll()
    {
        grdSearchResult.Dispose();
        txtAccountNo.Text = "";
        txtDate.Text = "";
        txtFileNo.Text = "";

        txtCustName.Text = "";
        txtModeOfComm.Text = "";
        txtChannel.Text = "";
        txtComplaintLoggedOn.Text = "";
        txtRmsDueDate.Text = "";
        txtiCaredate.Text = "";
        txtiCareNo.Text = "";
        txtAging.Text = "";
        txtComplaintSummary.Text = "";
        txtComplaintCategory.Text = "";
        txtComplaintCloseDueDate.Text = "";
        txtActionStanding.Text = "";
        txtComplaintSummaryNew.Text = "";
        txtRMSresolution.Text = "";


    }
    #endregion

    #region Enabling Yes checkbox and complaint summary text box on click of Reopen check box
    protected void chkReopen_CheckedChanged(object sender, EventArgs e)
    {
        chkYes.Enabled = true;
        chkYes.Checked = false;

        txtComplaintSummaryNew.Enabled = true;
    }
    #endregion
   
}