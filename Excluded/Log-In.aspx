<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Log-In.aspx.cs" Inherits="Log_In" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   <head id="Head1" runat="server">
    <title>::Login::</title>
       <link href="css/bootstrap.css" rel="stylesheet" />
    <style>
        body { 
  background: url("images/bg.png") no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

.panel-default {
opacity: 0.85;
margin-top:300px;
height:215px;
}
.form-group.last { margin-bottom:0px; }

    </style>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
           <div class="navbar-header" style="height:80px">
            <h1><i class="fa fa-fw fa-pencil"></i>Complaint Database</h1>
            </div></div></nav>
        <div class="container">
    <div class="row">
        <div class="col-md-3 col-md-offset-8">
            <div class="panel panel-default">
                <div class="panel-heading" >
                   <h4><i class="fa fa-fw fa-pencil"></i>Login</h4>
                        <span>
                <asp:Label id="lblMsg" runat="server" ForeColor="red" Font-Names="Segoe UI Light" Font-Bold="true" style="font-size: small; font-family: 'Segoe UI Semibold'"></asp:Label></span>
                </div>
            
                <div class="panel-body">
                    <form id="Form2" class="form-horizontal" role="form" runat="server">
      <div class="col-sm-15">
                              <div style="margin-bottom: 10px" class="input-group">
                             <span class="input-group-addon"></span>
                            <asp:TextBox id="txtLoginId" CssClass="form-control" runat="server" placeholder="Login Id" ></asp:TextBox></div>
                      <div style="margin-bottom: 5px" class="input-group">
                             <span class="input-group-addon"></span>
                           <asp:TextBox id="txtPassword"  CssClass="form-control"  runat="server" TextMode="Password"  placeholder="Password"></asp:TextBox>
                           </div>

                             <asp:Button id="btnLogin" class="btn btn-success btn-md pull-right" onclick="btnLogin_Click" runat="server" Text="Login"></asp:Button>
                        
                      </div>

                    </form>
                    </div>
                   </div>
               </div></div>

    </div>

    <div>
    
    </div>
</body>
</html>
