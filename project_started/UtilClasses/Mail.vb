Imports System.Net.Mail


Public Class Mail

    Public Shared Function SendEmail(ByVal toMailAddress As String, ByVal subject As String, ByVal mailBody As String) As Boolean

        Dim smtp_client As New SmtpClient()
        Dim message As New MailMessage()

        Try
            ' Dim from_email_address As New MailAddress("realestatemid@gmail.com", "Real Estate")
            Dim from_email_address As New MailAddress("info@HackerForum.com", "Real Estate")
            message.From = from_email_address
            message.[To].Add(toMailAddress.Trim())
            message.Subject = subject.Trim()
            message.IsBodyHtml = True
            message.Body = mailBody
            smtp_client.Send(message)
            Return True
        Catch ex As Exception
            Return False
        End Try

    End Function



End Class
