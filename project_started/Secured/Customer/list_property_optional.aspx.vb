Public Class list_property_optional
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("property_id") Is Nothing Then
            Response.Redirect("list_property.aspx")
            Exit Sub
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click

        Try

            Dim no_of_bathrooms As Integer = CInt(Me.DropDownList1.SelectedValue)
            Dim total_floor_in_buildings As Integer = CInt(Me.DropDownList2.SelectedValue)
            Dim furnish As Integer = CInt(Me.DropDownList3.SelectedValue)
            Dim facing As Integer = CInt(Me.DropDownList4.SelectedValue)
            'Dim property_budget As Integer = Me.DropDownList_budget.SelectedValue
            'Dim facility As Integer = Me.CheckBoxList_facility.SelectedValue
            'Dim budget As Integer = Me.DropDownList_budget.SelectedValue


      






            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'IMAGE UPLOAD

            Dim file_name As String = Me.FileUpload1.PostedFile.FileName.ToString().Trim()
            Dim image_id As String = Session("property_id") & "_" & file_name


            If Not Me.FileUpload1.PostedFile.FileName.EndsWith(".jpg") Then
                Me.Label_status.ForeColor = Drawing.Color.Red
                Me.Label_status.Text = "Only JPG images are allowed"
                Exit Sub
            Else
                Dim file_path_server As String = Server.MapPath("/Images/") & image_id
                Me.FileUpload1.PostedFile.SaveAs(file_path_server)
            End If


            'QUERY to save into property_image table
            Dim qry_save_property_image As String = "insert into property_image values( '" & Session("property_id").ToString() & "','" & image_id & "') "
            DBAccess.savedata(qry_save_property_image)


            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

            Dim fas As String = ""
            For Each itm As ListItem In Me.CheckBoxList_facility.Items

                If itm.Selected Then
                    fas &= itm.Value.ToString() & ","
                End If

            Next




            ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
            'QUERY to save into property_optional table
            Dim qry_save_property_optional As String = "insert into property_optional values ('" & Session("property_id").ToString() & "'," & no_of_bathrooms & "," & total_floor_in_buildings & "," & facing & "," & furnish & ",'" & fas & "')"


            If DBAccess.savedata(qry_save_property_optional) Then
                'Showing PROPERTY ID after saving into database
                Me.Label_status.ForeColor = Drawing.Color.Green
                Me.Label_status.Text = "Your Property ID is " & Session("property_id").ToString.Trim()
            Else
                Me.Label_status.ForeColor = Drawing.Color.OrangeRed
                Me.Label_status.Text = "Data not saved. Try again from first with appropriate value."
            End If








        Catch ex As Exception
            Me.Label_status.Text = ex.Message
        End Try






    End Sub
End Class