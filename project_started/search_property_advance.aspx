<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="search_property_advance.aspx.vb" Inherits="project_started.search_property_advance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<p><b><u>ADVANCE SEARCH :</u></b></p>
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
            SelectCommand="SELECT [transaction_type_serial], [transaction_name] FROM [transaction_type_master] ORDER BY [transaction_name]">
        </asp:SqlDataSource>
</td>
</tr>
<tr>
<td>Property Type :
</td>
<td>
    <asp:DropDownList ID="DropDownList_property_type" runat="server" 
        DataSourceID="SqlDataSource_propertytype" DataTextField="property_type_name" 
        DataValueField="property_type_serial" Width="250px">
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
        DataValueField="state_serial" AppendDataBoundItems="true" Width="250px">
        <asp:ListItem Text="Select a state" Value="0"></asp:ListItem>
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
        DataValueField="city_serial" Width="250px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource_city" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        SelectCommand="SELECT [city_name], [city_serial], [state_serial] FROM [city_master] WHERE ([state_serial] = @state_serial) ORDER BY [city_name]">
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
        DataValueField="budget_serial" Width="250px" >
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
<tr><td>Minimum Bedroom :
</td>
<td>
    <asp:DropDownList ID="DropDownList_no_of_bedrooms" runat="server" AppendDataBoundItems="true">
    <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">> 8</asp:ListItem>
        </asp:DropDownList>
</td>
</tr>
<tr><td>Minimum Area :
</td>
<td>
    <asp:TextBox ID="TextBox_max_area" runat="server" Width="250px"></asp:TextBox>
</td>
</tr>
<tr><td>Maximum price/sq.ft. :
</td>
<td>
    <asp:TextBox ID="TextBox_price_per_sqft" runat="server" Width="250px"></asp:TextBox>
</td>
</tr>
<tr><td>Age of construction :
</td>
<td>
</td>
</tr>
<tr><td>Furnishing :
</td>
<td>
</td>
</tr>
<tr><td>Facilities :
</td>
<td>
</td>
</tr>





<tr>
<td  colspan="2" align="right">
    <asp:Button ID="Button_search" runat="server" Text="Search" />
</td></tr>
</table>

</fieldset>

</td>
</tr>

</table></td></tr></table>

</asp:Content>
