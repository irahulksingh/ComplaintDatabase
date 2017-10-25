<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
 


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
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
               
                <h1 style="color:white;left:0px"><span class="glyphicon glyphicon-th"></span>  Complaints Database</h1>
            </div></div></nav>

    
    <div>
        <div class="container">
    <div class="row">
        <div class="col-md-3 col-md-offset-8">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><span class="glyphicon glyphicon-th-list"></span>  Login</h4></div>
                <span>
                <asp:Label id="lblMsg" runat="server" ForeColor="red" Font-Names="Segoe UI Light" Font-Bold="true"></asp:Label></span>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" runat="server">
                        <div class="col-sm-15">
                            <div style="margin-bottom: 10px" class="input-group">
                             <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox id="txtLoginId" CssClass="form-control" runat="server" placeholder="Login Id" ></asp:TextBox></div>
                        <div style="margin-bottom: 5px" class="input-group">
                             <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                           <asp:TextBox id="txtPassword"  CssClass="form-control"  runat="server" TextMode="Password"  placeholder="Password"></asp:TextBox>
                           </div>
                        </div>
                        <div class="col-sm-offset-8 col-sm-1">
                                 <asp:Button id="btnLogin" CssClass="btn btn-success btn-sm"  runat="server" Text="Login"></asp:Button>
                          </div>

                    </form>
                    </div>
                   </div>
               </div>

    </div>
</div>
   
   
</div>
    </body>
</html>
