<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="project_started.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        To
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Subject
        <asp:TextBox ID="TextBox2" runat="server" Width="382px"></asp:TextBox>
        <br />
        Body
        <asp:TextBox ID="TextBox3" runat="server" Height="133px" TextMode="MultiLine" 
            Width="390px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Send Mail" Width="420px" />
    
    </div>
    </form>
</body>
</html>
