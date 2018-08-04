<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/User.Master" CodeBehind="EditApprovedProperty.aspx.vb" Inherits="project_started.EditApprovedProperty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    

    <p>
        <asp:HyperLink ID="HyperLink_approved_property" runat="server" 
            NavigateUrl="~/Secured/Users/EditUnapprovedProperty.aspx">Show Unapproved Properties</asp:HyperLink>
    </p>
    
    
    <table width="100%"><tr><td align="center">
    
    <fieldset>
    <legend>Already Approved Properties
    </legend>
    
    
    
    
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="property_id"
        DataSourceID="SqlDataSource_edit_approved_property" 
        EmptyDataText="There are no data records to display." CellPadding="4"  Width="100%"
        AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None" 
        style="margin-top: 1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="property_serial" HeaderText="Serial No" 
                InsertVisible="False" ReadOnly="True" SortExpression="property_serial" />
            <asp:HyperLinkField DataTextField="property_id" HeaderText="Property ID" 
                NavigateUrl="/Secured/Users/ShowPropertyDetails.aspx" 
                SortExpression="property_id" Target="_blank" 
                DataNavigateUrlFields="property_id" 
                DataNavigateUrlFormatString="ShowPropertyDetails.aspx?property_id={0}" />
            <asp:BoundField DataField="property_type_name" HeaderText="Property Type" 
                SortExpression="property_type_name" ReadOnly="True" />
            <asp:BoundField DataField="transaction_name" HeaderText="Transaction Type" 
                SortExpression="transaction_name" ReadOnly="True" />
            <asp:BoundField DataField="state_name" HeaderText="State" 
                SortExpression="state_name" ReadOnly="True" />
            <asp:BoundField DataField="city_name" HeaderText="City" 
                SortExpression="city_name" ReadOnly="True" />
            <asp:BoundField DataField="area" 
                HeaderText="Area Size" SortExpression="area" ReadOnly="True" />
            <asp:BoundField DataField="price" 
                HeaderText="Price" SortExpression="price" ReadOnly="True" />
            <asp:CheckBoxField DataField="is_approved" HeaderText="Approved" 
                SortExpression="is_approved" ReadOnly="True" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_edit_approved_property" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
        SelectCommand="SELECT property_main.property_serial, property_main.property_id, property_main.is_approved, property_main.area, property_main.price, state_master.state_name, city_master.city_name, property_type_master.property_type_name, transaction_type_master.transaction_name FROM city_master INNER JOIN property_main ON city_master.city_serial = property_main.city_serial INNER JOIN property_type_master ON property_main.property_type_serial = property_type_master.property_type_serial INNER JOIN state_master ON city_master.state_serial = state_master.state_serial INNER JOIN transaction_type_master ON property_main.transaction_type_serial = transaction_type_master.transaction_type_serial WHERE (property_main.is_approved = 1) ORDER BY property_main.property_serial DESC"
        DeleteCommand="DELETE FROM property_main WHERE (property_id = @property_id)"

        >
        <DeleteParameters>
            <asp:Parameter Name="property_id" />
        </DeleteParameters>
        </asp:SqlDataSource>


        
    </fieldset>
    
    
    </td></tr></table>


    <p>
    </p>
</asp:Content>
