Public Class EditProfile
    Inherits System.Web.UI.Page

    Dim username As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' FormsAuthentication.SetAuthCookie("rahul6", False)

        username = Page.User.Identity.Name.Trim().ToString()

        If username = "" Then

            Response.Redirect("~/Account/login.aspx", True)

        End If

        If Not IsPostBack Then

            DropDown_DataBind_FormDatabase()
            DropDown_Date_Fill()

            If Account.Is_User_Exists_in_UserDetails(username) Then
                Restore_Customer_Details()
            End If


        End If


    End Sub

#Region "DropDown DataBind"

    Private Sub DropDown_DataBind_FormDatabase()
        Me.DropDownList_state.DataBind()
        Me.DropDownList_city.DataBind()
    End Sub

    Private Sub DropDown_Date_Fill()

        For i = 1 To 31
            Me.DropDownList_dd.Items.Add(i.ToString())

        Next

        For i = 1 To 12
            Me.DropDownList_mm.Items.Add(i.ToString())
        Next

        For i = Date.Now.Year To Date.Now.Year - 100 Step -1
            Me.DropDownList_yyyy.Items.Add(i.ToString())
        Next

    End Sub


#End Region

    Private Sub Restore_Customer_Details()

        Dim qry_Restore_Details As String = "select * from user_details where username='" & username & "'"

        Dim ds_userDetails As DataSet = DBAccess.fetchData(qry_Restore_Details, "user_details")
        If Not ds_userDetails Is Nothing Then

            If ds_userDetails.Tables(0).Rows.Count > 0 Then
                Me.table_Edit_Details.Visible = True
                Me.Label_error.Text = ""

                Me.TextBox_fullname.Text = ds_userDetails.Tables(0).Rows(0).Item(2).ToString().Trim()

                Me.DropDownList_state.SelectedValue = CInt(ds_userDetails.Tables(0).Rows(0).Item(3).ToString())
                Me.DropDownList_city.SelectedValue = CInt(ds_userDetails.Tables(0).Rows(0).Item(4).ToString())


                Dim dob As Date = CDate(ds_userDetails.Tables(0).Rows(0).Item(5).ToString().Trim())

                Me.DropDownList_dd.SelectedValue = dob.Day
                Me.DropDownList_mm.SelectedValue = dob.Month
                Me.DropDownList_yyyy.SelectedValue = dob.Year
                Dim gender As String = ds_userDetails.Tables(0).Rows(0).Item(6).ToString().Trim()
                If gender.ToUpper() = "M" Then
                    Me.RadioButtonList_gender.Items(0).Selected = True
                ElseIf gender.ToString() = "F" Then
                    Me.RadioButtonList_gender.Items(1).Selected = True
                End If

                Me.TextBox_mobile.Text = ds_userDetails.Tables(0).Rows(0).Item(7).ToString().Trim()


            Else
                Me.table_Edit_Details.Visible = False
                Me.Label_error.Text = "Some unknown problem arrise. Try again later."
                Exit Sub

            End If

        End If



    End Sub


    Protected Sub Button_submit2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_submit2.Click
        If Account.Is_User_Exists_in_UserDetails(username) Then
            UpdateData()
        Else
            SaveData()
        End If
    End Sub

    'IF PROFILE IS INVALID then SaveData() function will work :
    Private Sub SaveData()
        Try

            Dim fullname As String = Me.TextBox_fullname.Text.Trim()
            Dim state_serial As Integer = CInt(Me.DropDownList_state.SelectedValue)
            Dim city_serial As Integer = CInt(Me.DropDownList_city.SelectedValue)
            Dim date_of_birth As Date = CDate(Me.DropDownList_dd.SelectedValue & "/" & Me.DropDownList_mm.SelectedValue & "/" & Me.DropDownList_yyyy.SelectedValue)
            Dim gender As String = Me.RadioButtonList_gender.SelectedValue
            Dim mobile_no As String = Me.TextBox_mobile.Text.Trim()
            username = Page.User.Identity.Name.ToString().Trim()

            If Account.Is_User_Exists(username) Then
                'User Just Registered

                    Dim qry_Save_User_Details As String = "insert into user_details values('" & username & "','" & fullname & "'," & state_serial & "," & city_serial & ",'" & date_of_birth & "','" & gender & "','" & mobile_no & "')"

                If DBAccess.savedata(qry_Save_User_Details) Then

                    DBAccess.savedata("update users_info set is_valid=1 where username='" & username & "'")

                    Me.Label_Status.ForeColor = Drawing.Color.Green

                    'NOT WORKING THIS "DATE" the under 2 lines please check'
                    'Dim UpdateTime As Date = System.DateTime.Now
                    'Me.Label_Status.Text = "Your Information stored successfully at" & UpdateTime & " . Go to your <a href=""/Secured/Customer/CustomerHome.aspx"">Home</a>"

                    
                    Me.Label_Status.Text = "Your Information stored successfully. Go to your <a href=""/Secured/Customer/CustomerHome.aspx"">Home</a>"

                End If

            Else

                Response.Redirect("register.aspx", True)

            End If

          
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub


    Private Sub UpdateData()
        Try

            Dim fullname As String = Me.TextBox_fullname.Text.Trim()
            Dim state_serial As Integer = CInt(Me.DropDownList_state.SelectedValue)
            Dim city_serial As Integer = CInt(Me.DropDownList_city.SelectedValue)

            Dim date_of_birth As Date = CDate(Me.DropDownList_dd.SelectedValue & "/" & Me.DropDownList_mm.SelectedValue & "/" & Me.DropDownList_yyyy.SelectedValue)


            Dim gender As String = Me.RadioButtonList_gender.SelectedValue
            Dim mobile_no As String = Me.TextBox_mobile.Text.Trim()
            username = Page.User.Identity.Name.ToString().Trim()


            If Account.Is_User_Exists(username) Then
                'User Just Registered


                'Dim qry_Save_User_Details As String = "insert into user_details values('" & username & "','" & fullname & "'," & state_serial & "," & city_serial & ",'" & date_of_birth & "','" & gender & "','" & mobile_no & "')"

                Dim qry_Update_User_Details As String = "update user_details set full_name='" & fullname & "',state_serial=" & state_serial & ",city_serial=" & city_serial & ",dob='" & date_of_birth & "',gender='" & gender & "',mobile='" & mobile_no & "' where username='" & username & "'"



                If DBAccess.savedata(qry_Update_User_Details) Then

                    'Response.Redirect("/Secured/Customer/CustomerHome.aspx", True)
                    Me.Label_Status.ForeColor = Drawing.Color.Green
                    Me.Label_Status.Text = "Your Information updated successfully. Go to your <a href=""/Secured/Customer/CustomerHome.aspx"">Home</a>"

                End If

            Else

                Response.Redirect("register.aspx", True)

            End If


        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
End Class