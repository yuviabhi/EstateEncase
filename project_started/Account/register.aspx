<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/View.Master" CodeBehind="register.aspx.vb" Inherits="project_started.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <p ><b>  Membership Registration : </b></p>
 
    <table width="100%" align="center"><tr><td>
    


<table align="center" ><tr><td>
<fieldset>
    <legend><b>
    YOUR PERSONEL INFORMATION :
    </b></legend>
<table cellpadding="5" cellspacing="5" align="center" >

    
    <tr><td colspan="2">

    <asp:Label ID="Label_status" runat="server"></asp:Label>

</td></tr>
<tr><td>
    Username</td><td>
    <asp:TextBox ID="TextBox_username" runat="server" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox_username" Display="Dynamic" ErrorMessage="Required" 
            SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ControlToValidate="TextBox_username" Display="Dynamic" 
            ErrorMessage="Min 6 Chars" SetFocusOnError="True" 
            ValidationExpression="\w{6}\w*"></asp:RegularExpressionValidator>
</td></tr>
<tr><td>
    Password</td><td>
    <asp:TextBox ID="TextBox_password" runat="server"  Width="200px" 
            TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox_password" Display="Dynamic" 
            ErrorMessage="Required" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ControlToValidate="TextBox_password" Display="Dynamic" 
            ErrorMessage="Min 6 Chars" SetFocusOnError="True" 
            ValidationExpression="\w{6}\w*"></asp:RegularExpressionValidator>
</td></tr>
<tr><td>
    Confirm Password</td><td>
    <asp:TextBox ID="TextBox_re_password" runat="server"  
            Width="200px" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="TextBox_password" ControlToValidate="TextBox_re_password" 
            ErrorMessage="Password mismatched" SetFocusOnError="True" 
            Display="Dynamic"></asp:CompareValidator>
</td></tr>
<tr><td>
    Email</td><td>
    <asp:TextBox ID="TextBox_email" runat="server" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TextBox_email" Display="Dynamic" ErrorMessage="Required" 
            SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="TextBox_email" Display="Dynamic" 
            ErrorMessage="Invalid Email" SetFocusOnError="True" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
</td></tr>

<tr>
<td>Verification Code
</td>
<td>
    <asp:Label ID="Label_Captcha" runat="server" Text="" ></asp:Label>
    &nbsp;&nbsp;&nbsp;
<asp:TextBox ID="TextBox_Captcha" runat="server" width="25%"></asp:TextBox>
</td>

</tr>


<tr><td colspan="2">
    <asp:CheckBox ID="CheckBox_accept" runat="server" Text="I accept all terms and 
    conditions." /></td></tr>
<tr><td " align="right">
    &nbsp;</td>
<td align="right">    <asp:Button ID="Button_submit" runat="server" Text="Proceed" />

</td></tr>
</table>
</fieldset>
</td></tr></table>
</td></tr></table>


</asp:Content>


