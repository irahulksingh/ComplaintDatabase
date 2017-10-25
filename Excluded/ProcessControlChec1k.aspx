<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProcessControlChec1k.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
                   <i class="glyphicon glyphicon-tasks"></i> Process Control Check</h3>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                     
                            <table>
                                                               <tr>
                                    <td colspan="7">
                                        <span>Search:<br /> (iCare No):
                                        <asp:TextBox ID="txtiCareNumber" CssClass="form-group" runat="server" Width="225px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtiCareNumber" ErrorMessage="*" Font-Size="Small" ValidationGroup="iCareNo"></asp:RequiredFieldValidator>
                                        <asp:Button ID="btnSearch0" runat="server" onclick="btnSearch_Click" Text="Search" ValidationGroup="iCareNo" />
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7">
                                        <asp:Label ID="lblMsg" runat="server" ForeColor="#FF0000"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td rowspan="10"></td>
                                    <td>Complaint Receive Date :</td>
                                    <td>
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-group" ReadOnly="True" Width="150px"></asp:TextBox>
                                    </td>
                                    <td></td>
                                    <td>File Number:</td>
                                    <td>
                                        <asp:TextBox ID="txtFileNo" runat="server" CssClass="form-group" ReadOnly="True" Width="150px"></asp:TextBox>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Account Number :</td>
                                    <td>
                                        <asp:TextBox ID="txtAccountNo" runat="server" Width="150px" ReadOnly="True"></asp:TextBox> 
                                       
                                    </td>
                                    <td>
                                        </td>
                                    <td>Channel:</td>
                                    <td>
                                        <asp:TextBox ID="txtChannel" runat="server" CssClass="form-group" Width="150px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td>Customer Name:</td>
                                    <td>
                                        <asp:TextBox ID="txtCustName" runat="server" CssClass="form-group" Width="150px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                    <td>Mode of Communication :</td>
                                    <td>
                                        <asp:TextBox ID="txtModeOfComm" runat="server" CssClass="form-group" Width="150px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td>Complaint Logged On:</td>
                                    <td>
                                        <asp:TextBox ID="txtComplaintLoggedOn" runat="server" CssClass="form-group" Width="150px" AutoPostBack="True" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                    <td>RMS Due Date:</td>
                                    <td>
                                        <asp:TextBox ID="txtRmsDueDate" runat="server" CssClass="form-group" Width="150px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td>iCare Date:</td>
                                    <td>
                                        <asp:TextBox ID="txtiCaredate" runat="server" ReadOnly="True" CssClass="form-group" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                    <td>Complaint Category:</td>
                                    <td>
                                        
                                        <asp:TextBox ID="txtComplaintCategory" runat="server" ReadOnly="True" CssClass="form-group" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td>Complaint Close Due Date:</td>
                                    <td>
                                        <asp:TextBox ID="txtComplaintCloseDueDate"  runat="server" CssClass="form-group" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                    <td>Aging:</td>
                                    <td>
                                        <asp:TextBox ID="txtAging" runat="server" ReadOnly="True" CssClass="form-group" Width="150px" Font-Bold="True" Font-Names="Calibri" Font-Size="12pt"></asp:TextBox>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Complaint Summary:</td>
                                    <td colspan="4">
                                        <asp:TextBox ID="txtComplaintSummary" runat="server" CssClass="form-group" Font-Names="Segoe UI Semibold" Font-Size="9pt" Height="46px" MaxLength="1000" ReadOnly="True" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                    </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td>Action Outstanding(Previous):</td>
                                    <td colspan="4">
                                        <asp:TextBox ID="txtActionOutstandingPrev" runat="server" CssClass="form-group" Height="44px"  ReadOnly="True" Width="600px" Font-Names="Segoe UI Semibold" Font-Size="9pt" MaxLength="1000" TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Action Outstanding (New):</td>
                                    <td colspan="4">
                                        <asp:TextBox ID="txtActionOutstandingNew" runat="server" CssClass="form-group" Height="41px"  Font-Names="Segoe UI Semibold" Font-Size="9pt"  MaxLength="1000" TextMode="MultiLine" Width="600px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtActionOutstandingNew" ErrorMessage="Required field" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" Text="Save &amp; Submit" />
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
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
                 

        
    </asp:Content>

