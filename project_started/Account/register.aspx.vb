Public Class register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Display_captcha()
            Me.Label_status.Text = ""
        End If
 
        If Me.Page.User.Identity.IsAuthenticated() Then

            Response.Redirect("/Secured/Customer/CustomerHome.aspx", True)
            Exit Sub

        End If

    End Sub

    Protected Sub Button_submit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_submit.Click


        Dim captcha_answer As String = Me.TextBox_Captcha.Text.ToString()

        If Not IsNumeric(captcha_answer) Then
            Me.Label_status.ForeColor = Drawing.Color.Red
            Me.Label_status.Text = "Enter captcha in correct way "
            Exit Sub
        End If

        If Not captcha_answer = Session("res") Then
            Me.Label_status.ForeColor = Drawing.Color.Red
            Me.Label_status.Text = "Captcha not matched ! "
            Exit Sub

        End If

        Display_captcha()

        If UserAlreadyRegistered_Handler() = False Then

            Exit Sub
        End If

        Try

            If Not CheckBox_accept.Checked Then
                Me.Label_status.ForeColor = Drawing.Color.Red
                Me.Label_status.Text = "You must have to accept our Terms and Condition."
                Exit Sub
            End If




            Dim username As String = Me.TextBox_username.Text.Trim()
            Dim password As String = Me.TextBox_password.Text.Trim()
            Dim email = Me.TextBox_email.Text.Trim()

            If Account.UserRegister(username, password, email) Then

                FormsAuthentication.SetAuthCookie(username, False)
                Session("username") = username

                Response.Redirect("/Secured/Customer/EditProfile.aspx", True)
                Exit Sub

            Else
                Me.Label_status.ForeColor = Drawing.Color.Red
                Me.Label_status.Text = "Error"
            End If





        Catch ex As Exception

        End Try
    End Sub




    Private Function UserAlreadyRegistered_Handler()

        Dim username As String = Me.TextBox_username.Text.ToString().Trim()

        If Account.Is_User_Exists(username) Then
            Me.Label_status.ForeColor = Drawing.Color.Red
            Me.Label_status.Text = "The username : " & username & " already exists in our record. Please <a href=""login.aspx"">Sign In</a> or choose another username."
            Return False
        Else
            Return True
        End If


    End Function


    Private Sub Display_captcha()

        Dim random As New Random()
        Dim first_no As Integer = random.Next(1, 9)
        Dim second_no As Integer = random.Next(1, 9)
        Dim res As Integer = first_no + second_no

        Me.Label_Captcha.Text = first_no.ToString() & " + " & second_no.ToString() & " = ? "

        Session("res") = res


    End Sub



End Class