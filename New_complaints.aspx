<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="New_complaints.aspx.cs" Inherits="Default2" %>

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
        .auto-style2
        {
            color: #FF0000;
            font-weight: bold;
            font-size: small;
            font-family: "Segoe UI Semilight";
        }
        .auto-style3
        {
            font-size: small;
            font-family: "Segoe UI Semibold";
            font-weight: bold;
            color: #FF0000;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
     <!-- Javascript Section -->
    <script src="js/jquery-1.11.0.js"></script>
    <!-- Page Content -->
    <div class="container">
                  <h3 class="page-header">
                   <i class="fa fa-fw fa-pencil"></i>New Complaint</h3>
                        <asp:TextBox ID="txtHiddenNoOfDaysCompLogdOn" runat="server" Visible="False" ></asp:TextBox>
                        <asp:Label ID="lblMsg" runat="server" CssClass="auto-style3"></asp:Label>
                        <asp:Label ID="lblMsg1" runat="server" CssClass="auto-style3"></asp:Label>
         <div class="row">
            <div class="panel panel-default" style="height:412px;background-color:#E8E9E8">    
                <div class="col-lg-12">
                    <div class="panel-heading" >
                    <div class="col-xs-4" >
                    <label class="control-label">Client Code:</label>
                    <asp:TextBox ID="txtClientCode" runat="server"  AutoPostBack ="false" CssClass="form-control"  MaxLength="10" tabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDate" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style2"></asp:RequiredFieldValidator>
                </div>      
                 
                    <div class="col-xs-4" >
                    <label class="control-label">Compliant Received Date:</label>
                    <asp:TextBox ID="txtDate" runat="server"  AutoPostBack ="True" CssClass="form-control"  OnTextChanged="txtDate_TextChanged" tabIndex="2" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style2"></asp:RequiredFieldValidator>
                </div>  
                <div class="col-xs-4">
                    <label class="control-label">File Number :</label>
                    <asp:TextBox ID="txtFileNo" runat="server"   CssClass="form-control"  tabIndex="3" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtFileNo" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style2"></asp:RequiredFieldValidator>
            </div>
              <div class="col-xs-4">
                <label class="control-label">iCare Number:</label>
                <asp:TextBox ID="txtiCareNo" runat="server"    CssClass="form-control" OnTextChanged="txtiCareNo_TextChanged" tabIndex="4" MaxLength="8" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtiCareNo" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style2"></asp:RequiredFieldValidator>
                                    
            </div>
                <div class="col-xs-4">
                <label class="control-label">iCare Date:</label>
                <asp:TextBox ID="txtiCaredate" runat="server"   CssClass="form-control"  AutoPostBack="True" OnTextChanged="txtiCaredate_TextChanged" tabIndex="5" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtiCaredate" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style2"></asp:RequiredFieldValidator>
           </div>
                <div class="col-xs-4">
                <label class="control-label">Account Number:</label>
                <asp:TextBox ID="txtAccountNo" runat="server" CssClass="form-control" tabIndex="6" MaxLength="15" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAccountNo" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style2"></asp:RequiredFieldValidator>
            </div>
                <div class="col-xs-4">
                    <label class="control-label">Customer Name:</label>
                    <asp:TextBox ID="txtCustName" runat="server"   CssClass="form-control"   tabIndex="7" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCustName" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" CssClass="auto-style2"></asp:RequiredFieldValidator>
           </div>
                <div class="col-xs-4">
                    <label class="control-label">Mode of Communication :</label>
                    <asp:DropDownList ID="dbMode" runat="server" CssClass="form-control" tabIndex="8"> </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="dbMode" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" InitialValue="Select" CssClass="auto-style2"></asp:RequiredFieldValidator>
             </div>
                <div class="col-xs-4">
                    <label class="control-label">Channel:</label>
                    <asp:DropDownList ID="dbChannel" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="dbChannel_SelectedIndexChanged" tabIndex="9"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="dbChannel" CssClass="auto-style2" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" InitialValue="Select"></asp:RequiredFieldValidator>
            </div>
                <div class="col-xs-4">
                    <label class="control-label">Complaint Category:</label>
                    <asp:DropDownList ID="dbCompCat" runat="server" CssClass="form-control" tabIndex="10" ></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="dbCompCat" CssClass="auto-style2" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt" InitialValue="Select"></asp:RequiredFieldValidator>
          </div>
                <div class="col-xs-4">
                     <label class="control-label">Complaint Logged On:</label>
                    <asp:TextBox ID="txtComplaintLoggedOn" runat="server" AutoPostBack="True" CssClass="form-control" MaxLength="8" OnTextChanged="txtComplaintLoggedOn_TextChanged" TabIndex="11" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtComplaintLoggedOn" CssClass="auto-style2" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:RequiredFieldValidator>
                </div>    
                    <div class="col-xs-4">
                         <label class="control-label">Complaint Comments:</label>
                        <asp:TextBox ID="txtActionStanding" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" Font-Size="8pt" MaxLength="200" tabIndex="12" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtActionStanding" CssClass="auto-style2" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:RequiredFieldValidator>
                </div>
                <div class="col-xs-12">
                     <label class="control-label">Resolution comments:</label>
                    <asp:TextBox ID="txtComplaintSummary" CssClass="form-control" runat="server" Font-Names="Segoe UI Semibold" Font-Size="8pt" MaxLength="1000" tabIndex="13" TextMode="MultiLine" Height="40px" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtComplaintSummary" CssClass="auto-style2" ErrorMessage="Required Field" Font-Bold="False" Font-Names="Segoe UI Semibold" Font-Size="8pt"></asp:RequiredFieldValidator>
                 </div>
                        </div>
            
               </div>
                     </div> </div></div>  
     <div class="container">
               
         <div class="row">
            <div class="panel panel-default" style="height:70px;background-color:#E8E9E8">        
            <div class="col-lg-12">
                    <div class="panel-heading" >
                     <div class="col-xs-4">
                        <label class="control-label">RMS Due Date:</label>
                        <asp:TextBox ID="txtRmsDueDate" runat="server" CssClass="form-control" BackColor="White" MaxLength="9" ReadOnly="True" ></asp:TextBox>
                </div>
                   <div class="col-xs-4">
                        <label class="control-label">Complaint Close Due Date:</label>
                        <asp:TextBox ID="txtComplaintCloseDueDate" runat="server" CssClass="form-control" BackColor="White" MaxLength="9" ReadOnly="True" ></asp:TextBox>
                </div>
                       
             <div class="col-xs-4" >
              <label class="control-label">Aging:</label>
                        <asp:TextBox ID="txtAging" runat="server" CssClass="form-control" BackColor="White" MaxLength="9" ReadOnly="True" ></asp:TextBox><br />
                 
                  </div>
                        
                
                        </div></div></div></div></div>   
   
     
                     <div class="container">
               
         <div class="row">
            <div class="panel panel-default" style="height:64px;background-color:#E8E9E8">        
            <div class="col-lg-12">
                    <div class="panel-heading" >          
            
  <div>
      <strong>Upload Files :</strong>
      <asp:label ID="lblStatus" runat="server" style="color: #FF0000; font-family: 'Segoe UI'; font-size: xx-small" /><br />
      <table><tr><td>
                     <asp:FileUpload ID="fUpload" runat="server" CssClass="btn btn-info btn-sm pull-right" TabIndex="14" /></td><td>
                            &nbsp;<asp:Button runat="server" id="UploadButton" text="Upload" CausesValidation="False" class="btn btn-success btn-sm pull-center" OnClick="UploadButton_Click" />&nbsp; &nbsp;

                               </td></tr>                            

                               </table>
                           
                </div><br />
                        <div>
                            <asp:Button ID="btnSubmit" class="btn btn-success btn-lg pull-right" runat="server" onclick="btnSubmit_Click" TabIndex="15" Text="Save" />
                            <asp:GridView ID="grdUploaded" runat="server" AutoGenerateColumns="False"
            EmptyDataText = "No files uploaded" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />
        <asp:TemplateField ControlStyle-Width="100">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile" CausesValidation="False" ForeColor="#006600"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ControlStyle-Width="100">
            <ItemTemplate>
                <asp:LinkButton ID = "lnkDelete" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClientClick="return confirm('Are you sure you want to DELETE ?')" OnClick = "DeleteFile" CausesValidation="False" ForeColor="Red" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
</div></div></div></div></div></div>
   
      <cc1:CalendarExtender ID="CalendarExtender1" CssClass="Calendar" runat="server" Format="MM-dd-yyyy" PopupPosition="Right"
                                TargetControlID="txtDate"></cc1:CalendarExtender>
        <cc1:CalendarExtender ID="CalendarExtender2"  CssClass="Calendar" runat="server" Format="MM-dd-yyyy"
                                PopupPosition="Right" TargetControlID="txtiCaredate"></cc1:CalendarExtender>
        <cc1:CalendarExtender ID="CalendarExtender3"  CssClass="Calendar" runat="server" Format="MM-dd-yyyy" PopupPosition="Right"
                                TargetControlID="txtComplaintLoggedOn" Enabled="True"></cc1:CalendarExtender>
        <cc1:CalendarExtender ID="CalendarExtender4"  CssClass="Calendar"  runat="server" Format="MM-dd-yyyy"
                                PopupPosition="Right" TargetControlID="txtiCaredate"></cc1:CalendarExtender>
   
                   <!-- /.row -->
            <!-- Portfolio Section -->
           <!-- /.row -->
          <!-- Features Section -->
          <!-- /.row -->
          
        <!-- Call to Action Section -->
        </asp:Content>

