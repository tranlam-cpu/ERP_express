<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Erp_express.Views.Login" %>



<%--<script runat="server">
    bool IsValidEmail(string strIn)
    {
        // Return true if strIn is in valid email format.
        return Regex.IsMatch(strIn, @"^([\w\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
    }

    void onLogging(object sender, System.Web.UI.WebControls.LoginCancelEventArgs e)
    {
        
        if (!IsValidEmail(Login1.UserName))
        {
            Login1.InstructionText = "email hoặc mật khẩu không chính xác";
            Login1.InstructionTextStyle.ForeColor = System.Drawing.Color.RosyBrown;
            e.Cancel = true;
        }
        else
        {
            Login1.InstructionText = String.Empty;

        }
    }
    void onLoginError(object sender, EventArgs e)
    {
        Login1.InstructionText = "email hoặc mật khẩu không chính xác";

    }

    
    
</script>--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>đăng nhập</title>
    <link href="../Style/login.css" rel="stylesheet" />
    <style media="screen and (max-width: 767.98px)">

    </style>

</head>
<body>
    <div id="particles-js">
        
        <form id="form1" runat="server">
          
            <img src="../images/planet.png" alt="planet" class="planet-login" />
         
            <asp:Login ID="Login1" runat="server" Height="279px" Width="583px"
                    OnLoggingIn="onLogging"
                    OnLoginError="onLoginError"
                    OnAuthenticate="Login1_Authenticate"
                    CssClass="login-form" 
                    LoginButtonText="đăng nhập" 
                    PasswordLabelText="Mật khẩu:" 
                    RememberMeText="lưu tài khoản và mật khẩu" 
                    TitleText="&nbsp;"
                    UserNameLabelText="Email:"
                    FailureText=""> 
                <ValidatorTextStyle ForeColor="Red" />
                <LoginButtonStyle CssClass="btn-login" />
                <TitleTextStyle 
                    Font-Bold="True" 
                    Font-Size="Large"
                    ForeColor="white" 
                    HorizontalAlign="Left" 
                    CssClass="title-login">
                </TitleTextStyle>
            </asp:Login>




            <asp:Panel runat="server" ID="AuthenticatedMessagePanel">
                    <asp:Label runat="server" ID="WelcomeBackMessage"></asp:Label>
            </asp:Panel>
    
            <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        Welcome back,
                        <asp:LoginName ID="LoginName1" runat="server" />.
                    </LoggedInTemplate>
                </asp:LoginView>
                <br />


                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="/login" LoginText="" />
              
            
      
        
               
      


            <script src="../Scripts/lib/particles.min.js" type="text/javascript"></script>
            <script src="../Scripts/layout/login.js" type="text/javascript"></script>
        </form>
    </div>
</body>
</html>
