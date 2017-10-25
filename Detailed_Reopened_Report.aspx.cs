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
                    btnExporttoExcel.Visible = false;
                    mtdComplaintsReportGrid_OpenComplaints();

                }
            }

        }
    }

    #region Updateing Grid with Open Complainst Detail Till date
    public void mtdComplaintsReportGrid_OpenComplaints()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand Cmd = new SqlCommand("sp_Get_Complaints_reopened_status", Conn);
        Cmd.CommandType = CommandType.StoredProcedure;
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
            grdComplaintsReport.DataSource = dtLogin;
            grdComplaintsReport.DataBind();

          //  grdComplaintsReport.Columns[14].Visible = false;
           // grdComplaintsReport.Columns[15].Visible = false;
           // grdComplaintsReport.Columns[16].Visible = false;
            btnExporttoExcel.Visible = true;
        }
        Conn.Close();
        Conn.Dispose();
    }
    #endregion

 #region Export to excel method

    public void Exporttoexcel()
    {

        //grdComplaintsReport.Columns[14].Visible = true;
        //grdComplaintsReport.Columns[15].Visible = true;
        //grdComplaintsReport.Columns[16].Visible = true;
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Reopened_Complaints_Report.xls");
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
    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
        Exporttoexcel();
    }
 #endregion
}
