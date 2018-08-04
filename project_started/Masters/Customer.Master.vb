Public Class Customer
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormsAuthentication.SetAuthCookie("abhisek12", False)
    End Sub

End Class