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
            mtdFillModeDropdowns();
            mtdFillChannelDropdowns();
            mtdFillComplaintDropdowns();
        }
    }
    }
    #region Filling all drop down boxes
    public void mtdFillModeDropdowns()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_GetModeDropDownDetails", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter daDropDownData = new SqlDataAdapter(cmd);
        DataTable dtDropDownData = new DataTable();
        daDropDownData.Fill(dtDropDownData);
        dbMode.DataSource = dtDropDownData;
        //cboEmpRole.DataTextField = "EmpRole";
        dbMode.DataValueField = "nModeOfCommunication";
        dbMode.DataBind();

        // Adding Item to the combo box
        dbMode.Items.Insert(0, "Select");
        Conn.Close();
        Conn.Dispose();

    }
    public void mtdFillChannelDropdowns()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_GetChannelDropDownDetails", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter daDropDownData = new SqlDataAdapter(cmd);
        DataTable dtDropDownData = new DataTable();
        daDropDownData.Fill(dtDropDownData);
        dbChannel.DataSource = dtDropDownData;
        //cboEmpRole.DataTextField = "EmpRole";
        dbChannel.DataValueField = "nChannel";
        dbChannel.DataBind();

        // Adding Item to the combo box
        dbChannel.Items.Insert(0, "Select");
        Conn.Close();
        Conn.Dispose();

    }
    public void mtdFillComplaintDropdowns()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_GetComplaintDropDownDetails", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter daDropDownData = new SqlDataAdapter(cmd);
        DataTable dtDropDownData = new DataTable();
        daDropDownData.Fill(dtDropDownData);
        dbCompCat.DataSource = dtDropDownData;
        //cboEmpRole.DataTextField = "EmpRole";
        dbCompCat.DataValueField = "nComplaintCategory";
        dbCompCat.DataBind();

        // Adding Item to the combo box
        dbCompCat.Items.Insert(0, "Select");
        Conn.Close();
        Conn.Dispose();

    }
    #endregion

    #region validating if the radiobuttons have yes checked or no
    protected void rbComplaintRejected_SelectedIndexChanged(object sender, EventArgs e)
    {
        // mtdCheckComplaintRejected();
    }
    protected void rbQaDone_SelectedIndexChanged(object sender, EventArgs e)
    {
        // mtdCheckQaDone();
    }
    //public void mtdCheckComplaintRejected()
    //{

    //    if (rbComplaintRejected.SelectedItem == null)
    //    {
    //        txtComRejectDate.Enabled = false;
    //        txtComplaintRejDesc.Enabled = false;
    //    }
    //    else if (rbComplaintRejected.SelectedItem.Value == "Yes")
    //    {
    //        txtComRejectDate.Enabled = true;
    //        txtComplaintRejDesc.Enabled = true;

    //    }
    //    else if (rbComplaintRejected.SelectedItem.Value == "No")
    //    {
    //        txtComRejectDate.Enabled = false;
    //        txtComplaintRejDesc.Enabled = false;

    //    }

    //}

    //public void mtdCheckQaDone()
    //{

    //    if (rbQaDone.SelectedItem == null)
    //    {
    //        txtScore.Enabled = false;

    //    }
    //    else if (rbQaDone.SelectedItem.Value == "Yes")
    //    {
    //        txtScore.Enabled = true;

    //    }
    //    else if (rbQaDone.SelectedItem.Value == "No")
    //    {
    //        txtScore.Enabled = false;

    //    }
    //}

    #endregion

    #region inserting data into the database after submit button pressed
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_InsertComplaintDetailsNew", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@nDateReceived", SqlDbType.NVarChar, (20)).Value = txtDate.Text;
        cmd.Parameters.Add("@nFileNo", SqlDbType.NVarChar, (20)).Value = txtFileNo.Text;

        cmd.Parameters.Add("@nAccountNo", SqlDbType.NVarChar, (20)).Value = txtAccountNo.Text;
        cmd.Parameters.Add("@nCustomerName", SqlDbType.NVarChar, (100)).Value = txtCustName.Text;

        cmd.Parameters.Add("@nMode", SqlDbType.NVarChar, (20)).Value = dbMode.SelectedValue.ToString();


        cmd.Parameters.Add("@nChannel", SqlDbType.NVarChar, (20)).Value = dbChannel.SelectedValue.ToString();
        cmd.Parameters.Add("@nComplaintLoggedDate", SqlDbType.NVarChar, (20)).Value = txtComplaintLoggedOn.Text;

        // Hidden Field for calculating days between Complaint received and logged on.
        cmd.Parameters.Add("@nNoOfDaysCompLogdOn", SqlDbType.NVarChar, (10)).Value = txtHiddenNoOfDaysCompLogdOn.Text;
        cmd.Parameters.Add("@nRMSdueDate", SqlDbType.NVarChar, (20)).Value = txtRmsDueDate.Text;

        // First calculation check point entry
        cmd.Parameters.Add("@niCareNo", SqlDbType.NVarChar, (20)).Value = txtiCareNo.Text;

        cmd.Parameters.Add("@niCareDate", SqlDbType.NVarChar, (20)).Value = txtiCaredate.Text;
        cmd.Parameters.Add("@nComplaintCategory", SqlDbType.NVarChar, (20)).Value = dbCompCat.SelectedValue.ToString();
        if (txtComplaintSummary.Text == "")
        {
            cmd.Parameters.Add("@nComplaintSummary", SqlDbType.NVarChar, (1000)).Value = "NA" + " " + " - " + "Added By :" + Session["Name"].ToString() + " " + "On :" + DateTime.Now.ToString();
            ;
        }
        else
        {
            cmd.Parameters.Add("@nComplaintSummary", SqlDbType.NVarChar, (1000)).Value = txtComplaintSummary.Text + " " + " - " + "Added By :" + Session["Name"].ToString() + " " + "On :" + DateTime.Now.ToString();

        }
        cmd.Parameters.Add("@nComplaintClosed", SqlDbType.NVarChar, (20)).Value = "No";

        cmd.Parameters.Add("@nComplaintClosedDueDate", SqlDbType.NVarChar, (20)).Value = txtComplaintCloseDueDate.Text;

        cmd.Parameters.Add("@nDateMTodayAging", SqlDbType.NVarChar, (20)).Value = txtAging.Text;

        if (txtActionStanding.Text == "")
        {
            cmd.Parameters.Add("@nActionStanding", SqlDbType.NVarChar, (200)).Value = "NA" + " " + " - " + "Added By :" + Session["Name"].ToString() + " " + "On :" + DateTime.Now.ToString();
            ;
        }
        else
        {
            cmd.Parameters.Add("@nActionStanding", SqlDbType.NVarChar, (200)).Value = txtActionStanding.Text + " " + " - " + "Added By :" + Session["Name"].ToString() + " " + "On :" + DateTime.Now.ToString();
        }

        cmd.Parameters.Add("@nRmsResolution", SqlDbType.NVarChar, (1000)).Value = "NA" + " " + " - " + "Added By :" + Session["Name"].ToString() + " " + "On :" + DateTime.Now.ToString();

        //Updating this entry made by User and the Time
        cmd.Parameters.Add("@nLastUser", SqlDbType.NVarChar, (20)).Value = Session["Name"].ToString();
        cmd.Parameters.Add("@nLastUpdated", SqlDbType.NVarChar, (20)).Value = DateTime.Now.ToString("MM-dd-yyyy HH:mm");

        cmd.ExecuteNonQuery();
        Conn.Close();
        Conn.Dispose();

        mtdClearAllText();
        lblMsg.Text = "Data Saved Successfully";

    }

    #endregion

    #region Calling all procedures after the complaint logged on text box is filled
    protected void txtComplaintLoggedOn_TextChanged(object sender, EventArgs e)
    {

        if (txtComplaintLoggedOn.Text == "")
        {
        }
        else
        {

            mtdCheckingComplaintLoggedOnDate();
            //mtdCheckingComplaintLoggedOnDate();
            mtdCOmplaintLoggedCheck();
            mtdTotalDaysCheck();
            //mtdComplaintCloseDueDateCalculationAndUpdation();
            mtdCompareReceivedAdnLoggedDate();
        }

    }
    #endregion

    #region Calculation number of days this compalint has taken to be logged on to the system
    public void mtdTotalDaysCheck()
    {
        if (txtComplaintLoggedOn.Text == "")
        {
        }
        else if (txtComplaintLoggedOn.Text != "")
        {

            DateTime dtCompaintLoggedOndate = Convert.ToDateTime(txtComplaintLoggedOn.Text).Date;
            DateTime dtComplaintReceivedDate = Convert.ToDateTime(txtDate.Text).Date;

            TimeSpan tsTotalDays = dtCompaintLoggedOndate - dtComplaintReceivedDate;

            txtHiddenNoOfDaysCompLogdOn.Text = tsTotalDays.TotalDays.ToString();
        }
    }
    #endregion

    #region Calculation number of days for aging.

    public void mtdAgingCalculationAndUpdation()
    {

        DateTime dtComplaintReceivedDate = DateTime.Parse(txtiCaredate.Text).Date;
        DateTime dtToday = DateTime.Today;

        if (dbChannel.SelectedValue.ToString() == "Agency")
        {
            int iDays = DaysIgnoreWeekends(dtComplaintReceivedDate, dtToday);
            int iAgencyDays = iDays - 8;
            txtAging.Text = iAgencyDays.ToString();
        }

        else if (dbChannel.SelectedValue.ToString() == "AXP")
        {
            int iDays = DaysIgnoreWeekends(dtComplaintReceivedDate, dtToday);
            int iAgencyDays = iDays - 3;
            txtAging.Text = iAgencyDays.ToString();
        }
        else if (dbChannel.SelectedValue.ToString() == "Regulatory")
        {
            int iDays = DaysIgnoreWeekends(dtComplaintReceivedDate, dtToday);
            int iAgencyDays = iDays - 8;
            txtAging.Text = iAgencyDays.ToString();
        }

    }

    #endregion

    #region Calculating Business days ignoring saturday and sunday for aging
    private int DaysIgnoreWeekends(DateTime dtst, DateTime dtend)
    {
        TimeSpan days = dtend.Subtract(dtst);
        int count = 0;
        for (int a = 0; a < days.Days + 1; a++)
        {
            if (dtst.DayOfWeek != DayOfWeek.Saturday && dtst.DayOfWeek != DayOfWeek.Sunday)
            {
                count++;
            }
            dtst = dtst.AddDays(1.0);
        }
        return count;
    }

    #endregion

    #region Calculation complaint closed due date.

    public void mtdComplaintCloseDueDateCalculationAndUpdation()
    {
        if (dbChannel.SelectedValue.ToString() == "Agency")
        {
            if (txtiCaredate.Text == "")
            {
            }
            else if (txtiCaredate.Text != "")
            {
                DateTime dtDate = CalculateBusinessDaysFromInputDate(DateTime.Parse(txtiCaredate.Text).Date, Convert.ToInt16("7"));
                txtComplaintCloseDueDate.Text = dtDate.ToString("MM-dd-yyyy");
            }

        }
        else if (dbChannel.SelectedValue.ToString() == "AXP")
        {
            if (txtiCaredate.Text == "")
            {
            }
            else if (txtiCaredate.Text != "")
            {
                DateTime dtDate = CalculateBusinessDaysFromInputDate(DateTime.Parse(txtiCaredate.Text).Date, Convert.ToInt16("2"));
                txtComplaintCloseDueDate.Text = dtDate.ToString("MM-dd-yyyy");
            }
        }
        else if (dbChannel.SelectedValue.ToString() == "Regulatory")
        {
            if (txtiCaredate.Text == "")
            {
            }
            else if (txtiCaredate.Text != "")
            {
                DateTime dtDate = CalculateBusinessDaysFromInputDate(DateTime.Parse(txtiCaredate.Text).Date, Convert.ToInt16("7"));
                txtComplaintCloseDueDate.Text = dtDate.ToString("MM-dd-yyyy");
            }
        }

        //DateTime dtComplaintLogged = Convert.ToDateTime(txtiCaredate.Text);
        //DateTime dtEndOfComplaintLoggedDate = Convert.ToDateTime(txtiCaredate.Text).AddDays(7);
        //if (dbChannel.SelectedValue.ToString() == "Agency")
        //{
        //    if (txtiCaredate.Text == "")
        //    {
        //    }
        //    else if (txtiCaredate.Text != "")
        //    {
        //        int iNoOfDays = BusinessDays(dtComplaintLogged, dtEndOfComplaintLoggedDate);
        //        txtComplaintCloseDueDate.Text =Convert.ToString(dtComplaintLogged.AddDays(iNoOfDays));
        //    }
        //}
    }

    #endregion

    #region Adding 1 day to RMS due date from complaint logged on date
    public void mtdCOmplaintLoggedCheck()
    {

        if (txtComplaintLoggedOn.Text == "")
        {
        }
        else
        {
            DateTime dtComplaintOLoggedDate = Convert.ToDateTime(txtComplaintLoggedOn.Text).Date;
            DateTime dtRmsDueDate = dtComplaintOLoggedDate.AddDays(1);
            if (dtRmsDueDate.DayOfWeek == DayOfWeek.Saturday)
            {
                txtRmsDueDate.Text = dtRmsDueDate.AddDays(2).ToString("MM-dd-yyyy");
            }
            else if (dtRmsDueDate.DayOfWeek == DayOfWeek.Sunday)
            {
                txtRmsDueDate.Text = dtRmsDueDate.AddDays(1).ToString("MM-dd-yyyy");
            }
            else
            {
                txtRmsDueDate.Text = dtRmsDueDate.ToString("MM-dd-yyyy");
            }
        }
    }
    #endregion

    #region procedure trigger on selection chnage of channel dropdown
    protected void dbChannel_SelectedIndexChanged(object sender, EventArgs e)
    {
        mtdAgingCalculationAndUpdation();
        mtdComplaintCloseDueDateCalculationAndUpdation();
        //mtdCheckingComplaintLoggedOnDate();
        txtComplaintLoggedOn.Text = "";
        txtRmsDueDate.Text = "";
        txtComplaintLoggedOn.Focus();

    }
    #endregion

    #region Check the Complaint Received Date should not be less than Complaint Logged date
    public void mtdCompareReceivedAdnLoggedDate()
    {
        if (txtComplaintLoggedOn.Text != "")
        {
            DateTime dtCompliantReceivedDate = DateTime.Parse(txtDate.Text).Date;
            DateTime dtComplaintLoggedDate = DateTime.Parse(txtComplaintLoggedOn.Text).Date;

            if (dtComplaintLoggedDate < dtCompliantReceivedDate)
            {
                lblMsg.Text = "Complaint Logged on Date cannot be less than Complaint received date";
                //txtComplaintLoggedOn.Text = "";
                //txtRmsDueDate.Text = "";
                txtComplaintLoggedOn.Focus();
                btnSubmit.Enabled = false;
            }
            else
            {
                lblMsg.Text = "";
                btnSubmit.Enabled = true;
            }
        }
        else
        {
        }


    }
    #endregion

    #region Validate iCareN number should not be duplicate

    public void mtdValidateiCareNumber()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_GetiCareNumber", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@niCareNo", SqlDbType.NVarChar, (20)).Value = txtiCareNo.Text;

        SqlDataAdapter sdaiCareNo = new SqlDataAdapter(cmd);
        DataTable dtiCareNo = new DataTable();
        sdaiCareNo.Fill(dtiCareNo);

        if (dtiCareNo.Rows.Count > 0)
        {
            lblMsg1.Text = "iCare No already exists";
            txtiCareNo.Text = "";
            txtiCareNo.Focus();
        }
        else
        {
            lblMsg1.Text = "";
        }

        Conn.Close();
        Conn.Dispose();


    }
    #endregion

    #region iCare date should be not less than complaint received date
    public void mtdValidateiCareDate()
    {
        DateTime dtCompliantReceivedDate = DateTime.Parse(txtDate.Text).Date;
        DateTime dtiCareDate = DateTime.Parse(txtiCaredate.Text).Date;

        if (dtiCareDate < dtCompliantReceivedDate)
        {
            lblMsg.Text = "iCare Date cannot be less than Complaint received date";
            //txtComplaintLoggedOn.Text = "";
            //txtRmsDueDate.Text = "";
            txtiCaredate.Text = "";
            txtiCaredate.Focus();
            btnSubmit.Enabled = false;
        }
        else
        {
            lblMsg.Text = "";
            btnSubmit.Enabled = true;
            mtdComplaintCloseDueDateCalculationAndUpdation();
            mtdAgingCalculationAndUpdation();
        }
    }
    #endregion

    #region Validation procedure called on updation of txtiCareno ( iCare no text box)
    protected void txtiCareNo_TextChanged(object sender, EventArgs e)
    {
        mtdValidateiCareNumber();
    }
    #endregion

    #region Checking which Radio button checked "YES" or "NO" for Comaplaint closed before due date
    protected void rbComplaintClosedwithinDueDate_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (rbComplaintClosedwithinDueDate.SelectedValue.ToString() == "No")
        //{
        //    mtdAgingCalculationAndUpdation();
        //}
        //else if (rbComplaintClosedwithinDueDate.SelectedValue.ToString() == "Yes")
        //{
        //    mtdAgingCalculationAndUpdationWithCloseDate();
        //}
    }
    #endregion

    #region Validatig if the Date received is not greater then current date
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        if (Convert.ToDateTime(txtDate.Text) > DateTime.Today)
        {
            lblMsg.Text = "Complaint Received date cannot be a future date";
            txtDate.Text = "";
            txtDate.Focus();
        }
        else
        {
            lblMsg.Text = "";

        }


    }
    #endregion

    #region Complaint Logged date should not be less than Complaint Received date
    public void mtdCheckingComplaintLoggedOnDate()
    {
        if (txtComplaintLoggedOn.Text == "")
        {
        }

        else if (Convert.ToDateTime(txtComplaintLoggedOn.Text) > DateTime.Today)
        {
            lblMsg.Text = "Complaint Logged on date cannot be a future date";
            txtComplaintLoggedOn.Text = "";
            txtComplaintLoggedOn.Focus();
        }
        else if (Convert.ToDateTime(txtComplaintLoggedOn.Text) <= DateTime.Today)
        {
            DateTime dtComplaintOLoggedDate = Convert.ToDateTime(txtComplaintLoggedOn.Text).Date;
            DateTime dtRmsDueDate = dtComplaintOLoggedDate.AddDays(1);
            txtRmsDueDate.Text = dtRmsDueDate.ToString("MM-dd-yyyy");
        }
        else
        {
            lblMsg.Text = "";
        }
    }
    #endregion

    #region Calculations after iCare Date Text is changed
    protected void txtiCaredate_TextChanged(object sender, EventArgs e)
    {
        //mtdComplaintCloseDueDateCalculationAndUpdation();
        // mtdComplaintCloseDueDateCalculationAndUpdation();
        mtdValidateiCareDate();
        //mtdAgingCalculationAndUpdation();
    }
    #endregion

    #region Clearing all text after posting the data to database
    public void mtdClearAllText()
    {
        txtDate.Text = "";
        txtFileNo.Text = "";
        txtAccountNo.Text = "";
        txtCustName.Text = "";
        dbMode.SelectedItem.Text = "Select";
        dbChannel.SelectedItem.Text = "Select";
        txtComplaintLoggedOn.Text = "";
        txtRmsDueDate.Text = "";
        txtiCareNo.Text = "";
        txtiCaredate.Text = "";
        dbCompCat.SelectedItem.Text = "Select";
        txtAging.Text = "";
        txtComplaintCloseDueDate.Text = "";
        txtComplaintSummary.Text = "";
        txtActionStanding.Text = "";

    }
    #endregion

    #region Calculating Businessdays from the given date as per the mode of selection

    public System.DateTime CalculateBusinessDaysFromInputDate
   (System.DateTime StartDate, int NumberOfBusinessDays)
    {
        //Knock the start date down one day if it is on a weekend.
        if (StartDate.DayOfWeek == DayOfWeek.Saturday |
            StartDate.DayOfWeek == DayOfWeek.Sunday)
        {
            NumberOfBusinessDays -= 1;
        }

        int index = 0;

        for (index = 1; index <= NumberOfBusinessDays; index++)
        {
            switch (StartDate.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    StartDate = StartDate.AddDays(2);
                    break;
                case DayOfWeek.Monday:
                case DayOfWeek.Tuesday:
                case DayOfWeek.Wednesday:
                case DayOfWeek.Thursday:
                case DayOfWeek.Friday:
                    StartDate = StartDate.AddDays(1);
                    break;
                case DayOfWeek.Saturday:
                    StartDate = StartDate.AddDays(3);
                    break;
            }
        }

        //check to see if the end date is on a weekend.
        //If so move it ahead to Monday.
        //You could also bump it back to the Friday before if you desired to. 
        //Just change the code to -2 and -1.
        if (StartDate.DayOfWeek == DayOfWeek.Saturday)
        {
            StartDate = StartDate.AddDays(2);
        }
        else if (StartDate.DayOfWeek == DayOfWeek.Sunday)
        {
            StartDate = StartDate.AddDays(1);
        }

        return StartDate;
    }

    #endregion
}