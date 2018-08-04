<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Masters/View.Master" CodeBehind="ForgotPassword.aspx.vb" Inherits="project_started.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <br />
    </p>
   <table width="100%"><tr><td>
  <table align="center"><tr><td>
  
  <fieldset><legend>Password Recovery</legend>
  
      <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

          <asp:View ID="View_GetKey" runat="server">


            <table width="100%">
            <tr><td colspan="2">
            
            
                <asp:Label ID="Label_status_1" runat="server" Text=""></asp:Label>
                
                </td></tr>
  <tr><td>Enter Username or Email</td><td>
      <asp:TextBox ID="TextBox_usernameEmail" runat="server" Width="250px"></asp:TextBox>
      </td></tr>
  <tr><td></td><td align="right">
  
  
  
      <asp:Button ID="Button_key_submit" runat="server" Text="Next" /></td></tr>
 
  
  
  </table>

          </asp:View>

          <asp:View ID="View_RecoveryOption" runat="server">

<script type="text/javascript">

    function ShowEmail() {

        document.getElementById("email").style.visibility = "visible";
        document.getElementById("question").style.visibility = "hidden";

    }

    function ShowQuestion() {

        document.getElementById("email").style.visibility = "hidden";
        document.getElementById("question").style.visibility = "visible";

    }

</script>



              <asp:RadioButton ID="RadioButton_email" runat="server" 
                  Text="Recover Password by Email" onClick="ShowEmail()" GroupName="option" />

              <div id="email" style="visibility:hidden; width:100%;">
              
                  <asp:Label ID="Label_emailHint" runat="server" Text=""></asp:Label>
              
              
              </div>

              <br />

              <asp:RadioButton ID="RadioButton_question" runat="server" 
                  Text="Recover Password by answering Security Question" 
                  GroupName="option" onClick="ShowQuestion()" />

  <div id="question" style="visibility:hidden; width:100%;">
              
                  <asp:Label ID="Label_question" runat="server" Text=""></asp:Label>
              <br />
      <asp:TextBox ID="TextBox_answer" Width="250px" runat="server"></asp:TextBox>


              
              </div>


              <br />
              <div style="float:right;">
              <asp:Button ID="Button_recoveryOption_submit" runat="server" Text="Next" />
              </div>
          </asp:View>



          <asp:View ID="View_ChangePassword" runat="server">
          </asp:View>



            <asp:View ID="View_emailSent" runat="server">
          </asp:View>

      </asp:MultiView>



  
  
  
  </fieldset>
  
  </td></tr></table>
   
   </td></tr></table>
    <p>
    </p>
</asp:Content>
