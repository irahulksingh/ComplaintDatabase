<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="New_complaints1.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .auto-style2
        {
            width: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel id ="panel1" runat="server">
        
    
    <script src="js/jquery-1.11.0.js"></script>
     <!-- Header Carousel -->
   
  

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
       <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                   <i class="glyphicon glyphicon-tasks"></i> New Complaint</h3>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                     
                            <table  border="0" class="table-responsive">
                                                               <tr>
                                    <td>                                        <asp:Label ID="lblMsg"  runat="server" ForeColor="#FF0000"></asp:Label>
                                        <asp:Label ID="lblMsg1"  runat="server" ForeColor="#FF0000"></asp:Label><hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="1" rowspan="10"></td>
                                    <td colspan="6"></td>
                                </tr>
                                <tr>
                                    <td>Date Compliant Received :</td>
                                    <td class="col-md-3">
                                        <asp:TextBox ID="txtDate" runat="server"  AutoPostBack ="True" CssClass="form-control"  OnTextChanged="txtDate_TextChanged" Width="150px"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                       
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>File Number :</td>
                                    <td  class="col-md-3">
                                        <asp:TextBox ID="txtFileNo" runat="server"   CssClass="form-control"  tabIndex="1" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFileNo" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>iCare Number:</td>
                                    <td  class="span2">
                                        <asp:TextBox ID="txtiCareNo" runat="server"    CssClass="form-control"  AutoPostBack ="True" OnTextChanged="txtiCareNo_TextChanged" tabIndex="2" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtiCareNo" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>iCare Date:</td>
                                    <td  class="span2">
                                        <asp:TextBox ID="txtiCaredate" runat="server"   CssClass="form-control"  AutoPostBack="True" OnTextChanged="txtiCaredate_TextChanged" tabIndex="3" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtiCaredate" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Account Number :</td>
                                    <td>
                                        <asp:TextBox ID="txtAccountNo" runat="server"    tabIndex="4" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAccountNo" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>Customer Name:</td>
                                    <td>
                                        <asp:TextBox ID="txtCustName" runat="server"    tabIndex="5" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCustName" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Mode of Communication :</td>
                                    <td>
                                        <asp:DropDownList ID="dbMode" runat="server"    tabIndex="6" Width="152px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dbMode" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" InitialValue="Select" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td><span>Channel:</span></td>
                                    <td>
                                        
                                        <asp:DropDownList ID="dbChannel" runat="server"    AutoPostBack="True" OnSelectedIndexChanged="dbChannel_SelectedIndexChanged" tabIndex="7" Width="152px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dbChannel" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" InitialValue="Select" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>Complaint Logged On:</td>
                                    <td>
                                        <asp:TextBox ID="txtComplaintLoggedOn"  runat="server"    AutoPostBack="True" MaxLength="8" OnTextChanged="txtComplaintLoggedOn_TextChanged" Width="150px" TabIndex="8"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtComplaintLoggedOn" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>RMS Due Date:</td>
                                    <td>
                                        <asp:TextBox ID="txtRmsDueDate" runat="server"    MaxLength="9" ReadOnly="True" Width="150px" BackColor="White"></asp:TextBox>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Complaint Category:</td>
                                    <td>
                                        <asp:DropDownList ID="dbCompCat"    runat="server" tabIndex="9" Width="154px">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="dbCompCat" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" InitialValue="Select" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>Aging :</td>
                                    <td>
                                        <asp:TextBox ID="txtAging" runat="server"    Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="10pt" ReadOnly="True" tabIndex="11" Width="39px" BackColor="White"></asp:TextBox>
                                        Day/s</td>
                                    <td>
                                        <asp:TextBox ID="txtHiddenNoOfDaysCompLogdOn" runat="server"  Visible="False" Width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Complaint Close Due Date:</td>
                                    <td>
                                        <asp:TextBox ID="txtComplaintCloseDueDate" runat="server"    ReadOnly="True" Width="150px" BackColor="White"></asp:TextBox>
                                        <br />
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><span>Complaint Summary:</span></td>
                                    <td class="auto-style2">
                                        <asp:TextBox ID="txtComplaintSummary" runat="server"  Height="75px"  Font-Names="Segoe UI Semibold" Font-Size="8pt"  MaxLength="1000" tabIndex="10" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtComplaintSummary" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>Action Outstanding:</td>
                                    <td>
                                        <asp:TextBox ID="txtActionStanding" runat="server"  Height="75px"  Font-Names="Segoe UI Semibold" Font-Size="8pt"  MaxLength="200" tabIndex="11" TextMode="MultiLine" Width="300px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtActionStanding" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style1"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" Text="Submit" TabIndex="12" />
                                    </td>
                                </tr>
                            </table>
                           </div>
                      
                        </div>
                    </div>
                </div>
            </div>
   
        <!-- /.row -->

        <!-- Portfolio Section -->
       
        <!-- /.row -->

        <!-- Features Section -->
         
        <!-- /.row -->
       

        <script src="js/jquery-1.11.0.js"></script></asp:Panel>
        
        <!-- Call to Action Section -->
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM-dd-yyyy" PopupPosition="Right"
                                TargetControlID="txtDate"></cc1:CalendarExtender>
        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="MM-dd-yyyy"
                                PopupPosition="Right" TargetControlID="txtiCaredate"></cc1:CalendarExtender>
        <cc1:CalendarExtender ID="CalendarExtender3" runat="server" Format="MM-dd-yyyy" PopupPosition="Right"
                                TargetControlID="txtComplaintLoggedOn" Enabled="True"></cc1:CalendarExtender>
        <cc1:CalendarExtender ID="CalendarExtender4"  runat="server" Format="MM-dd-yyyy"
                                PopupPosition="Right" TargetControlID="txtiCaredate"></cc1:CalendarExtender>
         

        
    </asp:Content>

