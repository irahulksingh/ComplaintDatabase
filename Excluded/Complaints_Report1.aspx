<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Complaints_Report1.aspx.cs" Inherits="Default2" %>

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
                    <i class="glyphicon glyphicon-wrench"></i>  Complaints Report</h3>
            </div>
            <div class="col-md-12">
                <div class="panel panel-default">

                    <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Bootstrap v3.2.0</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
                     <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> Free &amp; Open Source</h4>
                    </div>
                    <div class="panel-body">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque, optio corporis quae nulla aspernatur in alias at numquam rerum ea excepturi expedita tenetur assumenda voluptatibus eveniet incidunt dicta nostrum quod?</p>
                        <a href="#" class="btn btn-default">Learn More</a>
                    </div>
                </div>
            </div>
                    <div class="panel-heading" style="height:175px">
                
                           <div class="col-md-1"><asp:Label id="lblMsg" runat="server" ForeColor="#FF0000">
                                </asp:Label><asp:Label id="lblMsg1" runat="server" ForeColor="Red" ></asp:Label>
                               </div>
                            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        
                        Pull report as per status.</div><asp:RadioButton id="rbComplaintStatus" runat="server" ForeColor="#990000" Text="  Complaint Status" OnCheckedChanged="rbComplaintStatus_CheckedChanged" AutoPostBack="True">
                               </asp:RadioButton><asp:DropDownList id="drpStatus" CssClass="btn btn-default btn-sm dropdown-toggle" runat="server" >
                                <asp:ListItem >Select</asp:ListItem>
                                <asp:ListItem  Value="No">Open</asp:ListItem>
                                <asp:ListItem  Value="Yes">Closed</asp:ListItem>
                            </asp:DropDownList> </div></div>
                     <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        
                        Pull report as per date.<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtStartDate" ValidationGroup="StartDate"></asp:RequiredFieldValidator></div><asp:RadioButton id="rbComplaintLoggedDate" runat="server" ForeColor="#990000" Text="Complaint Logged Date" OnCheckedChanged="rbComplaintLoggedDate_CheckedChanged" AutoPostBack="True">
                               </asp:RadioButton>
                    <div class="col-xs-3" ><asp:TextBox id="txtStartDate" runat="server" CssClass="form-control" ></asp:TextBox><asp:TextBox id="txtEndDate" runat="server" AutoPostBack="True" OnTextChanged="txtEndDate_TextChanged" CssClass="form-control" ValidationGroup="StartDate"></asp:TextBox><asp:Button id="btnSearch" onclick="btnSearch_Click" runat="server" Text="Generate Report"></asp:Button><asp:Button id="btnClearAll" onclick="btnClearAll_Click" runat="server"  Text="Clear All"></asp:Button>
                           </div></div></div></div></div>
                           <asp:GridView ID="grdComplaintsReport" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" GridLines="Horizontal" OnPageIndexChanging="grdComplaintsReport_PageIndexChanging" PageSize="100">
                               <FooterStyle BackColor="White" ForeColor="#333333" />
                               <PagerStyle BackColor="#336666" Font-Names="Arial" ForeColor="White" HorizontalAlign="Center" />
                               <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                               <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                               <Columns>
                                   <asp:BoundField DataField="nDateReceived" HeaderText="Complaint Received Date" />
                                   <asp:BoundField DataField="nFileNo" HeaderText="File No." />
                                   <asp:BoundField DataField="nAccountNo" HeaderText="Account No." />
                                   <asp:BoundField DataField="nMode" HeaderText="Mode" />
                                   <asp:BoundField DataField="nChannel" HeaderText="Channel" />
                                   <asp:BoundField DataField="nComplaintLoggedDate" HeaderText="Complaint Logged Date" />
                                   <asp:BoundField DataField="nNoOfDaysCompLogdOn" HeaderText="No of Days before complaint logged" />
                                   <asp:BoundField DataField="nRMSdueDate" HeaderText="RMSDueDate" />
                                   <asp:BoundField DataField="niCareNo" HeaderText="iCare No." />
                                   <asp:BoundField DataField="niCareDate" HeaderText="iCare Date" />
                                   <asp:BoundField DataField="nComplaintCategory" HeaderText="Complaint Category" />
                                   <asp:BoundField DataField="nComplaintClosedDueDate" HeaderText="Complaint Close Due Date" />
                                   <asp:BoundField DataField="nDateMTodayAging" HeaderText="Aging" />
                                   <asp:BoundField DataField="nComplaintClosed" HeaderText="Complaint Closed" />
                                   <asp:BoundField DataField="nActionStanding" HeaderText="Action Standing">
                                   <ItemStyle Font-Size="10px" HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                   </asp:BoundField>
                                   <asp:BoundField DataField="nComplaintSummary" HeaderText="Summary">
                                   <ItemStyle Font-Size="X-Small" HorizontalAlign="Left" VerticalAlign="Bottom" />
                                   </asp:BoundField>
                                   <asp:BoundField DataField="nRMSResolution" HeaderText="RMS resolution" />
                               </Columns>
                               <RowStyle BackColor="White" ForeColor="#333333" HorizontalAlign="Center" />
                           </asp:GridView>
                           <asp:Button ID="btnExporttoExcel" runat="server" onclick="Button1_Click" Text="Export to excel" />
                    </div>
           
           <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtStartDate" Format="MM-dd-yyyy"></cc1:CalendarExtender>
           <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEndDate" Format="MM-dd-yyyy"></cc1:CalendarExtender>
            <br />
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

