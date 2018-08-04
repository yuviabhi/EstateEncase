<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Customer.Master" CodeBehind="EditProfile.aspx.vb" Inherits="project_started.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">



    <p ><b>  PROFILE INFORMATION  : </b></p>

  <table align="center"><tr><td>
  <fieldset>
    <legend><b>
        PERSONEL DETAILS :
    </b></legend>
<table id="table_Edit_Details" runat="server" cellpadding="5" cellspacing="5"><tr><td>
    <asp:Label ID="Label_fullname" runat="server" Text="Full Name"></asp:Label></td>
    <td>
        <asp:TextBox ID="TextBox_fullname" runat="server" Width="219px"></asp:TextBox>
    </td></tr>

    <tr><td>
        <asp:Label ID="Label_state" runat="server" Text="State"></asp:Label>
    </td><td>
        <asp:DropDownList ID="DropDownList_state" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource_state" DataTextField="state_name" 
                DataValueField="state_serial">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_state" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
                SelectCommand="SELECT [state_name], [state_serial] FROM [state_master] order by state_serial">
            </asp:SqlDataSource>
    </td></tr>

    <tr><td>
        <asp:Label ID="Label_city" runat="server" Text="City"></asp:Label>
    </td><td>
        <asp:DropDownList ID="DropDownList_city" runat="server" 
                DataSourceID="SqlDataSource_city" DataTextField="city_name" 
                DataValueField="city_serial">
        </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_city" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
                SelectCommand="SELECT DISTINCT [city_serial], [city_name] FROM [city_master] WHERE ([state_serial] = @state_serial) order by city_serial">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList_state" Name="state_serial" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
    </td></tr>
    <tr><td>
        <asp:Label ID="Label_DOB" runat="server" Text="Date Of Birth"></asp:Label>
    </td><td>
        <asp:DropDownList ID="DropDownList_dd" runat="server" AppendDataBoundItems="true">
        <asp:ListItem Text="Select" value="x"></asp:ListItem>
        </asp:DropDownList>

        &nbsp;<asp:DropDownList ID="DropDownList_mm" runat="server" AppendDataBoundItems="true">
         <asp:ListItem Text="Select" value="x"></asp:ListItem>
        </asp:DropDownList>
        &nbsp;<asp:DropDownList ID="DropDownList_yyyy" runat="server" AppendDataBoundItems="true">
         <asp:ListItem Text="Select" value="x"></asp:ListItem>
        </asp:DropDownList>
        <br />
        &nbsp&nbsp&nbsp&nbsp&nbsp
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="DD" ControlToValidate="DropDownList_dd" Display="Dynamic" 
                ValidationExpression="\d+"></asp:RegularExpressionValidator>&nbsp&nbsp&nbsp&nbsp&nbsp
                &nbsp&nbsp&nbsp
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="MM" ControlToValidate="DropDownList_mm" Display="Dynamic" 
                ValidationExpression="\d+"></asp:RegularExpressionValidator>
                &nbsp&nbsp&nbsp&nbsp&nbsp
                &nbsp
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ErrorMessage="YYYY" ControlToValidate="DropDownList_yyyy" Display="Dynamic" 
                ValidationExpression="\d+"></asp:RegularExpressionValidator>
    </td></tr>

    <tr><td>
        <asp:Label ID="Label_gender" runat="server" Text="Gender"></asp:Label>
    </td><td>
        <asp:RadioButtonList ID="RadioButtonList_gender" runat="server" 
                RepeatDirection="Horizontal">
            <asp:ListItem Value="M">Male</asp:ListItem>
            <asp:ListItem Value="F">Female</asp:ListItem>
        </asp:RadioButtonList>
    </td></tr>


    <tr><td>
        <asp:Label ID="Label_mob" runat="server" Text="Mobile No."></asp:Label>
    </td><td>
        <asp:TextBox ID="TextBox_mobcode" runat="server" Width="35px" ReadOnly="True">+91</asp:TextBox> &nbsp &nbsp
        <asp:TextBox ID="TextBox_mobile" runat="server" ForeColor="Black" MaxLength="10"></asp:TextBox>
    </td></tr>

    <tr><td colspan="2">
    
    <asp:Label ID=Label_Status runat="server"></asp:Label>
    
    </td></tr>

    <tr><td align="right">
    &nbsp;</td>
<td align="right">    <asp:Button ID="Button_submit2" runat="server" 
        Text="SAVE" />

</td></tr>

    



</table>
</fieldset>

      <asp:Label ID="Label_error" Font-Bold="true" ForeColor="Red" runat="server" Text=""></asp:Label>

</td></tr></table>





</asp:Content>
