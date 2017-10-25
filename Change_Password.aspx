<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="js/jquery-1.11.0.js"></script>
     <!-- Header Carousel -->
   
     <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
       <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                    <i class="fa fa-fw fa-lock"></i>Change Password</h3>
            </div>
             <div class="col-md-3">
                <div class="panel panel-default" >
                    <div class="panel-heading" style="background-color:#33cc99;color:white;height:40px">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF0000" style="color: #FFFF66; font-size: small; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"></asp:Label>
                         </div>
                    <div class="panel-body" dir="ltr"> Old Password:
                          <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-group" TextMode="Password"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtOldPassword"
                    ErrorMessage="*" CssClass="auto-style1"></asp:RequiredFieldValidator>
                          <br />
                    New Password:
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-group" TextMode="Password"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword"
                    ErrorMessage="*" CssClass="auto-style1"></asp:RequiredFieldValidator><br />
                
                Retype New Password:
                <asp:TextBox ID="txtRetypeNewPassword" runat="server" CssClass="form-horizontal" TextMode="Password"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRetypeNewPassword"
                    ErrorMessage="*" CssClass="auto-style1"></asp:RequiredFieldValidator>
                        <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPassword"
                    ControlToValidate="txtRetypeNewPassword" ErrorMessage="New Password does not match" style="font-size: xx-small; color: #FF0000"></asp:CompareValidator>
                        <br />
                        <div dir="rtl">
                <asp:Button ID="btnSavePassword" runat="server" CssClass="btn btn-success btn-sm pull-right" OnClick="btnSavePassword_Click" Text="Save New Password" Width="143px" />
                     </div></div>
                </div>
            </div>
           
                         
     <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color:#33cc99;color:White;height:40px">
                        <h5><i class="glyphicon glyphicon-stats"></i>  Instructions</h5>
                    </div>
                    <div class="panel-body">
                        <ul>
                            <li>Change your password every 45 days.</li>
                            <li>Don&#39;t share your password.</li>
                            <li>Password must be alpha-numeric.</li>
                            <li>Use atleast one special character in your password.</li>
                        </ul>
                        <p style="text-align:center">  </p>
                    </div>
                </div>
            </div>      </div>
               
                        </div>        
               
        <!-- /.row -->

        <!-- Portfolio Section -->
       
        <!-- /.row -->

        <!-- Features Section -->
        <div class="row">
            <div class="col-lg-12">
            </div>
            <div class="col-md-6">
                &nbsp;</div>
        </div>
        <!-- /.row -->
       

        <hr>
        <script src="js/jquery-1.11.0.js"></script>
        
        <!-- Call to Action Section -->
        <div>
        </div>
        
         

        
    </asp:Content>

