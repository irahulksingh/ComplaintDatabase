<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Complaints_Report.aspx.cs" Inherits="Default2" %>

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
    <asp:Panel id ="panel1" runat="server">
        
    
    <script src="js/jquery-1.11.0.js"></script>
     <!-- Header Carousel -->
   
  

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
       <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                  <i class="fa fa-fw fa-th"></i> Complaint Report</h3>
            </div>
               <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-th"></i> Status Based Report</h4>
                        <p>
                            <asp:Label ID="lblMsg" runat="server" Font-Bold="False" ForeColor="#FF0000"></asp:Label>
                            <asp:Label ID="lblMsg1" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
                        </p>
                    </div>
                    <div class="panel-body">
                       <asp:RadioButton ID="rbComplaintStatus" runat="server" AutoPostBack="True" OnCheckedChanged="rbComplaintStatus_CheckedChanged" Text="Status based complaint report" CssClass="radio-primary" />
                        <asp:DropDownList ID="drpStatus" runat="server" CssClass="btn btn-default btn-sm dropdown-toggle" Width="203px">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem Value="No">Open</asp:ListItem>
                            <asp:ListItem Value="Yes">Closed</asp:ListItem>
                        </asp:DropDownList></div>
                </div>

            </div>   
              
           <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-th"></i> Date Based Report</h4>
                    </div>
                    <div class="panel-body">
                        <p>
                            <asp:RadioButton ID="rbComplaintLoggedDate" runat="server" AutoPostBack="True" OnCheckedChanged="rbComplaintLoggedDate_CheckedChanged" Text="Date based complaint report" />
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" placeholder="Start date"></asp:TextBox>
                            <cc1:CalendarExtender ID="CalendarExtender1" CssClass="Calendar" runat="server" Format="MM-dd-yyyy" TargetControlID="txtStartDate" >
                            </cc1:CalendarExtender>
                            <cc1:CalendarExtender ID="CalendarExtender2" CssClass="Calendar" runat="server" Format="MM-dd-yyyy" TargetControlID="txtEndDate" >
                            </cc1:CalendarExtender>
                            <asp:TextBox ID="txtEndDate" runat="server" AutoPostBack="True" CssClass="form-control" OnTextChanged="txtEndDate_TextChanged" ValidationGroup="StartDate" placeholder="End date"></asp:TextBox>
                              
                    </div>
                </div>
            </div>
             <div class="col-md-2">
                <div class="panel panel-default">
                    <div class="panel-body" style="vertical-align:central">
                    <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" Text="Generate Report" class="btn btn-success btn-md pull-center"/>
                    <asp:Button ID="btnClearAll" runat="server" onclick="btnClearAll_Click" Text="Clear All" class="btn btn-info btn-md pull-center" />
                     </div>
                </div>
            </div>
          
           <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                     <asp:GridView id="grdComplaintsReport" runat="server" Font-Size="8pt" Font-Bold="False" Font-Names="Segoe UI Semibold" BackColor="White" BorderWidth="3px" BorderStyle="Double" BorderColor="#336666" PageSize="100" GridLines="Horizontal" OnPageIndexChanging="grdComplaintsReport_PageIndexChanging" AutoGenerateColumns="False" CellPadding="4">
                                <FooterStyle  BackColor="White" ForeColor="#333333"  />
                                <PagerStyle  BackColor="#336666" ForeColor="White" HorizontalAlign="Center" Font-Names="Arial"  />
                                <SelectedRowStyle BackColor="#339966" ForeColor="White" Font-Bold="True"  />
                                <HeaderStyle  BackColor="#336666" Font-Bold="True" ForeColor="White"  />
                                <Columns>
                                    <asp:BoundField DataField="nClientCode" HeaderText="Client Code" />
                                    <asp:BoundField  DataField="nDateReceived" HeaderText="Complaint Received Date" ></asp:BoundField>
                                    <asp:BoundField DataField="nFileNo" HeaderText="File No." ></asp:BoundField>
                                    <asp:BoundField  DataField="nAccountNo" HeaderText="Account No." ></asp:BoundField>
                                    <asp:BoundField  DataField="nMode" HeaderText="Mode" ></asp:BoundField>
                                    <asp:BoundField DataField="nChannel" HeaderText="Complaint Type" ></asp:BoundField>
                                    <asp:BoundField DataField="nComplaintLoggedDate" HeaderText="Complaint Logged Date" ></asp:BoundField>
                                    <asp:BoundField DataField="nNoOfDaysCompLogdOn" HeaderText="No of Days before complaint logged" ></asp:BoundField>
                                    <asp:BoundField  DataField="nRMSdueDate" HeaderText="RMSDueDate" ></asp:BoundField>
                                    <asp:BoundField  DataField="niCareNo" HeaderText="iCare No." ></asp:BoundField>
                                    <asp:BoundField DataField="niCareDate" HeaderText="iCare Date" ></asp:BoundField>
                                    <asp:BoundField DataField="nComplaintCategory" HeaderText="Complaint Reason" ></asp:BoundField>
                                    <asp:BoundField DataField="nComplaintClosedDueDate" HeaderText="Complaint Close Due Date" ></asp:BoundField>
                                    <asp:BoundField DataField="nDateMTodayAging" HeaderText="Aging" ></asp:BoundField>
                                    <asp:BoundField DataField="nComplaintClosed" HeaderText="Complaint Closed" ></asp:BoundField>
                                    <asp:BoundField DataField="nActionStanding" HeaderText="Action Standing">
                                        <ItemStyle  Font-Size="10px" HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True"  />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nComplaintSummary" HeaderText="Summary">
                                        <ItemStyle Font-Size="X-Small" HorizontalAlign="Left" VerticalAlign="Bottom"  />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="nRMSResolution" HeaderText="RMS resolution" ></asp:BoundField>
                                    <asp:BoundField DataField="nComplaintRejectDate" HeaderText="Complaint Reject Date" />
                                    <asp:BoundField DataField="nComplaintRejectComment" HeaderText="Complaint Reject Comment" />
                                    <asp:BoundField DataField="nRejectionResolutionDate" HeaderText="Rejected Complaint Resolution Date" />
                                    <asp:BoundField DataField="nRejectionResolutionComment" HeaderText="Rejected Complaint Resolution Comment" />
                                </Columns>
                                <RowStyle HorizontalAlign="Center" BackColor="White" ForeColor="#333333"  />
                            </asp:GridView>
                        <br />
                         <asp:Button id="btnExporttoExcel" onclick="Button1_Click" runat="server" Text="Export to excel" class="btn btn-success btn-md pull-right"></asp:Button>
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

