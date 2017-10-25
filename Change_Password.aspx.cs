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

    protected void btnSavePassword_Click(object sender, EventArgs e)
    {
        if (CheckOldPassword() == false)
        {
            lblMsg.Text = "Old Password does not match";
        }
        else
        {
            UpdateNewPassword();
            UpdateLastLogin();
            lblMsg.Text = "Password Changed Successfully";
        }



    }
    public bool CheckOldPassword()
    {

        string EncrptedPwd = EncodePasswordToBase64(txtOldPassword.Text);
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand Cmd = new SqlCommand("sp_Login", Conn);
        Cmd.CommandType = CommandType.StoredProcedure;

        Cmd.Parameters.Add("@LoginId", SqlDbType.NVarChar, (50)).Value = Session["LoginId"].ToString();
        Cmd.Parameters.Add("@Password", SqlDbType.NVarChar, (50)).Value = EncrptedPwd;

        Cmd.ExecuteNonQuery();

        DataTable dtLogin = new DataTable();
        SqlDataAdapter daLogin = new SqlDataAdapter(Cmd);

        daLogin.Fill(dtLogin);
        Conn.Close();
        Conn.Dispose();
        
        if (dtLogin.Rows.Count > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public void UpdateNewPassword()
    {

        string EncrptedPwd = EncodePasswordToBase64(txtNewPassword.Text);
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand CmdUpdateTime = new SqlCommand("sp_UpdateNewPassword", Conn);
        CmdUpdateTime.CommandType = CommandType.StoredProcedure;
        CmdUpdateTime.Parameters.Add("@nLoginId", SqlDbType.NVarChar, (50)).Value = Session["LoginId"].ToString();
        CmdUpdateTime.Parameters.Add("@nNewPassword", SqlDbType.NVarChar, (50)).Value = EncrptedPwd;
        CmdUpdateTime.ExecuteNonQuery();
        Conn.Close();
        Conn.Dispose();
    }
    public void UpdateLastLogin()
    {
        SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString2DB"].ConnectionString);
        Conn.Open();
        SqlCommand CmdUpdateTime = new SqlCommand("sp_UpdateLastLogin", Conn);
        CmdUpdateTime.CommandType = CommandType.StoredProcedure;
        CmdUpdateTime.Parameters.Add("@nLoginId", SqlDbType.NVarChar, (50)).Value = Session["LoginId"].ToString();
        CmdUpdateTime.Parameters.Add("@nLastLogin", SqlDbType.NVarChar, (50)).Value = DateTime.Now.ToString("MM-dd-yyyy HH:mm");
        CmdUpdateTime.ExecuteNonQuery();
        Conn.Close();
        Conn.Dispose();


    }

    public static string EncodePasswordToBase64(string password)
    {
        byte[] bytes = Encoding.Unicode.GetBytes(password);
        byte[] inArray = HashAlgorithm.Create("SHA1").ComputeHash(bytes);
        return Convert.ToBase64String(inArray);
    }
}