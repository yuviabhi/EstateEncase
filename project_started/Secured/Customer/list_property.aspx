<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="../../Masters/Customer.Master" CodeBehind="list_property.aspx.vb" Inherits="project_started.list_property" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <p  >  <b>List property : </b></p>
 
    <table  width="100%" align="center"><tr><td>
    <table  align="center"><tr><td>
    <fieldset>
    <legend><b>
    PROPERTY INFORMATION
    </b></legend>
        <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

    <table cellpadding="5" cellspacing="5"><tr><td>
    
    <asp:Label ID="Label_transaction_type" runat="server" Text="Transaction Type : "></asp:Label>
    </td>
    <td colspan="2">
        <asp:RadioButtonList ID="RadioButtonList_transaction_type" runat="server" 
            DataSourceID="SqlDataSource_Transaction_type" DataTextField="transaction_name" 
            DataValueField="transaction_type_serial" RepeatDirection="Horizontal">
        </asp:RadioButtonList>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="RadioButtonList_transaction_type" Display="Dynamic" 
            ErrorMessage="Select"></asp:RequiredFieldValidator>

        <asp:SqlDataSource ID="SqlDataSource_Transaction_type" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            SelectCommand="SELECT [transaction_name], [transaction_type_serial] FROM [transaction_type_master] ORDER BY [transaction_type_serial], [transaction_name]">
        </asp:SqlDataSource>

    </td>
    </tr>
    
    <tr><td>
        <asp:Label ID="Label_property_type" runat="server" Text="Property Type :"></asp:Label>
    </td>
    <td  colspan="2" class="style1">
        <asp:DropDownList ID="DropDownList_property_type" runat="server" 
            DataSourceID="SqlDataSource_Property_type" DataTextField="property_type_name" 
            DataValueField="property_type_serial" AppendDataBoundItems="true">
            <asp:ListItem Value="0">Select</asp:ListItem>
        
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource_Property_type" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            SelectCommand="SELECT [property_type_serial], [property_type_name] FROM [property_type_master] ORDER BY [is_residential] DESC, [property_type_name]"></asp:SqlDataSource>
        
    </td></tr>

    <tr><td>
        <asp:Label ID="Label_new_or_resale" runat="server" Text="New / Resale Property"></asp:Label>
    </td>
    <td class="style1"><asp:RadioButtonList ID="RadioButtonList_new_or_resale" runat="server" 
            RepeatDirection="Horizontal">
            <asp:ListItem Value="1">New</asp:ListItem>
            <asp:ListItem Value="0">Resale</asp:ListItem>
            
        </asp:RadioButtonList>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="RadioButtonList_new_or_resale" Display="Dynamic" 
            ErrorMessage="Select"></asp:RequiredFieldValidator>
        
</td></tr>
<tr><td>
        <asp:Label ID="Label_state" runat="server" Text="State :"></asp:Label>
    </td>
    <td class="style1">
        <asp:DropDownList ID="DropDownList_state" runat="server" 
            DataSourceID="SqlDataSource_State" DataTextField="state_name" 
            DataValueField="state_serial" AutoPostBack="True" Width="250px" AppendDataBoundItems="true">
         <asp:ListItem  Text="Select a state" Value="0"></asp:ListItem>

         </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource_State" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            SelectCommand="SELECT [state_serial], [state_name] FROM [state_master]">
        </asp:SqlDataSource>
     
    </td></tr>

    <tr><td>
        <asp:Label ID="Label_city" runat="server" Text="City :" ></asp:Label>
    </td>
    <td class="style1">
        <asp:DropDownList ID="DropDownList_city" runat="server" 
            DataSourceID="SqlDataSource_City" DataTextField="city_name" 
            DataValueField="city_serial" Width="250px">
            
            </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource_City" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            
            SelectCommand="SELECT DISTINCT [city_serial], [city_name] FROM [city_master] WHERE ([state_serial] = @state_serial)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList_state" Name="state_serial" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </td></tr>

    <tr><td>
        <asp:Label ID="Label_area" runat="server" Text="Area (In sq.ft.) :"></asp:Label>
    </td>
    <td class="style1">
        <asp:TextBox ID="TextBox_area" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="TextBox_area" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>
    </td>
    <td>
        
        <asp:HyperLink ID="HyperLink_unit_converter" runat="server" > <u> Unit converter </u></asp:HyperLink>
    </td></tr>
    <tr><td>
        <asp:Label ID="Label_total_price" runat="server" Text="Total Price"></asp:Label>
    </td>
    <td class="style1" >
        <asp:TextBox ID="TextBox_total_price" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
            ControlToValidate="TextBox_total_price" Display="Dynamic" 
            ErrorMessage="Required"></asp:RequiredFieldValidator>
    </td></tr>

    <tr><td>
        <asp:Label ID="Label_no_of_bedrooms" runat="server" Text="No. of bedrooms"></asp:Label>
    </td>
    <td><asp:DropDownList ID="DropDownList_no_of_bedrooms" runat="server" AppendDataBoundItems="true">
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
        
    </td></tr>
    
    <tr><td>
        <asp:Label ID="Label_floor_no" runat="server" Text="Floor No"></asp:Label>
    </td>
    <td>
        <asp:DropDownList ID="DropDownList_floor_no" runat="server" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Select</asp:ListItem>
            <asp:ListItem Value="0">Ground Floor</asp:ListItem>
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
        </asp:DropDownList>
    </td></tr>

    <tr><td colspan="4">
        <asp:Label ID="Label_property_description" runat="server" Text="Property description (Min. 100 characters)"></asp:Label>
    </td></tr>
     
     <tr>
     <td colspan="5">
         <asp:TextBox ID="TextBox_property_description" runat="server" 
             TextMode="MultiLine" Width="100%" Height="30px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
             ControlToValidate="TextBox_property_description" Display="Dynamic" 
             ErrorMessage="Required"></asp:RequiredFieldValidator>
     </td></tr>

     <tr><td align="right" colspan="3">
         <asp:Button ID="Button_proceed" runat="server" Text="PROCEED" Height="26px" 
             style="margin-left: 14px" Width="126px" />
     </td></tr>
    </table>
    </fieldset>
    </td></tr></table>
    
    </td></tr></table>
    
    
</asp:Content>


