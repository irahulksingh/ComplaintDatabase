<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Copy of Edit_Complaints.aspx.cs" Inherits="Default2" %>

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
        .auto-style4
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
        }
    .auto-style5
    {
        font-weight: normal;
    }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <!-- Javascript Section -->
    <script src="js/jquery-1.11.0.js"></script>
    <!-- Page Content -->
    <div class="container">
                  <h3 class="page-header">
                 <i class="fa fa-fw fa-edit"></i> Edit Complaint</h3>
                       
         <div class="row">
            <div class="panel panel-default" style="height:122px; background-color:#E8E9E8">        
            <div class="col-lg-12">
                    <div class="panel-heading" >
                    <div class="col-xs-3" >
                    <label class="control-label">Search : </label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearchBox"
                    ErrorMessage="Required field" Font-Size="X-Small" style="font-size: x-small; color: #FF0000; font-weight: 700;" CssClass="auto-style4"></asp:RequiredFieldValidator>

                 <asp:TextBox ID="txtSearchBox" CssClass="form-control" runat="server"  ></asp:TextBox><br />
                        <div class="row">
  <div class="col-lg-6">
    <div class="input-group">
      <span class="input-group-btn">
          <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn btn-info btn-xs pull-right" />
      </span>
      <input type="text" class="form-control" placeholder="Search for...">
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
  <div class="col-lg-6">
    <div class="input-group">
      <input type="text" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
                       
              
                <asp:Button ID="btnClearAll" runat="server" OnClick="btnClearAll_Click" Text="Clear All" CausesValidation="False" class="btn btn-success btn-xs pull-right" />
                        
                        </div>        
                    <div class="col-xs-3" >
                        <p>
                            Search:</p>
                        <ul>
                            <li>Search with iCare Number.</li>
                            <li>Search with Customer Name.</li>
                            <li>Search with Account Number.</li>
                            <li>Search with File Number.</li>
                        </ul>
                        
                        </div>        
                         </div>
                        </div></div>
                </div>
          <div class="row">
            <div class="panel panel-default" style="height:285px;background-color:#E8E9E8">        
            <div class="col-lg-12">
                    <div class="panel-heading" >
                       
                        <asp:Label ID="lblMsg" runat="server" CssClass="auto-style3" style="color: #FF0000; font-weight: bold"></asp:Label>
                        <asp:Label ID="lblMsg1" runat="server" CssClass="auto-style3" style="color: #FF0000; font-weight: bold"></asp:Label>
                        <br />
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
                    <label class="control-label">Channel:</label>
                     <asp:TextBox ID="txtChannel" runat="server"  CssClass="form-control" BackColor="White" AutoPostBack="True" ReadOnly="True" ></asp:TextBox>
             </div>
                <div class="col-xs-3">
                    <label class="control-label">Complaint Category:</label>
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
                         <label class="control-label">Action Outstanding:</label>
                        <asp:TextBox ID="txtActionStanding" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True"  MaxLength="200" tabIndex="11" TextMode="MultiLine"></asp:TextBox>
                        </div>
                <div class="col-xs-3">
                     <label class="control-label">Complaint Summary (Old):</label>
                    <asp:TextBox ID="txtComplaintSummary" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" BackColor="White" ReadOnly="True" MaxLength="1000" tabIndex="10" TextMode="MultiLine" ></asp:TextBox>
                      </div>
                        <div class="col-xs-3">
                     <label class="control-label">RMS Resolution:</label>
                     <asp:TextBox ID="txtRMSresolution" runat="server" CssClass="form-control" MaxLength="1000" BackColor="White"
                    TextMode="MultiLine" ReadOnly="True" Font-Names="Segoe UI Semibold"></asp:TextBox>
                      </div>

                 
               </div></div>
              </div>
              </div>
              <div class="row">
            <div class="panel panel-default" style="height:95px;background-color:#E8E9E8">        
            <div class="col-lg-11">
                    <div class="panel-heading" >
                   
                         <div class="col-xs-3">
                              <label class="control-label">Complaint Reopen:</label>
                        <asp:CheckBox ID="chkReopen" runat="server" Text="Re-Open"  AutoPostBack="True" OnCheckedChanged="chkReopen_CheckedChanged" />
                             </div>
                          <div class="col-xs-3">
                             
                              <label class="control-label">Complaint Closed:</label>
                              <asp:CheckBox ID="chkYes" runat="server" AutoPostBack="True" Text="Yes" />
                             </div>
                         <div class="col-xs-3" >
                         <label class="control-label">Complaint Summary (New):</label>
              <asp:TextBox ID="txtComplaintSummaryNew" runat="server" CssClass="form-control" Height="50px" MaxLength="1000"
                    TextMode="MultiLine" Width="300px"  Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:TextBox>
       </div><br />
                        <div class="col-xs-3" >
                         <asp:Button ID="btnSubmit" runat="server"  class="btn btn-success btn-lg pull-right" Text="Submit" OnClick="btnSubmit_Click" />
              
       </div>
                    

            </div></div>
                  </div>
        </div>
                      
                               
 
<script type="text/javascript">
    $('.checkbox').checkbox();
    </script>
                   <!-- /.row -->
            <!-- Portfolio Section -->
           <!-- /.row -->
          <!-- Features Section -->
          <!-- /.row -->
          
        <!-- Call to Action Section -->
       
            
     
                <asp:GridView ID="grdSearchResult" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    Font-Bold="False" Font-Names="Tahoma" Font-Size="8pt"
                    GridLines="Horizontal" OnRowCommand="grdSearchResult_RowCommand" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" BackColor="White">
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" ForeColor="#333333" />
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
                    <EditRowStyle Font-Names="Arial" />
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" Font-Names="Tahoma" Font-Size="12px" HorizontalAlign="Center" VerticalAlign="Top" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
           
                        </div>
             
                </asp:Content>

