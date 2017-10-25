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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            mtdLoginCheck();
           // txtLoginId.Focus();
        
    }

    #region All actions when user opens the link and the system validates on the basis of domain and username
    public void mtdLoginCheck()
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
                // UpdateLastLogin();
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
    #endregion

    #region Updating the Last Login Time and Date
    public void UpdateLastLogin()
    {

        string stUserDomainName = System.Environment.UserDomainName;
        string stUserName = System.Environment.UserName;

        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand CmdUpdateTime = new SqlCommand("sp_UpdateLastLogin", Conn);
        CmdUpdateTime.CommandType = CommandType.StoredProcedure;
        CmdUpdateTime.Parameters.Add("@nDomainName", SqlDbType.NVarChar, (50)).Value = stUserDomainName;
        CmdUpdateTime.Parameters.Add("@nUserName", SqlDbType.NVarChar, (50)).Value = stUserName;
        CmdUpdateTime.Parameters.Add("@nLastLogin", SqlDbType.NVarChar, (50)).Value = DateTime.Now.ToString("MM-dd-yyyy HH:mm");
        CmdUpdateTime.ExecuteNonQuery();
        Conn.Close();
        Conn.Dispose();


    }
    #endregion

    //#region Checking Users last login to prompt for password change on first login
    //public bool CheckUserLastLogin()
    //{
    //    SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
    //    Conn.Open();
    //    SqlCommand cmd = new SqlCommand("sp_CheckLastLogin", Conn);
    //    cmd.CommandType = CommandType.StoredProcedure;

    //    cmd.Parameters.Add("@nLoginId", SqlDbType.VarChar, (20)).Value = txtLoginId.Text;

    //    SqlDataAdapter daChkLastLogin = new SqlDataAdapter(cmd);
    //    DataTable dtChkLastLogin = new DataTable();
    //    daChkLastLogin.Fill(dtChkLastLogin);
    //    Conn.Close();
    //    Conn.Dispose();

    //    if (dtChkLastLogin.Rows.Count > 0)
    //    {
    //        return false;
    //    }
    //    else
    //    {
    //        return true;
    //    }
    //}
    //#endregion

    //public static string EncodePasswordToBase64(string password)
    //{
    //    byte[] bytes = Encoding.Unicode.GetBytes(password);
    //    byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
    //    return Convert.ToBase64String(inArray);
    //}
}