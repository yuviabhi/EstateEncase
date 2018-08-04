<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/User.Master" CodeBehind="ShowPropertyDetails.aspx.vb" Inherits="project_started.ShowPropertyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<table width="100%" ><tr>
<td>
    
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="500px" 
        AutoGenerateRows="False" 
        DataSourceID="SqlDataSource_PropertyDetails" 
        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
        CaptionAlign="Top" CellPadding="2" ForeColor="Black" GridLines="None" 
        HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <Fields>
            <asp:BoundField DataField="city_name" HeaderText="city_name" 
                SortExpression="city_name" />
            <asp:BoundField DataField="state_name" HeaderText="state_name" 
                SortExpression="state_name" />
            <asp:BoundField DataField="facility_name" HeaderText="facility_name" 
                SortExpression="facility_name" />
            <asp:BoundField DataField="no_of_bathrooms" HeaderText="no_of_bathrooms" 
                SortExpression="no_of_bathrooms" />
            <asp:BoundField DataField="total_floor" HeaderText="total_floor" 
                SortExpression="total_floor" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:CheckBoxField DataField="is_valid" HeaderText="is_valid" 
                SortExpression="is_valid" />
            <asp:CheckBoxField DataField="is_locked" HeaderText="is_locked" 
                SortExpression="is_locked" />
            <asp:BoundField DataField="furnish_name" HeaderText="furnish_name" 
                SortExpression="furnish_name" />
            <asp:BoundField DataField="property_type_name" HeaderText="property_type_name" 
                SortExpression="property_type_name" />
            <asp:CheckBoxField DataField="is_residential" HeaderText="is_residential" 
                SortExpression="is_residential" />
            <asp:BoundField DataField="image_id" HeaderText="image_id" 
                SortExpression="image_id" />
            <asp:BoundField DataField="transaction_name" HeaderText="transaction_name" 
                SortExpression="transaction_name" />
            <asp:BoundField DataField="property_id" HeaderText="property_id" 
                SortExpression="property_id" />
            <asp:BoundField DataField="property_serial" HeaderText="property_serial" 
                SortExpression="property_serial" InsertVisible="False" ReadOnly="True" />
            <asp:CheckBoxField DataField="is_new_property" HeaderText="is_new_property" 
                SortExpression="is_new_property" />
            <asp:BoundField DataField="no_of_bedrooms" HeaderText="no_of_bedrooms" 
                SortExpression="no_of_bedrooms" />
            <asp:BoundField DataField="floor_no" HeaderText="floor_no" 
                SortExpression="floor_no" />
            <asp:BoundField DataField="description" HeaderText="description" 
                SortExpression="description" />
            <asp:BoundField DataField="area" HeaderText="area" 
                SortExpression="area" />
            <asp:BoundField DataField="price" HeaderText="price" 
                SortExpression="price" />
            <asp:CheckBoxField DataField="is_approved" HeaderText="is_approved" 
                SortExpression="is_approved" />
            <asp:BoundField DataField="username" HeaderText="username" 
                SortExpression="username" />
        </Fields>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
            HorizontalAlign="Center" />
    </asp:DetailsView>
    
    <asp:SqlDataSource ID="SqlDataSource_PropertyDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        SelectCommand="SELECT city_master.city_name, state_master.state_name, facility_master.facility_name, property_optional.no_of_bathrooms, property_optional.total_floor, users_info.email, users_info.is_valid, users_info.is_locked, furnish_master.furnish_name, property_type_master.property_type_name, property_type_master.is_residential, property_image.image_id, transaction_type_master.transaction_name, property_main.property_id, property_main.property_serial, property_main.is_new_property, property_main.no_of_bedrooms, property_main.floor_no, property_main.description, property_main.area, property_main.price, property_main.is_approved, property_main.username FROM city_master INNER JOIN property_main ON city_master.city_serial = property_main.city_serial INNER JOIN property_optional ON property_main.property_id = property_optional.property_id INNER JOIN property_type_master ON property_main.property_type_serial = property_type_master.property_type_serial INNER JOIN state_master ON city_master.state_serial = state_master.state_serial INNER JOIN transaction_type_master ON property_main.transaction_type_serial = transaction_type_master.transaction_type_serial INNER JOIN user_details ON city_master.city_serial = user_details.city_serial AND state_master.state_serial = user_details.state_serial INNER JOIN users_info ON user_details.username = users_info.username CROSS JOIN furnish_master CROSS JOIN property_image CROSS JOIN facility_master WHERE (property_main.property_id = @property_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="property_id" QueryStringField="property_id" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    </td></tr></table>

</asp:Content>

