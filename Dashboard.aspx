<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1
    {
        font-weight: normal;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Header Carousel -->
        <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">
                   <i class="fa fa-fw fa-dashboard"></i>Dashboard</h3>
            </div>
            <div class="col-md-3">
                <div class="panel panel-default" >
                    <div class="panel-heading" style="background-color:#ff6a00;color:White">
                        <h5>Total No. Of Complaints</h5>
                    </div>
                    <div class="panel-body">
                        <p style="text-align:center"><asp:LinkButton ID="lblTotalComplaints" runat="server" Font-Names="Segoe UI Semibold"
                                Font-Size="32pt" ForeColor="#ff6a00" PostBackUrl="~/Detailed_allComplaints_Report.aspx"></asp:LinkButton></p>
                     </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color:#33cc99;color:White">
                        <h5>No. of closed complaints</h5>
                    </div>
                    <div class="panel-body">
                        <p style="text-align:center">  <asp:LinkButton ID="lblClosedComplaints" runat="server" Font-Bold="False" Font-Names="Segoe UI Semibold"
                                                Font-Size="32pt" ForeColor="#33CC99" PostBackUrl="~/Detailed_Closed_Report.aspx"></asp:LinkButton></p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-default" >
                    <div class="panel-heading" style="background-color:#e84e41;color:White">
                        <h5>No. of pending complaints</h5>
                    </div>
                    <div class="panel-body">
                        <p style="text-align:center"> <asp:LinkButton ID="lblOpenComplaints" runat="server" Font-Bold="False" Font-Names="Segoe UI Semibold"
                                    Font-Size="32pt" ForeColor="#E84E41" PostBackUrl="~/Detailed_Open_Report.aspx"></asp:LinkButton></p>
                     
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-default" >
                    <div class="panel-heading" style="background-color:#578ae8;color:White">
                        <h5>No. of reopened complaints</h5>
                    </div>
                    <div class="panel-body">
                         <p style="text-align:center"> <asp:LinkButton ID="lblReopenedComplaints" runat="server" Font-Bold="False" Font-Names="Segoe UI Semibold"
                                    Font-Size="32pt" ForeColor="#578AE8" PostBackUrl="~/Detailed_Reopened_Report.aspx"></asp:LinkButton></p>
                      
                    </div>
                </div>
            </div>
        </div>
                 <div class="col-md-14">
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color:#33cc99;color:White;height:40px">
                        <h5>Instructions</h5>
                    </div>
                    <div class="panel-body">
                        <ul>
                                    <li class="auto-style1">No. of Complaints shows the total number of compliants till date in the database.</li>
                    <li class="auto-style1">No. of pending complaints show the number of complaints pending for action.</li>
                    <li class="auto-style1">No. of reopened complaints will decrease as the compaints get closed.</li>
                    <li class="auto-style1">No. of closed complaints show the number of complaints closed.</li>
                    <li class="auto-style1">The number of closed complaints will decrease once the complaint is reopened.</li>
                    <li class="auto-style1">Leave proper comments while making notes on the complaints so that its helpful for the next person opening the complaint.</li>
                </ul>
               </div>
           </div></div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        
        <!-- /.row -->

        <!-- Features Section -->

        <!-- /.row -->
       
</asp:Content>

