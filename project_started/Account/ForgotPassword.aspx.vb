Public Class ForgotPassword
    Inherits System.Web.UI.Page
    Dim username As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button_key_submit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_key_submit.Click
        Dim itm As String = Me.TextBox_usernameEmail.Text.Trim()
        If Account.Is_User_Exists(itm) Then
            Me.MultiView1.ActiveViewIndex = 1
        Else
            Me.Label_status_1.ForeColor = Drawing.Color.Red
            Me.Label_status_1.Text = "Invalid Username or Email Address."
            Exit Sub

        End If
        Dim email As String = Account.GetUserEmailAddress(itm)
        Session("email") = email
        Dim email_arr() As String = email.Split("@")
        Dim hint_str As String = email_arr(0)


        hint_str = hint_str.Chars(0) & "*************" & hint_str.Chars(hint_str.Length - 1) & "@" & email_arr(1)


        Me.Label_emailHint.Text = "This is like :   " & hint_str

        Me.Label_question.Text = Account.GetUserSecurityQuestion(itm)



    End Sub

    Protected Sub Button_recoveryOption_submit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_recoveryOption_submit.Click

        username = Account.GetUserName(Me.TextBox_usernameEmail.Text.Trim())
        If Me.RadioButton_email.Checked Then

            Dim rand As New Random()

            Dim new_password As String = rand.Next(555555, 999999)
            If DBAccess.savedata("update users_info set password='" & new_password & "' where username='" & username & "'") Then
                Dim mail_body As String = "Dear " & username & "<br />According to your request on " & Date.Now.ToLongDateString() & " , your password has been reset. <br />Your new password is " & new_password

                Mail.SendEmail(Session("email"), "Real Estate Password Recovery", mail_body)
            End If

        End If
    End Sub
End Class