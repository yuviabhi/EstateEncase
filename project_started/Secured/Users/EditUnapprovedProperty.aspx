<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="EditUnapprovedProperty.aspx.vb" Inherits="project_started.approved_property" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <p>
        <asp:HyperLink ID="HyperLink_EditApprovedProperty" runat="server" 
            NavigateUrl="~/Secured/Users/EditApprovedProperty.aspx">Edit Already Approved Properties</asp:HyperLink>
    </p>
    

    <table width="100%"><tr><td align="center">
    
    <fieldset><legend>Un Approved Properties</legend>
    
    
    
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataKeyNames="property_id" 
            DataSourceID="SqlDataSource_property_main" GridLines="None" Width="100%" 
            AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="property_serial" HeaderText="Serial No" 
                    InsertVisible="False" ReadOnly="True" SortExpression="property_serial" />
                <asp:HyperLinkField DataNavigateUrlFields="property_id" 
                    DataNavigateUrlFormatString="ShowPropertyDetails.aspx?property_id={0}" 
                    DataTextField="property_id" HeaderText="Property ID" 
                    NavigateUrl="/Secured/Users/ShowPropertyDetails.aspx" 
                    SortExpression="property_id" Target="_blank" />
                <asp:BoundField DataField="property_type_name" HeaderText="Property Name" 
                    SortExpression="property_type_name" ReadOnly="True" />
                <asp:BoundField DataField="transaction_name" HeaderText="Transaction Type" 
                    SortExpression="transaction_name" ReadOnly="True" />
                <asp:BoundField DataField="state_name" HeaderText="State" 
                    SortExpression="state_name" ReadOnly="True" />
                <asp:BoundField DataField="city_name" HeaderText="City" 
                    SortExpression="city_name" ReadOnly="True" />
                <asp:BoundField DataField="area" HeaderText="Area Size" SortExpression="area" 
                    ReadOnly="True" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" 
                    ReadOnly="True" />
                <asp:CheckBoxField DataField="is_approved" HeaderText="Approval" 
                    SortExpression="is_approved" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                    AccessibleHeaderText="To Do" ButtonType="Button" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource_property_main" runat="server" 
            ConnectionString="<%$ ConnectionStrings:Real_Estate_DBConnectionString %>" 
            
            SelectCommand="SELECT transaction_type_master.transaction_name, property_type_master.property_type_name, city_master.city_name, state_master.state_name, property_main.property_serial, property_main.property_id, property_main.area, property_main.price, property_main.is_approved FROM property_main INNER JOIN city_master ON property_main.city_serial = city_master.city_serial INNER JOIN state_master ON property_main.state_serial = state_master.state_serial INNER JOIN property_type_master ON property_main.property_type_serial = property_type_master.property_type_serial INNER JOIN transaction_type_master ON property_main.transaction_type_serial = transaction_type_master.transaction_type_serial WHERE (property_main.is_approved = 0) ORDER BY property_main.property_serial DESC" 
            DeleteCommand="DELETE FROM property_main WHERE (property_id = @property_id)" 
            
            
            UpdateCommand="UPDATE property_main SET is_approved = @is_approved WHERE (property_id = @property_id)">
           
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView1" Name="property_id" 
                    PropertyName="SelectedValue" DbType="Int32" />
            </DeleteParameters>
           
            <UpdateParameters>
                <asp:ControlParameter ControlID="GridView1" Name="is_approved" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="GridView1" Name="property_id" 
                    PropertyName="SelectedValue" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    
    
    
    
    </fieldset>
    
    
    </td></tr></table>


    <p>
    </p>


</asp:Content>
