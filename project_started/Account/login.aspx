<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/View.Master" CodeBehind="login.aspx.vb" Inherits="project_started.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<p  >  <b>Login : </b></p>
<table width="100%" ><tr><td align="center">
    
    
    <table align="center"  ><tr><td>
    
    
    <fieldset>
    
    <legend>
    
    Enter your login information
    
    </legend>
    
    
    <table width="350px" cellpadding="5" cellspacing="5">
    <tr>
    
    <td colspan="2" align="left">
        <asp:Label ID="Label_Status" runat="server"></asp:Label>
        </td>
    
    </tr>
    
    <td>Username</td><td align="left">
        <asp:TextBox ID="TextBox_username" runat="server" Width="200px"></asp:TextBox>
        </td>
    
    </tr>
    <tr>
    
    <td>Password</td><td align="left">
        <asp:TextBox ID="TextBox_password" runat="server" Width="200px" 
            TextMode="Password"></asp:TextBox>
        </td>
    
    </tr>
    <tr><td colspan="2" align="right">
        <asp:HyperLink ID="HyperLink_ForgotPassword" runat="server" Target="_blank">Forgot your password ?</asp:HyperLink>
    </td></tr>
    <tr>
    <td align="left" colspan="2">
        <asp:CheckBox ID="CheckBox_remember_me" runat="server" Text="  Remember Me" />
    
    </td>
   <td align="right">
        <asp:Button ID="Button_signIn" runat="server" Text="Sign In" />
        </td>
    
    </tr>
    </table>





    
    
    </fieldset>
    
    
    
    
    </td></tr></table>
    
    
    
    </td></tr></table>
    <p>
    </p>
    </asp:Content>