Public Class login
    Inherits System.Web.UI.Page '
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
    End Sub

    Protected Sub Button_signIn_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button_signIn.Click


        Dim username As String = Me.TextBox_username.Text.Trim()
        Dim password As String = Me.TextBox_password.Text.Trim()


        If username = "" Or password = "" Then
            Me.Label_Status.ForeColor = Drawing.Color.Red
            Me.Label_Status.Text = "Username or password can not be blank"
            Exit Sub
        End If

            If Account.Is_User_Valid(username, password) = True Then
                ' FormsAuthentication.RedirectFromLoginPage(username, Me.CheckBox_remember_me.Checked)
                FormsAuthentication.SetAuthCookie(username, Me.CheckBox_remember_me.Checked)
                Session("username") = username
                If Account.Is_User_Exists_in_UserDetails(username) Then
                    Response.Redirect("/Secured/Customer/CustomerHome.aspx", True)
                End If
                Response.Redirect("/Secured/Customer/EditProfile.aspx", True)
            Else
                Me.Label_Status.ForeColor = Drawing.Color.Red
            Me.Label_Status.Text = "Login not Successful."


            'Me.Label_Status.ForeColor = Drawing.Color.Red
            'Me.Label_Status.Text = "Wrong password !"
            

        End If


        


    End Sub
End Class