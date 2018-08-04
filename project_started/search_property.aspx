<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="search_property.aspx.vb" Inherits="project_started.search_property" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<table width="100%">
<tr><td>
<table align="center">
<tr>
<td>
<fieldset>
<legend>Search with following requirements :
</legend>
<asp:Label ID="Label_status" runat="server" Text=""></asp:Label>
<table cellpadding="5" cellspacing="5" width="100%">
<tr><td>Transaction Type :
</td><td>
    <asp:RadioButtonList ID="RadioButtonList_transaction_type" runat="server" 
            AutoPostBack="True" DataSourceID="SqlDataSource_transactiontype1" 
            DataTextField="transaction_name" DataValueField="transaction_type_serial" 
            RepeatDirection="Horizontal">

    </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSource_transactiontype1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            SelectCommand="SELECT [transaction_type_serial], [transaction_name] FROM [transaction_type_master]">
        </asp:SqlDataSource>
</td>
</tr>
<tr>
<td>Property Type :
</td>
<td>
    <asp:DropDownList ID="DropDownList_property_type" runat="server" 
        DataSourceID="SqlDataSource_propertytype" DataTextField="property_type_name" 
        DataValueField="property_type_serial">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource_propertytype" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        
        SelectCommand="SELECT [property_type_serial], [property_type_name] FROM [property_type_master] ORDER BY [property_type_name]">
    </asp:SqlDataSource>
</td>
</tr>
<tr>
<td>State :
</td>
<td>
    <asp:DropDownList ID="DropDownList_state" runat="server" AutoPostBack="True" 
        DataSourceID="SqlDataSource_state" DataTextField="state_name" 
        DataValueField="state_serial">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource_state" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        
        SelectCommand="SELECT [state_name], [state_serial] FROM [state_master] ORDER BY [state_name]">
    </asp:SqlDataSource>
</td>
</tr>
<tr>
<td>City :
</td>
<td>
    <asp:DropDownList ID="DropDownList_city" runat="server" 
        DataSourceID="SqlDataSource_city" DataTextField="city_name" 
        DataValueField="city_serial">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource_city" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        SelectCommand="SELECT [city_name], [city_serial], [state_serial] FROM [city_master] WHERE ([state_serial] = @state_serial)
order by city_name asc">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList_state" Name="state_serial" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</td></tr>
<tr>
<td>Budget :
</td>
<td>
    <asp:DropDownList ID="DropDownList_budget" runat="server" 
        DataSourceID="SqlDataSource_budget1" DataTextField="budget_amount" 
        DataValueField="budget_serial">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource_budget1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        SelectCommand="SELECT [budget_serial], [budget_amount], [transaction_type_serial] FROM [budget_master] WHERE ([transaction_type_serial] = @transaction_type_serial)">
        <SelectParameters>
            <asp:ControlParameter ControlID="RadioButtonList_transaction_type" 
                Name="transaction_type_serial" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</td>
</tr>
<tr><td>
    <asp:HyperLink ID="HyperLink_advance_search" runat="server" 
        NavigateUrl="~/search_property_advance.aspx"><b>Advance Search</b></asp:HyperLink>

</td>
<td  align="right">
    <asp:Button ID="Button_search" runat="server" Text="Search" />
</td></tr>
</table>

</fieldset>

<fieldset>
<legend>Search by property id :
</legend>
<table cellspacing="5" cellpadding="5" width="100%">
<tr><td>Property ID :
</td>
<td>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</td></tr>
<tr>
<td colspan="2" align="right">
    <asp:Button ID="Button_search_with_id" runat="server" Text="Search" />
</td></tr>
</table></fieldset>
</td>
</tr>

</table></td></tr></table>

</asp:Content>


