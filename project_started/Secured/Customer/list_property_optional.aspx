<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/Customer.Master" CodeBehind="list_property_optional.aspx.vb" Inherits="project_started.list_property_optional" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder2">
<p  >  List property : </p>
    <table  width="100%"> <tr><td>
    
    <table  align="center"><tr><td>
    
    <fieldset>
    <legend>
    Enter Optional details
    </legend>
    
    <table cellpadding="5" cellspacing="5"><tr>
    <td>
        No. of bathrooms</td>
    <td>
        <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="90px" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem Value="4">4+</asp:ListItem>
        </asp:DropDownList>
    </td></tr>

    <tr>
    <td>Total floors in buildings</td>
    <td><asp:DropDownList ID="DropDownList2" runat="server" Height="17px" Width="87px" AppendDataBoundItems="true">
    <asp:ListItem Value="0">Select</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        </asp:DropDownList>
    </td></tr>

    <tr>
    <td>Furnishing :</td>
    <td><asp:DropDownList ID="DropDownList3" runat="server" Height="19px" Width="104px" 
            DataSourceID="SqlDataSource_Furnish" DataTextField="furnish_name" 
            DataValueField="furnish_serial" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Select</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource_Furnish" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            SelectCommand="SELECT [furnish_serial], [furnish_name] FROM [furnish_master]">
        </asp:SqlDataSource>
    </td></tr>

    <tr>
    <td>Facing :</td>
    <td><asp:DropDownList ID="DropDownList4" runat="server" Height="16px" Width="100px" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Select</asp:ListItem>
        <asp:ListItem Value="1">East</asp:ListItem>
        <asp:ListItem Value="2">North-East</asp:ListItem>
        <asp:ListItem Value="3">North</asp:ListItem>
        <asp:ListItem Value="4">North-West</asp:ListItem>
        <asp:ListItem Value="5">West</asp:ListItem>
        <asp:ListItem Value="6">South-West</asp:ListItem>
        <asp:ListItem Value="7">South</asp:ListItem>
        <asp:ListItem Value="8">South-East</asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <tr><td colspan="2"> Additional Facilities :</td></tr>
    <tr><td colspan="2" rowspan="2">
        <asp:CheckBoxList ID="CheckBoxList_facility" runat="server" 
            DataSourceID="SqlDataSource_Facility" DataTextField="facility_name" 
            DataValueField="facility_serial" RepeatDirection="Horizontal">
        </asp:CheckBoxList>

        <asp:SqlDataSource ID="SqlDataSource_Facility" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            SelectCommand="SELECT [facility_serial], [facility_name] FROM [facility_master]">
        </asp:SqlDataSource>

    </td></tr>
    <tr><td></td></tr>

    <tr><td>
        <asp:Label ID="Label_upload_image" runat="server" Text="Upload Property Image :"></asp:Label>
    </td>
    <td>
        <asp:FileUpload ID="FileUpload1" runat="server" />
    </td></tr>
    <tr> <td align="center">
        
        <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>
    </td>
    <td align="right">
        
        <asp:Button ID="Button1" runat="server" Text="Post Ad" Width="35%" />
    </td>
    </tr>

    </table>
    </fieldset>
    </td></tr></table>
    
    </td></tr></table>
</asp:Content>

