Imports System.Data
Imports System.Data.SqlClient


Public Class DBAccess

    Shared con_str As String = System.Configuration.ConfigurationManager.ConnectionStrings("Real_Estate_DBConnectionString").ToString.Trim()

    Shared conn As New SqlConnection(con_str)


    Public Shared Function savedata(ByVal qry As String) As Boolean

        Dim res As Boolean
        Dim cmd As New SqlCommand()
        cmd.CommandText = qry
        cmd.Connection = conn
        Try
            'conncheck()
            conn.Open()


            If cmd.ExecuteNonQuery() = 1 Then


                res = True
            ElseIf cmd.ExecuteNonQuery() = 0 Then

                res = False
            End If
        Catch ex As Exception

            res = False

        Finally
            conn.Close()

        End Try
        Return res


    End Function

    Public Shared Function fetchData(ByVal qry As String, ByVal tblnm As String) As DataSet
        Dim cmd As New SqlCommand(qry, conn)

        Dim ds As New DataSet()
        Try

            conn.Open()

            Dim adp As New SqlDataAdapter(cmd)
            adp.Fill(ds, tblnm)
            Return ds

        Catch ex As Exception
            ds.Clear()
            Return ds
        Finally
            conn.Close()

        End Try

    End Function

    Public Shared Function fetchscaler(ByVal qry As String) As String
        Dim cmd As New SqlCommand(qry, conn)

        Dim str As String = ""
        Try
            'conncheck()
            conn.Open()
            str = Convert.ToString(cmd.ExecuteScalar())
            Return (str)


        Catch ex As Exception
            str = Nothing
            Return str
        Finally
            conn.Close()

        End Try

    End Function
    Public Shared Function fetchInt(ByVal qry As String) As Integer
        Dim cmd As New SqlCommand(qry, conn)

        Dim str As Integer = 0
        Try
            'conncheck()
            conn.Open()
            str = Convert.ToInt32(cmd.ExecuteScalar())
            Return (str)


        Catch ex As Exception
            str = 0
            Return str
        Finally
            conn.Close()

        End Try

    End Function

    Public Shared Function updatedata(ByVal qry As String) As Boolean

        Dim res As Boolean
        Dim cmd As New SqlCommand()
        cmd.CommandText = qry
        cmd.Connection = conn
        Try
            'conncheck()
            conn.Open()


            If cmd.ExecuteNonQuery() > 0 Then


                res = True
            ElseIf cmd.ExecuteNonQuery() = 0 Then

                res = True
            End If
        Catch ex As Exception

            res = False

        Finally
            conn.Close()

        End Try
        Return res


    End Function



End Class
