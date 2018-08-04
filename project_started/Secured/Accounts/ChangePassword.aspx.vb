Public Class EditPassword
    Inherits System.Web.UI.Page
    Dim username As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        username = Page.User.Identity.Name.ToString.Trim()
        username = "abhisek12"

        'WEB.CONFIG required 
        ' If username = "" Then
        'Response.Redirect("/Account/login.aspx", False)
        'End If

        If Not IsPostBack Then
            DisplayCaptcha()

            If Account.Is_User_Exists_in_UserDetails(username) Then
                Restore_Security_Details()
            End If
            Me.Label_status.Text = ""
        End If


    End Sub

    Private Sub Restore_Security_Details()

        Dim qry_security_details As String = "select * from users_info where username='" & username & "'"
        Dim ds_security_info As DataSet = DBAccess.fetchData(qry_security_details, "users_info")


        If Not ds_security_info Is Nothing Then

            If ds_security_info.Tables(0).Rows.Count > 0 Then

                Me.Label_status.Text = ""
                Dim security_question As Integer
                Try

                    security_question = CInt(ds_security_info.Tables(0).Rows(0).Item(4).ToString.Trim())
                Catch ex As Exception
                    security_question = 0
                End Try
                If security_question <> 0 Then
                    Me.DropDownList_SecurityQuestion.DataBind()
                    Me.DropDownList_SecurityQuestion.SelectedValue = security_question
                    Me.TextBox_Answer.Text = "************"
                    Me.TextBox_OldPassword.Focus()
                    Me.Label_last_password_change_date.ForeColor = Drawing.Color.Blue
                    Me.Label_last_password_change_date.Text = ds_security_info.Tables(0).Rows(0).Item(7).ToString.Trim()

                End If


            End If

        End If

    End Sub

    Protected Sub Button_Confirm_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_Confirm.Click


        Dim captcha_answer As String = Me.TextBox_Captcha_Answer.Text.Trim()
        If Not IsNumeric(captcha_answer) Then
            Me.Label_status.ForeColor = Drawing.Color.Red
            Me.Label_status.Text = "Enter CAPTCHA correctly."
            Exit Sub
        End If


        If Not Session("res") = captcha_answer Then
            Me.Label_status.ForeColor = Drawing.Color.Red
            Me.Label_status.Text = "Enter CAPTCHA correctly."
            Exit Sub
        End If

        DisplayCaptcha()


        Dim qry_password As String = "select password from users_info where username='" & username & "'"
        Dim fetched_old_password As String = DBAccess.fetchscaler(qry_password)

        Dim given_old_password As String = Me.TextBox_OldPassword.Text.Trim()
        Dim new_password As String = Me.TextBox_NewPassword.Text.Trim()
        Dim security_question As Integer = CInt(Me.DropDownList_SecurityQuestion.SelectedValue)
        Dim security_answer As String = Me.TextBox_Answer.Text.Trim()
        Dim last_password_change_time As Date = System.DateTime.Now


        If fetched_old_password = given_old_password Then
            Dim qry_update_security_details As String = "update users_info set password='" & new_password & "',security_question_serial=" & security_question & ",security_answer='" & security_answer & "',last_password_changed='" & last_password_change_time & "' where username='" & username & "'"
            DBAccess.savedata(qry_update_security_details)
            Me.Label_status.ForeColor = Drawing.Color.Green
            Me.Label_status.Text = "Password and Security question updated successfully"
            Restore_Security_Details()
            Exit Sub
        End If



            Me.Label_status.ForeColor = Drawing.Color.Red
        Me.Label_status.Text = "Old Password did not match"

    End Sub


    Private Sub DisplayCaptcha()

        Dim rand As New Random()
        Dim f_no As Integer = rand.Next(1, 9)
        Dim s_no As Integer = rand.Next(1, 9)
        Dim res As Integer = f_no + s_no

        Session("res") = res

        Me.Label_Captcha.Text = f_no.ToString() & " + " & s_no.ToString() & " = ?   "

    End Sub



End Class