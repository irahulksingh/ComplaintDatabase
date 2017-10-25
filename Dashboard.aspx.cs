using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      
        if (!IsPostBack)
        {
            //if (Request.UrlReferrer == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{

                //if (Session.Count == 0)
                //{
                //    Response.Redirect("Login.aspx");
                //}
                //else
                //{
           
                    mtdComplaintOpenCount();
                    mtdComplaintClosedCount();
                    mtdTotalNoOfComplaint();
                    mtdTotalReopenedComplaint();
                    ((Label)Master.FindControl("lblName")).Text = Session["Name"].ToString();
                    //((Label)Master.FindControl("lblLastLogin")).Text = Session["LastLogin"].ToString();


                //}
            //}
        }
    }
    public void mtdComplaintOpenCount()
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_CountComplaintsOpen", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sdaComplaintsOpen = new SqlDataAdapter(cmd);
        DataTable dtComplaintsOpen = new DataTable();

        sdaComplaintsOpen.Fill(dtComplaintsOpen);


        if (dtComplaintsOpen.Rows.Count == 0)
        {
            lblOpenComplaints.Text = "0";

        }
        else
        {
            lblOpenComplaints.Text = dtComplaintsOpen.Rows[0][0].ToString();
        }
    }

    public void mtdComplaintClosedCount()
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_CountComplaintsClosed", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sdaComplaintsOpen = new SqlDataAdapter(cmd);
        DataTable dtComplaintsOpen = new DataTable();

        sdaComplaintsOpen.Fill(dtComplaintsOpen);


        if (dtComplaintsOpen.Rows.Count == 0)
        {
            lblClosedComplaints.Text = "0";

        }
        else
        {
            lblClosedComplaints.Text = dtComplaintsOpen.Rows[0][0].ToString();
        }
    }


    public void mtdTotalNoOfComplaint()
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_CountTotalNoOfComplaints", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sdaComplaintsOpen = new SqlDataAdapter(cmd);
        DataTable dtComplaintsOpen = new DataTable();

        sdaComplaintsOpen.Fill(dtComplaintsOpen);


        if (dtComplaintsOpen.Rows.Count == 0)
        {
            lblTotalComplaints.Text = "0";

        }
        else
        {
            lblTotalComplaints.Text = dtComplaintsOpen.Rows[0][0].ToString();
        }
    }

    public void mtdTotalReopenedComplaint()
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_CountComplaintsReopened", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlDataAdapter sdaComplaintsOpen = new SqlDataAdapter(cmd);
        DataTable dtComplaintsOpen = new DataTable();

        sdaComplaintsOpen.Fill(dtComplaintsOpen);


        if (dtComplaintsOpen.Rows.Count == 0)
        {
            lblReopenedComplaints.Text = "0";

        }
        else
        {
            lblReopenedComplaints.Text = dtComplaintsOpen.Rows[0][0].ToString();
        }
    }
    
}