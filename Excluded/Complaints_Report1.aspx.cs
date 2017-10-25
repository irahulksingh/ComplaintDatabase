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
          
        }
    }
    }

    #region Updateing Grid with date based search
    public void mtdUpdatedComplaintsReportGrid_Date()
    {
        if (txtStartDate.Text == "")
        {
            lblMsg.Text = "Start Date cannot be empty";
            txtStartDate.Focus();

        }
        else if (txtEndDate.Text == "")
        {
            lblMsg.Text = "End Date cannot be empty";
            txtEndDate.Focus();

        }
        else
        {
            lblMsg.Text = "";
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
            Conn.Open();
            SqlCommand Cmd = new SqlCommand("sp_GetSearchResultsForComplaints_Date", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;

            Cmd.Parameters.Add("@nStartDate", SqlDbType.NVarChar, (50)).Value = txtStartDate.Text;
            Cmd.Parameters.Add("@nEndDate", SqlDbType.NVarChar, (50)).Value = txtEndDate.Text;

            Cmd.ExecuteNonQuery();

            DataTable dtLogin = new DataTable();
            SqlDataAdapter daLogin = new SqlDataAdapter(Cmd);

            daLogin.Fill(dtLogin);
            if (dtLogin.Rows.Count == 0)
            {
                lblMsg.Text = "No data found";
                btnExporttoExcel.Visible = false;
            }
            else
            {
                btnExporttoExcel.Visible = true;
                btnSearch.Enabled = false;
                grdComplaintsReport.DataSource = dtLogin;
                grdComplaintsReport.DataBind();

                grdComplaintsReport.Columns[14].Visible = false;
                grdComplaintsReport.Columns[15].Visible = false;
                grdComplaintsReport.Columns[16].Visible = false;
                btnExporttoExcel.Enabled = true;
            }
            Conn.Close();
            Conn.Dispose();
        }
    }
    #endregion

    #region Updating the grid on Status based search
    public void mtdUpdatedComplaintsReportGrid_Status()
    {
        if (drpStatus.SelectedValue.ToString() == "Select")
        {
            lblMsg.Text = "Please select the Complaint Status Type";


        }

        else
        {
            lblMsg.Text = "";
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
            Conn.Open();
            SqlCommand Cmd = new SqlCommand("sp_GetSearchResultsForComplaints_Status", Conn);
            Cmd.CommandType = CommandType.StoredProcedure;

            Cmd.Parameters.Add("@nComplaintClosed", SqlDbType.NVarChar, (20)).Value = drpStatus.SelectedValue.ToString();

            Cmd.ExecuteNonQuery();

            DataTable dtLogin = new DataTable();
            SqlDataAdapter daLogin = new SqlDataAdapter(Cmd);

            daLogin.Fill(dtLogin);
            if (dtLogin.Rows.Count == 0)
            {
                lblMsg.Text = "No data found";
                btnExporttoExcel.Visible = false;
            }
            else
            {
                btnExporttoExcel.Visible = true;
                btnSearch.Enabled = false;
                grdComplaintsReport.DataSource = dtLogin;
                grdComplaintsReport.DataBind();

                grdComplaintsReport.Columns[14].Visible = false;
                grdComplaintsReport.Columns[15].Visible = false;
                grdComplaintsReport.Columns[16].Visible = false;
                btnExporttoExcel.Enabled = true;
            }
            Conn.Close();
            Conn.Dispose();
        }
    }
    #endregion

    #region If Page is too large then page indexing


    protected void grdComplaintsReport_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        mtdUpdatedComplaintsReportGrid_Date();
        grdComplaintsReport.PageIndex = e.NewPageIndex;
        grdComplaintsReport.DataBind();
    }

    #endregion

    #region Export to excel method

    public void Exporttoexcel()
    {

        grdComplaintsReport.Columns[14].Visible = true;
        grdComplaintsReport.Columns[15].Visible = true;
        grdComplaintsReport.Columns[16].Visible = true;
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=file-name.xls");
        Response.ContentType = "application/vnd.xlsx";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        grdComplaintsReport.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Exporttoexcel();
    }

    #endregion

    #region Radio button checked to perform the search (Date or Status)

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (rbComplaintLoggedDate.Checked == true)
        {
            mtdUpdatedComplaintsReportGrid_Date();
        }
        else if (rbComplaintStatus.Checked == true)
        {
            mtdUpdatedComplaintsReportGrid_Status();
        }
    }

    #endregion

    #region Redirecting the page on click of clear all button
    protected void btnClearAll_Click(object sender, EventArgs e)
    {
        Response.Redirect("Complaints_Report.aspx");
    }
    #endregion

    #region enabling the fields on the check or desired radiobutton (Date or Status)
    protected void rbComplaintStatus_CheckedChanged(object sender, EventArgs e)
    {
        rbComplaintLoggedDate.Checked = false;
        rbComplaintStatus.Checked = true;
        drpStatus.Enabled = true;
        txtEndDate.Enabled = false;
        txtStartDate.Enabled = false;
    }
    protected void rbComplaintLoggedDate_CheckedChanged(object sender, EventArgs e)
    {
        rbComplaintLoggedDate.Checked = true;
        rbComplaintStatus.Checked = false;
        drpStatus.Enabled = false;
        txtEndDate.Enabled = true;
        txtStartDate.Enabled = true;

    }
    #endregion

    #region Disabling all the controls which should be disabled on the page load.

    public void mtdDisableAllRequired()
    {
        rbComplaintLoggedDate.Checked = false;
        rbComplaintStatus.Checked = false;
        drpStatus.Enabled = false;
        txtEndDate.Enabled = false;
        txtStartDate.Enabled = false;
        btnExporttoExcel.Enabled = false;
    }
    #endregion

    public void mtdCheckingComplaintLoggedOnDate()
    {
        if (txtStartDate.Text == "")
        {
            lblMsg.Text = "Please select the start date first";
            txtEndDate.Text = "";
            txtStartDate.Focus();
        }
        else
        {
            if (Convert.ToDateTime(txtEndDate.Text) < Convert.ToDateTime(txtStartDate.Text))
            {
                lblMsg.Text = "End date cannot be less then Start date ";
                txtEndDate.Text = "";
                txtEndDate.Focus();
            }
            else
            {
                lblMsg.Text = "";
            }
        }
    }

    protected void txtEndDate_TextChanged(object sender, EventArgs e)
    {
        mtdCheckingComplaintLoggedOnDate();
    }
   
}