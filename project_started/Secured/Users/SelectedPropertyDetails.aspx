<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/User.Master" CodeBehind="SelectedPropertyDetails.aspx.vb" Inherits="project_started.SelectedPropertyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<table>
<tr>
<td>
<table width="100%" align="center">
<tr>
<td>
<table align="center">
<tr>
<td>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" 
        CellPadding="4" DataSourceID="SqlDataSource_SelectedProperty_details" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource_SelectedProperty_details" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        SelectCommand="SELECT property_main.property_id, transaction_type_master.transaction_name, property_type_master.property_type_name, state_master.state_name, city_master.city_name, property_main.is_new_property, property_type_master.is_residential, property_optional.facing_serial, property_main.no_of_bedrooms, property_main.floor_no, property_optional.no_of_bathrooms, property_optional.total_floor, property_main.description, property_main.area, property_main.price, property_main.is_approved, property_main.username, user_details.full_name, user_details.dob, user_details.gender, user_details.mobile, users_info.email, users_info.is_valid, users_info.is_locked, users_info.last_login, furnish_master.furnish_serial, FROM city_master INNER JOIN property_main ON city_master.city_serial = property_main.city_serial INNER JOIN property_optional ON property_main.property_id = property_optional.property_id INNER JOIN property_type_master ON property_main.property_type_serial = property_type_master.property_type_serial INNER JOIN state_master ON city_master.state_serial = state_master.state_serial INNER JOIN transaction_type_master ON property_main.transaction_type_serial = transaction_type_master.transaction_type_serial INNER JOIN user_details ON city_master.city_serial = user_details.city_serial AND state_master.state_serial = user_details.state_serial AND property_main.username = user_details.username INNER JOIN users_info ON user_details.username = users_info.username INNER JOIN furnish_master ON property_optional.furnish_serial = furnish_master.furnish_serial INNER JOIN property_image INNER JOIN facility_master WHERE (property_id=&amp;property_id)">
    </asp:SqlDataSource>

</td></tr></table>
</td></tr></table>

</td></tr>    
</table>


</asp:Content>
