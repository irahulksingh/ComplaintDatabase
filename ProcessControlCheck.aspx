<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProcessControlCheck.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .Calendar .ajax__calendar_container
        {
            border: 1px solid #646464;
            background-color: #33cc99;
            color: #fff;
            z-index: 180;
            width: 160px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <!-- Javascript Section -->
    <script src="js/jquery-1.11.0.js"></script>
    <!-- Page Content -->
    <div class="container">
                  <h3 class="page-header">
                    <i class="fa fa-fw fa-repeat"></i> Process Control Check</h3>
                       <asp:Label ID="lblMsg" runat="server" CssClass="auto-style3" style="color: #FF0000; font-weight: bold"></asp:Label>
                        <asp:Label ID="lblMsg1" runat="server" CssClass="auto-style3" style="color: #FF0000; font-weight: bold"></asp:Label>
                        <br />
         <div class="row">
              <div class="col-lg-6">
   
  <div class="col-lg-6">
    <div class="input-group">
        <asp:TextBox ID="txtiCareNumber" CssClass="form-control" runat="server" width="200px" placeholder="Enter iCare No."></asp:TextBox><br />
      <span class="input-group-btn">
     <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="False"  class="btn btn-danger"/>

                      
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->

                      <div class="row">
            <div class="panel panel-default" style="height:403px;background-color:#E8E9E8">        
            <div class="col-lg-12">
                    <div class="panel-heading" >
                    
                         <div class="col-xs-3" >
                    <label class="control-label">Client Code:</label>
                     <asp:TextBox ID="txtClientCode" runat="server" AutoPostBack="True" BackColor="White" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                         </div>   
                        
                    <div class="col-xs-3" >
                    <label class="control-label">Complaint Recvd Date :</label>
                     <asp:TextBox ID="txtDate" runat="server" AutoPostBack="True" BackColor="White" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                         </div>
                        <div class="col-xs-3" >
                    <label class="control-label">File No :</label>
                        <asp:TextBox ID="txtFileNo" runat="server"  CssClass="form-control"  BackColor="White" ReadOnly="True"></asp:TextBox>
                            </div>
              <div class="col-xs-3">
                <label class="control-label">iCare Number:</label>
                <asp:TextBox ID="txtiCareNo" runat="server"    CssClass="form-control" BackColor="White" ReadOnly="True" AutoPostBack ="True"  tabIndex="2" ></asp:TextBox>
                                       
            </div>
                <div class="col-xs-3">
                <label class="control-label">iCare Date:</label>
                <asp:TextBox ID="txtiCaredate" runat="server"   CssClass="form-control" BackColor="White" ReadOnly="True" AutoPostBack="True"  tabIndex="3" ></asp:TextBox>
               </div>
                <div class="col-xs-3">
                <label class="control-label">Account Number:</label>
                <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control" BackColor="White" ReadOnly="True" tabIndex="4" ></asp:TextBox>
                </div>
                <div class="col-xs-3">
                    <label class="control-label">Customer Name:</label>
                    <asp:TextBox ID="txtCustName" runat="server"   CssClass="form-control" BackColor="White"  ReadOnly="True"   tabIndex="5" ></asp:TextBox>
                     </div>
                <div class="col-xs-3">
                    <label class="control-label">Mode of Communication :</label>
                        <asp:TextBox ID="txtModeOfComm" runat="server"   CssClass="form-control" BackColor="White" AutoPostBack="True" ReadOnly="True" ></asp:TextBox></td>
          </div>
                       <div class="col-xs-3">
                    <label class="control-label">Complaint Type:</label>
                     <asp:TextBox ID="txtChannel" runat="server"  CssClass="form-control" BackColor="White" AutoPostBack="True" ReadOnly="True" ></asp:TextBox>
             </div>
                <div class="col-xs-3">
                    <label class="control-label">Complaint Reason:</label>
                     <asp:TextBox ID="txtComplaintCategory" runat="server" CssClass="form-control" BackColor="White" AutoPostBack="True" ReadOnly="True" ></asp:TextBox>
           </div> <div class="col-xs-3">
                        <label class="control-label">Complaint Close Due Date:</label>
                        <asp:TextBox ID="txtComplaintCloseDueDate" runat="server" CssClass="form-control" BackColor="White" MaxLength="9" ReadOnly="True" ></asp:TextBox>
                </div>
              <div class="col-xs-3" >
              <label class="control-label">Aging:</label>
                        <asp:TextBox ID="txtAging" runat="server" CssClass="form-control" BackColor="White" MaxLength="9" ReadOnly="True" ></asp:TextBox>
                  </div>
                <div class="col-xs-3">
                     <label class="control-label">Complaint Logged On:</label>
                    <asp:TextBox ID="txtComplaintLoggedOn" runat="server" AutoPostBack="True" CssClass="form-control" BackColor="White" MaxLength="8" ReadOnly="True" TabIndex="8" ></asp:TextBox>
                   </div>   
                         <div class="col-xs-3">
                        <label class="control-label">RMS Due Date:</label>
                        <asp:TextBox ID="txtRmsDueDate" runat="server" CssClass="form-control" BackColor="White" MaxLength="9" ReadOnly="True" ></asp:TextBox>
                </div>
                    <div class="col-xs-3">
                         <label class="control-label">Action Outstanding (Old):</label>
                        <asp:TextBox ID="txtActionOutstandingPrev" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True"  MaxLength="200" tabIndex="11" TextMode="MultiLine"></asp:TextBox>
                        </div>
                <div class="col-xs-3">
                     <label class="control-label">Complaint Summary:</label>
                    <asp:TextBox ID="txtComplaintSummary" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True" MaxLength="1000" tabIndex="10" TextMode="MultiLine" ></asp:TextBox>
                      </div>
                        <div class="col-xs-3">
                     <label class="control-label">Complaint Reject Date:</label>
                    <asp:TextBox ID="txtComRejDate" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True" MaxLength="1000" tabIndex="10" TextMode="MultiLine" ></asp:TextBox>
                      </div>
                        <div class="col-xs-3">
                     <label class="control-label">Complaint Reject Comments:</label>
                    <asp:TextBox ID="txtComRejCom" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True" MaxLength="1000" tabIndex="10" TextMode="MultiLine" ></asp:TextBox>
                      </div>
                        <div class="col-xs-3">
                     <label class="control-label">Reject Resolution Date:</label>
                    <asp:TextBox ID="txtRejResDate" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True" MaxLength="1000" tabIndex="10" TextMode="MultiLine" ></asp:TextBox>
                      </div>
                        <div class="col-xs-3">
                     <label class="control-label">Reject Resolution Comment:</label>
                    <asp:TextBox ID="txtRejResCom" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True" MaxLength="1000" tabIndex="10" TextMode="MultiLine" ></asp:TextBox>
                      </div>
                        <div class="col-xs-12">
                     <label class="control-label">Action Outstanding (New):</label>
                     <asp:TextBox ID="txtActionOutstandingNew" runat="server" CssClass="form-control" MaxLength="1000" BackColor="White" Height="40px"
                    TextMode="MultiLine" Font-Names="Segoe UI Semibold"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field" ControlToValidate="txtActionOutstandingNew" style="font-size: xx-small; font-weight: 700; color: #FF0000"></asp:RequiredFieldValidator>
                             <br />
                         
                       <div class="col-lg-12" >
                       <asp:Button ID="btnSubmit" runat="server"  class="btn btn-success btn-lg pull-right" Text="Save" OnClick="btnSubmit_Click" />
              
       </div>
                      </div>
                       
                 
               </div></div>
              </div> 
              </div></div>
                     </div>
             
                </asp:Content>

