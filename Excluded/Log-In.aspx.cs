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

public partial class Log_In : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region All actions after login button click
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand Cmd = new SqlCommand("sp_Login", Conn);
        Cmd.CommandType = CommandType.StoredProcedure;

        Cmd.Parameters.Add("@LoginId", SqlDbType.NVarChar, (50)).Value = txtLoginId.Text;
        Cmd.Parameters.Add("@Password", SqlDbType.NVarChar, (50)).Value = txtPassword.Text;

        Cmd.ExecuteNonQuery();

        DataTable dtLogin = new DataTable();
        SqlDataAdapter daLogin = new SqlDataAdapter(Cmd);

        daLogin.Fill(dtLogin);

        if (dtLogin.Rows.Count > 0)
        {
            Session["LoginId"] = txtLoginId.Text;
            Session["Password"] = txtPassword.Text;
            Session["Name"] = dtLogin.Rows[0]["nEmpName"].ToString();
            Session["LastLogin"] = dtLogin.Rows[0]["nLastLogin"].ToString();
            Session["Designation"] = dtLogin.Rows[0]["nEmpDesignation"].ToString();
            Session["Role"] = dtLogin.Rows[0]["nUserRole"].ToString();
            if (CheckUserLastLogin() == false)
            {
                Response.Redirect("ChangePassword.aspx");
            }
            else
            {
                UpdateLastLogin();
                Response.Redirect("Dashboard.aspx");
            }
        }
        else
        {
            lblMsg.Text = "Login Id or password Incorrect";

        }
        Conn.Close();
        Conn.Dispose();

    }
    #endregion

    #region Updating the Last Login Time and Date
    public void UpdateLastLogin()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand CmdUpdateTime = new SqlCommand("sp_UpdateLastLogin", Conn);
        CmdUpdateTime.CommandType = CommandType.StoredProcedure;
        CmdUpdateTime.Parameters.Add("@nLoginId", SqlDbType.NVarChar, (50)).Value = txtLoginId.Text;
        CmdUpdateTime.Parameters.Add("@nLastLogin", SqlDbType.NVarChar, (50)).Value = DateTime.Now.ToString("MM-dd-yyyy HH:mm");
        CmdUpdateTime.ExecuteNonQuery();
        Conn.Close();
        Conn.Dispose();


    }
    #endregion

    #region Checking Users last login to prompt for password change on first login
    public bool CheckUserLastLogin()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand cmd = new SqlCommand("sp_CheckLastLogin", Conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@nLoginId", SqlDbType.VarChar, (20)).Value = txtLoginId.Text;

        SqlDataAdapter daChkLastLogin = new SqlDataAdapter(cmd);
        DataTable dtChkLastLogin = new DataTable();
        daChkLastLogin.Fill(dtChkLastLogin);
        Conn.Close();
        Conn.Dispose();

        if (dtChkLastLogin.Rows.Count > 0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    #endregion
}