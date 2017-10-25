<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Detailed_allComplaints_Report.aspx.cs" Inherits="Default2" %>

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
                    <i class="fa fa-fw fa-list"></i>Detailed Report</h3>
            </div>
               <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>All Complaints Report</h4>
                                          <h4>
                                              <asp:Label ID="lblMsg" runat="server" style="font-weight: 700; color: #FF0000; font-size: small"></asp:Label>
                        </h4>
                                          </div>
                    <div class="panel-body">
                        <asp:Button ID="btnExporttoExcel" runat="server" Text="Export to excel" CssClass="btn btn-success btn-xs pull" OnClick="btnExporttoExcel_Click" />
                        <br />
                        <div class="table-responsive">
  <table class="table">
                        <asp:GridView ID="grdComplaintsReport" runat="server" AutoGenerateColumns="False" CellPadding="4" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" GridLines="Vertical" PageSize="100" ForeColor="#333333" BorderWidth="1px" HorizontalAlign="Center">
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                            <PagerStyle BackColor="#284775" Font-Names="Arial" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#33CC99" Font-Bold="True" ForeColor="White" Font-Size="12px" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="100%" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="nDateReceived" HeaderText="Date Recvd." />
                                <asp:BoundField DataField="nFileNo" HeaderText="File Number" />
                                <asp:BoundField DataField="nAccountNo" HeaderText="Account Number" />
                                <asp:BoundField DataField="nMode" HeaderText="Mode" />
                                <asp:BoundField DataField="nChannel" HeaderText="Channel" />
                                <asp:BoundField DataField="nComplaintLoggedDate" HeaderText="Complaint Logged Date" />
                                <asp:BoundField DataField="nRMSdueDate" HeaderText="RMSDueDate" />
                                <asp:BoundField DataField="niCareNo" HeaderText="iCare No." />
                                <asp:BoundField DataField="niCareDate" HeaderText="iCare Date" />
                                <asp:BoundField DataField="nComplaintCategory" HeaderText="Complaint Category" />
                                <asp:BoundField DataField="nComplaintClosedDueDate" HeaderText="Complaint Close Due Date" />
                                <asp:BoundField DataField="nDateMTodayAging" HeaderText="Aging" />
                                <asp:BoundField DataField="nLastUser" HeaderText="Actioned By" />
                            </Columns>
                            <RowStyle BackColor="#F7F6F3" HorizontalAlign="Center" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
      </table></div>
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
       

        <script src="js/jquery-1.11.0.js"></script></i></asp:Panel>
        
        <!-- Call to Action Section -->
                 

        
    </asp:Content>

