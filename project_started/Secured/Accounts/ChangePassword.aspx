<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Customer.Master" CodeBehind="ChangePassword.aspx.vb" Inherits="project_started.EditPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<table width="100%">
<tr><td>
<table align="center">
<tr>
<td>
<fieldset>
<legend>Change Password & Update Security Information :
</legend>
<table cellpadding="5" cellspacing="5">
<tr>
<td colspan="2">
    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>
</td>
</tr>
<tr>
<td>Old Password :
</td>
<td>
    <asp:TextBox ID="TextBox_OldPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox_OldPassword" Display="Dynamic" 
        ErrorMessage="Required"></asp:RequiredFieldValidator>
</td>
</tr>


<tr>
<td>New Password :
</td>
<td>
    <asp:TextBox ID="TextBox_NewPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox_NewPassword" Display="Dynamic" 
        ErrorMessage="Required"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ControlToValidate="TextBox_NewPassword" Display="Dynamic" 
            ErrorMessage="Min 6 Chars" SetFocusOnError="True" 
            ValidationExpression="\w{6}\w*"></asp:RegularExpressionValidator>
</td>
</tr>
<tr>
<td>Confirm Password :
</td>
<td>
    <asp:TextBox ID="TextBox_ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="TextBox_NewPassword" 
        ControlToValidate="TextBox_ConfirmNewPassword" Display="Dynamic" 
        ErrorMessage="Not matched"></asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TextBox_ConfirmNewPassword" Display="Dynamic" 
        ErrorMessage="Required"></asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td>Security Question :
</td>
<td>
    <asp:DropDownList ID="DropDownList_SecurityQuestion" runat="server" 
        DataSourceID="SqlDataSource_question" DataTextField="question" 
        DataValueField="serial" Width="256px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource_question" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        SelectCommand="SELECT DISTINCT * FROM [user_security_question] ORDER BY [serial]">
    </asp:SqlDataSource>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="DropDownList_SecurityQuestion" Display="Dynamic" 
        ErrorMessage="Required"></asp:RequiredFieldValidator>
</td>
</tr>

<tr>
<td>Answer :
</td>
<td>
    <asp:TextBox ID="TextBox_Answer" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="TextBox_Answer" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td>Last Password Changed :
</td>
<td><asp:Label ID="Label_last_password_change_date" runat="server" Text=""></asp:Label>
</td></tr>


<tr>
<td colspan="2" >

<div style="float:left;">
Verification Code
&nbsp;&nbsp;
<asp:Label ID="Label_Captcha" runat="server"></asp:Label>


&nbsp;&nbsp;

<asp:TextBox ID="TextBox_Captcha_Answer" runat="server" Width="20%"></asp:TextBox>

</div>
</td></tr>
<tr><td colspan="2" align="right">
    <asp:Button ID="Button_Confirm" runat="server" Text="Confirm" />
</td>
</tr>






</table>
</fieldset>
</td></tr>
</table>
</td>
</tr>
</table>

</asp:Content>
