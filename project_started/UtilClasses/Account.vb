Public Class Account

#Region "UserCheckup"

    ''' <summary>
    ''' Enter either Username or Email to check if User Exists in the UserInfo Table
    ''' </summary>
    ''' <param name="item">The username or Email as in the table</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function Is_User_Exists(ByRef item As String) As Boolean
        If DBAccess.fetchInt("select count(*) from users_info where username='" & item & "' or email='" & item & "'") = 1 Then
            Return True
        Else
            Return False
        End If
    End Function

    ''' <summary>
    ''' Enter either Username to check if User Exists in the User_Details Table
    ''' </summary>
    ''' <param name="username">The username as in the table</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function Is_User_Exists_in_UserDetails(ByRef username As String) As Boolean
        If DBAccess.fetchInt("select count(*) from user_details where username='" & username & "'") = 1 Then
            Return True
        Else
            Return False
        End If
    End Function


    Public Shared Function Is_User_Valid(ByRef item As String, ByRef password As String) As Boolean
        If DBAccess.fetchInt("select count(*) from users_info where username='" & item & "' and password='" & password & "'") Then
            Return True
        ElseIf DBAccess.fetchInt("select count(*) from users_info where email='" & item & "' and password='" & password & "'") Then
            Return True
        Else
            Return False
        End If

    End Function


    Public Shared Function GetUserEmailAddress(ByVal itm As String) As String
        Return DBAccess.fetchscaler("select email from users_info where username='" & itm & "' or email='" & itm & "'")

    End Function
    Public Shared Function GetUserSecurityQuestion(ByVal itm As String) As String


        Dim sec_q_serial As Integer = DBAccess.fetchInt("select security_question_serial from users_info where username='" & itm & "' or email='" & itm & "'")

        Return DBAccess.fetchscaler("select question from user_security_question where serial=" & sec_q_serial)

    End Function

    Public Shared Function GetUserName(ByVal itm As String) As String


        Return DBAccess.fetchscaler("select username from users_info where username='" & itm & "' or email='" & itm & "'")

      
    End Function



    'Public Shared Function Is_User_Locked(ByRef username As String) As Boolean
    '    If DBAccess.fetchInt("select count(*) from users_info where username='" & username & "' and password='" & password & "'") Then
    '        Return True
    '    ElseIf DBAccess.fetchInt("select count(*) from users_info where email='" & item & "' and password='" & password & "'") Then
    '        Return True
    '    Else
    '        Return False
    '    End If

    'End Function


#End Region


#Region "Register"

    Public Shared Function UserRegister(ByRef username As String, ByRef password As String, ByRef email As String) As Boolean


        If Is_User_Exists(username) Then
            Return False
            Exit Function
        End If




        Dim qry_register As String = "insert into users_info values('" & username & "','" & password & "','" & email & "','','','" & Date.Now.ToString() & "','" & Date.Now.ToString() & "',0,0)"
        If DBAccess.savedata(qry_register) Then
            Return True
        Else
            Return False
        End If

    End Function
#End Region




End Class
