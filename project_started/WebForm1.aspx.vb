Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        If Mail.SendEmail(Me.TextBox1.Text.Trim(), Me.TextBox2.Text.Trim(), Me.TextBox3.Text.Trim()) Then
            Response.Write("Mail Sent")
        Else
            Response.Write("Not sent")
        End If
    End Sub
End Class