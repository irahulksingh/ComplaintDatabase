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
using System.Security.Principal;

public partial class LoginCheck : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand Cmd = new SqlCommand("sp_CheckDomainLogin", Conn);
        Cmd.CommandType = CommandType.StoredProcedure;

       // string Logged_User = WindowsIdentity.GetCurrent().Name;
      //string Logged_User = HttpContext.Current.User.Identity.Name.ToString();

        string Logged_User = HttpContext.Current.Request.LogonUserIdentity.Name.ToString();

        string Logged_User_ToSplit = HttpContext.Current.Request.LogonUserIdentity.Name.ToString();

        string[] stSplit = Logged_User_ToSplit.Split('\\');

       

        string stUserDomainName = stSplit[0];
        string stUserName = stSplit[1];

        Cmd.Parameters.Add("@nDomainName", SqlDbType.NVarChar, (50)).Value = Convert.ToString(stUserDomainName);
        Cmd.Parameters.Add("@nUserName", SqlDbType.NVarChar, (50)).Value = Convert.ToString(stUserName);
        
        Cmd.ExecuteNonQuery();

        SqlDataAdapter daLogin = new SqlDataAdapter(Cmd);
        DataTable dtLoginCheck = new DataTable();
        daLogin.Fill(dtLoginCheck);

        string user_name = dtLoginCheck.Rows[0]["nDomainName"].ToString() + "\\" + dtLoginCheck.Rows[0]["nUserName"].ToString();

        if (dtLoginCheck.Rows.Count != 0)
        {
          
            if (Convert.ToString(Logged_User) == Convert.ToString(user_name))
            {
                Session["Name"] = dtLoginCheck.Rows[0]["nEmpName"].ToString();
                Session["LastLogin"] = dtLoginCheck.Rows[0]["nLastLogin"].ToString();
                Session["Designation"] = dtLoginCheck.Rows[0]["nEmpDesignation"].ToString();
                Session["Role"] = dtLoginCheck.Rows[0]["nEmpRole"].ToString();
                UpdateLastLogin();
                Server.Transfer("Dashboard.aspx");
               
            }
            else
            {
                Server.Transfer("NotAUTHORIZED.aspx");

            }
           
        }
        else
        {
            Server.Transfer("NotAUTHORIZED.aspx");

        }
        
    }

    #region Updating the Last Login Time and Date
    public void UpdateLastLogin()
    {

        //string stUserDomainName = System.Environment.UserDomainName;
        //string stUserName = System.Environment.UserName;

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand CmdUpdateTime = new SqlCommand("sp_UpdateLastLogin", Conn);

        string Logged_User_ToSplit = HttpContext.Current.Request.LogonUserIdentity.Name.ToString();

        string[] stSplit = Logged_User_ToSplit.Split('\\');

        string stUserDomainName = stSplit[0];
        string stUserName = stSplit[1];
        CmdUpdateTime.CommandType = CommandType.StoredProcedure;
        CmdUpdateTime.Parameters.Add("@nDomainName", SqlDbType.NVarChar, (50)).Value = stUserDomainName;
        CmdUpdateTime.Parameters.Add("@nUserName", SqlDbType.NVarChar, (50)).Value = stUserName;
        CmdUpdateTime.Parameters.Add("@nLastLogin", SqlDbType.NVarChar, (50)).Value = DateTime.Now.ToString("MM-dd-yyyy HH:mm");
        CmdUpdateTime.ExecuteNonQuery();
        Conn.Close();
        Conn.Dispose();
    }
    #endregion

}