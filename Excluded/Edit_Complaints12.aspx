<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Edit_Complaints12.aspx.cs" Inherits="Default2" %>

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
                   <i class="glyphicon glyphicon-tasks"></i> Edit Complaint</h3>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                       <table border="0" style="font-size: 10pt; width: 100%;
        font-family: 'Segoe UI Semibold'; background-color: #ffffff; text-align: left">
        <tr style="color: #000000">
            <td colspan="7" style="font-size: 10pt; height: 11px; background-color: #f5f5f5;
                text-align: left">
                <asp:Label ID="lblMsg" runat="server" ForeColor="#FF0000"></asp:Label>&nbsp;</td>
        </tr>
        <tr style="color: #000000">
            <td colspan="7" style="font-size: 10pt; height: 11px; background-color: #f5f5f5;
                text-align: left">
                <span style="font-size: 12pt">Search :<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearchBox"
                    ErrorMessage="Required field" Font-Size="X-Small" style="font-size: small; color: #FF0000"></asp:RequiredFieldValidator><br />
                </span>
                <span style="font-size: 8pt">(Account No/Customer Name/File No/ iCare No) : </span>
                <asp:TextBox ID="txtSearchBox" runat="server" CssClass="form-group" Width="225px"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClearAll" runat="server" OnClick="btnClearAll_Click" Text="Clear All" CausesValidation="False" /></td>
        </tr>
        <tr style="color: #000000">
            <td colspan="7" style="font-size: 10pt; height: 1px; background-color: whitesmoke;
                text-align: left">
            </td>
        </tr>
        <tr style="color: #000000">
            <td colspan="7" style="font-size: 10pt; height: 1px; background-color: whitesmoke;
                text-align: left">
                <asp:GridView ID="grdSearchResult" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt"
                    GridLines="None" OnRowCommand="grdSearchResult_RowCommand" BorderColor="#0066FF" BorderStyle="Solid" BorderWidth="1px" ForeColor="#333333">
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:ButtonField CommandName="Select" Text="Select" HeaderText="SELECT" />
                        <asp:BoundField DataField="nDateReceived" HeaderText="Date Received" />
                        <asp:BoundField DataField="nFileNo" HeaderText="File No." />
                        <asp:BoundField DataField="nAccountNo" HeaderText="Account No." />
                        <asp:BoundField DataField="nCustomerName" HeaderText="Customer Name" >
                            <ItemStyle Font-Size="Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nMode" HeaderText="Mode" >
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nChannel" HeaderText="Channel" />
                        <asp:BoundField DataField="nComplaintLoggedDate" HeaderText="Complaint Logged Date" />
                        <asp:BoundField DataField="nRMSdueDate" HeaderText="RMS Due Date" />
                        <asp:BoundField DataField="niCareDate" HeaderText="iCare Date" />
                        <asp:BoundField DataField="niCareNo" HeaderText="iCare No." />
                        <asp:BoundField DataField="nComplaintCategory" HeaderText="Complaint Category" />
                        <asp:BoundField DataField="nComplaintClosedDueDate" HeaderText="Complaint Close Due Date" />
                        <asp:BoundField DataField="nDateMTodayAging" HeaderText="Aging" />
                        <asp:BoundField DataField="nComplaintClosed" HeaderText="Complaint Closed" />
                        <asp:BoundField DataField="nActionStanding" HeaderText="Action Outstansing" >
                            <ItemStyle Font-Size="XX-Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nComplaintSummary" HeaderText="Complaint Summary" InsertVisible="False" >
                            <ItemStyle Font-Size="XX-Small" />
                        </asp:BoundField>
                        <asp:BoundField DataField="nRmsResolution" HeaderText="RMS Resolution" >
                            <ItemStyle Font-Size="XX-Small" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" Font-Names="Arial" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Names="Tahoma" Font-Size="12px" HorizontalAlign="Center" VerticalAlign="Top" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
        <tr style="color: #000000">
            <td colspan="7" style="font-size: 10pt; height: 1px; background-color: #ffffcc;
                text-align: left">
            </td>
        </tr>
        <tr style="color: #000000">
            <td colspan="7" style="font-size: 10pt; height: 11px; background-color: #f5f5f5;
                text-align: left">
                </td>
        </tr>
        <tr style="color: #000000">
            <td colspan="7" style="font-size: 10pt; height: 11px; background-color: #f5f5f5;
                text-align: left">
                <asp:Label ID="lblMsg1" runat="server" ForeColor="#FF0000"></asp:Label>
            </td>
        </tr>
        <tr style="color: #000000; font-size: 8pt;">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                <span style="font-size: 10pt">
                Date Compliant R<span>cvd.:</span></span></td>
            <td style="font-size: 6pt; width: 254px; height: 11px; background-color: whitesmoke;
                text-align: left">
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-group" AutoPostBack="True" 
                    Width="150px" ReadOnly="True"></asp:TextBox></td>
            <td style="font-size: 10pt; width: 299px; height: 11px; background-color: #f5f5f5;
                text-align: left">
                &nbsp;</td>
            <td style="font-size: 10pt; width: 1515px; height: 11px; background-color: #f5f5f5;
                text-align: left">
                File Number :</td>
            <td style="font-size: 10pt; width: 217px; height: 11px; background-color: #f5f5f5;
                text-align: left">
                <asp:TextBox ID="txtFileNo" runat="server"  CssClass="form-group" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="font-size: 10pt; width: 427px; height: 11px; background-color: #f5f5f5;
                text-align: left">
            </td>
        </tr>
        <tr style="font-size: 10pt; color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                Account Number :</td>
            <td style="font-size: 6pt; width: 254px; height: 11px; background-color: whitesmoke;
                text-align: left">
                <asp:TextBox ID="txtAccountNo" runat="server"  CssClass="form-group" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="width: 299px; height: 11px; background-color: whitesmoke; text-align: left; font-size: 10pt;">
                </td>
            <td style="width: 1515px; height: 11px; background-color: whitesmoke; text-align: left; font-size: 10pt;">
                <span>Customer Name:</span></td>
            <td style="font-size: 10pt; width: 217px; height: 11px; background-color: whitesmoke;
                text-align: left">
                <asp:TextBox ID="txtCustName" runat="server"  CssClass="form-group" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="font-size: 10pt; width: 427px; height: 11px; background-color: whitesmoke;
                text-align: left">
            </td>
        </tr>
        <tr style="font-size: 10pt; color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                Mode of Comm. :</td>
            <td style="width: 254px; height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtModeOfComm" runat="server"   CssClass="form-group" AutoPostBack="True" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="width: 299px; height: 11px; background-color: whitesmoke; text-align: left">
                </td>
            <td style="width: 1515px; height: 11px; background-color: whitesmoke; text-align: left">
                Channel</td>
            <td style="width: 217px; height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtChannel" runat="server"  CssClass="form-group" AutoPostBack="True" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="width: 427px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
        </tr>
        <tr style="font-size: 10pt; color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                <span style="background-color: #f5f5f5;">
                Complaint Logged On:</span></td>
            <td style="font-size: 6pt; width: 254px; height: 11px; background-color: whitesmoke;
                text-align: left">
                <asp:TextBox ID="txtComplaintLoggedOn" runat="server"  CssClass="form-group" AutoPostBack="True" ReadOnly="True" Width="150px" ></asp:TextBox></td>
            <td style="font-size: 6pt; width: 299px; height: 11px; background-color: whitesmoke;
                text-align: left">
            </td>
            <td style="font-size: 10pt; width: 1515px; height: 11px; background-color: whitesmoke;
                text-align: left">
                RMS Due Date:</td>
            <td style="font-size: 10pt; width: 217px; height: 11px; background-color: whitesmoke;
                text-align: left">
                <asp:TextBox ID="txtRmsDueDate" runat="server"  CssClass="form-group" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="font-size: 6pt; width: 427px; height: 11px; background-color: whitesmoke;
                text-align: left">
                <asp:TextBox ID="txtHiddenNoOfDaysCompLogdOn" runat="server"  CssClass="form-group" Visible="False"></asp:TextBox></td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                iCare Number:</td>
            <td style="width: 254px; height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtiCareNo" runat="server" AutoPostBack="True"  CssClass="form-group" ReadOnly="True" Width="150px" ></asp:TextBox></td>
            <td style="width: 299px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td rowspan="1" style="width: 1515px; background-color: whitesmoke; text-align: left">
                Aging:</td>
            <td rowspan="1" style="width: 217px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtAging" runat="server" CssClass="form-group" Font-Bold="True" Font-Names="Segoe UI Semibold"
                    Font-Size="10pt" Width="150px" ReadOnly="True"></asp:TextBox></td>
            <td style="width: 427px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                iCare Date:</td>
            <td style="width: 254px; height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtiCaredate" runat="server" CssClass="form-group" AutoPostBack="True" ReadOnly="True" Width="150px" ></asp:TextBox></td>
            <td style="width: 299px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 1515px; height: 11px; background-color: whitesmoke; text-align: left">
                Complaint Close Due Date:</td>
            <td style="width: 217px; height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtComplaintCloseDueDate" runat="server" CssClass="form-group" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="width: 427px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                Complaint Category:</td>
            <td style="width: 254px; height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtComplaintCategory" runat="server" CssClass="form-group" AutoPostBack="True" ReadOnly="True" Width="150px"></asp:TextBox></td>
            <td style="width: 299px; height: 11px; background-color: whitesmoke; text-align: left">
                </td>
            <td style="width: 1515px; height: 11px; background-color: whitesmoke; text-align: left">
                Complaint Closed :</td>
            <td style="width: 217px; height: 11px; background-color: whitesmoke; text-align: left">
                <asp:CheckBox ID="chkYes" runat="server" AutoPostBack="True" 
                    Text="Yes" /></td>
            <td style="width: 427px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td colspan="2" style="height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td colspan="1" style="width: 1515px; height: 11px; background-color: whitesmoke;
                text-align: left">
                Reopen Complaint:</td>
            <td colspan="2" style="height: 11px; background-color: whitesmoke; text-align: left">
                <asp:CheckBox ID="chkReopen" runat="server" Text="Re-Open" AutoPostBack="True" OnCheckedChanged="chkReopen_CheckedChanged" /></td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                Complaint Summary (Old):</td>
            <td colspan="2" style="height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtComplaintSummary" runat="server" CssClass="form-group" Height="50px" MaxLength="1000"
                    TextMode="MultiLine" Width="300px" ReadOnly="True" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:TextBox></td>
            <td colspan="1" style="height: 11px; background-color: whitesmoke; text-align: left; width: 1515px;">
                Complaint Summary (New):</td>
            <td colspan="2" style="height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtComplaintSummaryNew" runat="server" CssClass="form-group" Height="50px" MaxLength="1000" TextMode="MultiLine"
                    Width="300px" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:TextBox></td>
        </tr>
        <tr style="color: #000000">
            <td colspan="7" style="height: 1px; background-color: #ffffcc; text-align: left">
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
                Action Outstanding:</td>
            <td colspan="2" style="height: 11px; background-color: whitesmoke; text-align: left">
                <asp:TextBox ID="txtActionStanding" runat="server" CssClass="form-group" Height="50px" MaxLength="200"
                    TextMode="MultiLine" Width="300px" ReadOnly="True" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:TextBox></td>
            <td colspan="1" style="height: 11px; background-color: whitesmoke; text-align: left; width: 1515px;">
                RMS Resolution :</td>
            <td colspan="1" style="height: 11px; background-color: whitesmoke; text-align: left; width: 217px;">
                <asp:TextBox ID="txtRMSresolution" runat="server" CssClass="form-group" Height="50px" MaxLength="1000"
                    TextMode="MultiLine" Width="300px" ReadOnly="True" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:TextBox></td>
            <td colspan="1" style="height: 11px; background-color: whitesmoke; text-align: left; width: 427px;">
            </td>
        </tr>
        <tr style="color: #000000">
            <td style="width: 146px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 662px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 254px; height: 11px; background-color: whitesmoke; text-align: center">
                </td>
            <td style="width: 299px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 1515px; height: 11px; background-color: whitesmoke; text-align: left">
                </td>
            <td style="width: 217px; height: 11px; background-color: whitesmoke; text-align: left">
            </td>
            <td style="width: 427px; height: 11px; background-color: whitesmoke; text-align: right">
                <asp:Button ID="btnSubmit" runat="server"   CssClass="form-group" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>
    </table> 
                        </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
       
        <!-- /.row -->

        <!-- Features Section -->
      
        <!-- /.row -->
       

        <script src="js/jquery-1.11.0.js"></script>
        
        <!-- Call to Action Section -->
        <div>
        </div>
        
         

        
    </asp:Content>

