Public Class list_property
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
       
    End Sub


    Protected Sub Button_proceed_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_proceed.Click

        Try

            Dim transaction_type_serial As Integer = CInt(Me.RadioButtonList_transaction_type.SelectedValue)
            Dim property_type_serial As Integer = CInt(Me.DropDownList_property_type.SelectedValue)
            Dim new_or_resale As Integer = CInt(Me.RadioButtonList_new_or_resale.SelectedValue)
            Dim state_serial As Integer = CInt(Me.DropDownList_state.SelectedValue)
            Dim city_serial As Integer = CInt(Me.DropDownList_city.SelectedValue)
            Dim area As String = Me.TextBox_area.Text.Trim()
            Dim total_price As String = Me.TextBox_total_price.Text.Trim()
            Dim no_of_bedrooms As Integer = CInt(Me.DropDownList_no_of_bedrooms.SelectedValue)
            Dim floor_no As Integer = CInt(Me.DropDownList_floor_no.SelectedValue)
            Dim property_description As String = Me.TextBox_property_description.Text.Trim()


            Dim property_id As String = ""

            property_id = Get_property_id()





            
            Session("property_id") = property_id



            Dim username As String = Page.User.Identity.Name.ToString().Trim()
           

           

            'QUERY to save into property_main table

            Dim qry_save_property_main As String = "insert into property_main values( '" & property_id & "', " & transaction_type_serial & " , " & property_type_serial & ", " & state_serial & "," & city_serial & "," & new_or_resale & "," & no_of_bedrooms & "," & floor_no & ",'" & property_description & "','" & area & "','" & total_price & "', '0' ,'" & username & "')"
            If DBAccess.savedata(qry_save_property_main) Then

                Response.Redirect("~/Secured/Customer/list_property_optional.aspx", True)

            End If


        Catch ex As Exception
            Me.Label_status.ForeColor = Drawing.Color.Red
            Me.Label_status.Text = ex.Message
        End Try

      


    End Sub

    Private Function Get_property_id() As String
        Dim qry_latest_property_serial As String = "select max(property_serial) from property_main"
        Dim latest_property_serial As Integer = DBAccess.fetchInt(qry_latest_property_serial)
        If latest_property_serial < 1000 Then
            latest_property_serial += 1000
        End If
        Dim state_serial As Integer = CInt(Me.DropDownList_state.SelectedValue)
        Dim qry_state_code As String = "select state_code from state_master where state_serial=" & state_serial
        Dim state_code As String = DBAccess.fetchscaler(qry_state_code)


        Dim qry_city_code As String = "select city_code from city_master where city_serial=" & CInt(Me.DropDownList_city.SelectedValue)
        Dim city_code As String = DBAccess.fetchscaler(qry_city_code)

        Dim local_property_id As String = state_code & "-" & city_code & "-" & latest_property_serial + 1
        Return local_property_id



    End Function

   
End Class
