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
using System.Collections.Generic;

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
                    panelRejectComplaints.Visible = false;
         
                }
           
        }
    }
           
    }
    #region Calling Search method on click of search button
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearchBox.Text == "")
        {
            lblMsg.Text = "Please enter search word in search box";
            txtSearchBox.Focus();
        }
        else
        {
            mtdSearchResult();
        }        
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
            txtClientCode.Text = grdSearchResult.Rows[num].Cells[1].Text;
            txtDate.Text = grdSearchResult.Rows[num].Cells[2].Text;
            txtFileNo.Text = grdSearchResult.Rows[num].Cells[3].Text;
            txtAccountNo.Text = grdSearchResult.Rows[num].Cells[4].Text;
            txtCustName.Text = grdSearchResult.Rows[num].Cells[5].Text;
            txtModeOfComm.Text = grdSearchResult.Rows[num].Cells[6].Text;
            txtChannel.Text = grdSearchResult.Rows[num].Cells[7].Text;
            txtComplaintLoggedOn.Text = grdSearchResult.Rows[num].Cells[8].Text;
            txtRmsDueDate.Text = grdSearchResult.Rows[num].Cells[9].Text;
            txtiCaredate.Text = grdSearchResult.Rows[num].Cells[10].Text;
            txtiCareNo.Text = grdSearchResult.Rows[num].Cells[11].Text;
            txtAging.Text = grdSearchResult.Rows[num].Cells[14].Text;
          //  txtComplaintSummary.Text = grdSearchResult.Rows[num].Cells[13].Text;
            txtComplaintCategory.Text = grdSearchResult.Rows[num].Cells[12].Text;
            txtComplaintCloseDueDate.Text = grdSearchResult.Rows[num].Cells[13].Text;
            txtActionStanding.Text = grdSearchResult.Rows[num].Cells[18].Text;
            txtComplaintSummary.Text = grdSearchResult.Rows[num].Cells[17].Text;
            txtRMSresolution.Text = grdSearchResult.Rows[num].Cells[16].Text;
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

           
            //mtdFillingGridviewWithFilesInFolder();
            BindGrid();
       

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
        //else if (chkRejectComplaints.Checked == true)
        //{
        //    if (txtComRejDate.Text == "")
        //    {
        //        lblMsg.Text = "Reject Complaint Details Field left blank";
        //    }
        //    else if (txtComRejCom.Text == "")
        //    {
        //        lblMsg.Text = "Reject Complaint Details Field left blank";
        //    }
        //    else if (txtRejResDate.Text == "")
        //    {
        //        lblMsg.Text = "Reject Complaint Details Field left blank";
        //    }
        //    else if (txtRejResCom.Text == "")
        //    {
        //        lblMsg.Text = "Reject Complaint Details Field left blank";
        //    }

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
                if (chkRejectComplaints.Checked == true)
                {
                    cmd.Parameters.Add("@nComplaintReject", SqlDbType.NVarChar, (5)).Value = "Yes";
                    cmd.Parameters.Add("@nComplaintRejectDate", SqlDbType.NVarChar, (20)).Value = txtComRejDate.Text;
                    cmd.Parameters.Add("@nComplaintRejectComment", SqlDbType.NVarChar, (2000)).Value = txtComRejCom.Text;
                    cmd.Parameters.Add("@nRejectionResolutionDate", SqlDbType.NVarChar, (20)).Value = txtRejResDate.Text;
                    cmd.Parameters.Add("@nRejectionResolutionComment", SqlDbType.NVarChar, (2000)).Value = txtRejResCom.Text;
                }
                else if (chkRejectComplaints.Checked == false)
                {
                    cmd.Parameters.Add("@nComplaintReject", SqlDbType.NVarChar, (5)).Value = "No";
                    cmd.Parameters.Add("@nComplaintRejectDate", SqlDbType.NVarChar, (20)).Value = "N/A";
                    cmd.Parameters.Add("@nComplaintRejectComment", SqlDbType.NVarChar, (2000)).Value = "N/A";
                    cmd.Parameters.Add("@nRejectionResolutionDate", SqlDbType.NVarChar, (20)).Value = "N/A";
                    cmd.Parameters.Add("@nRejectionResolutionComment", SqlDbType.NVarChar, (2000)).Value = "N/A";
                }

                cmd.Parameters.Add("@nLastUser", SqlDbType.NVarChar, (20)).Value = Session["Name"].ToString();
                cmd.Parameters.Add("@nLastUpdated", SqlDbType.NVarChar, (20)).Value = DateTime.Now.ToString("MM-dd-yyyy HH:mm");

                cmd.ExecuteNonQuery();

                Conn.Close();
                Conn.Dispose();
                mtdClearAll();
                lblMsg.Text = "Data Saved";
                //Response.Redirect("Edit_Complaints.aspx");
            }
        //}
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
        txtSearchBox.Text = "";
        chkRejectComplaints.Checked = false;
        chkReopen.Checked = false;
        chkYes.Checked = false;

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

        txtClientCode.Text = "";
        panelRejectComplaints.Visible = false;
        txtComRejCom.Text = "";
        txtComRejDate.Text = "";
        txtRejResCom.Text = "";
        txtRejResDate.Text = "";

        grdSearchResult.DataSource = "";
        grdSearchResult.DataBind();


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

    protected void BindGrid()
    {
        string strLocation = Server.MapPath("~/Uploads/" + txtiCareNo.Text + "-" + txtAccountNo.Text);
       
        if (!Directory.Exists(strLocation))
        {
            //lblGrdMsg.Text = "No Files uploaded";
            grdUploaded.DataSource = "";
            grdUploaded.DataBind();
        }

        else
        {
            string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/" + txtiCareNo.Text + "-" + txtAccountNo.Text + "/"));
            List<ListItem> files = new List<ListItem>();
            foreach (string filePath in filePaths)
            {
                files.Add(new ListItem(Path.GetFileName(filePath), filePath));
            }
            grdUploaded.DataSource = files;
            grdUploaded.DataBind();
        }
    }

    protected void DownloadFile(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void DeleteFile(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        File.Delete(filePath);
        BindGrid();
        //mtdFillingGridviewWithFilesInFolder();
    }

    protected void chkRejectComplaints_CheckedChanged(object sender, EventArgs e)
    {
        if (chkRejectComplaints.Checked == true)
        {
            panelRejectComplaints.Visible = true;
        }
        else if (chkRejectComplaints.Checked == false)
        {
            panelRejectComplaints.Visible = false;
            txtComRejCom.Text = "";
            txtComRejDate.Text = "";
            txtRejResCom.Text = "";
            txtRejResDate.Text = "";

        }

    }

    public void mtd_CheckIfAllFieldsFilledForRejactComplaint()
    {


    }
}