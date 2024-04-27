using Erp_express.utils;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Erp_express.Views
{
    public partial class Login : System.Web.UI.Page
    {

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            

            //foreach (Route route in RouteTable.Routes)
            //{
            //    string url = route.Url;
            //    Debug.WriteLine(url);
            //}
            
            //is authenticated
            if (Request.IsAuthenticated)
            {
                
                Response.Redirect("/dashboard");
                
               //user of login control
               WelcomeBackMessage.Text = "Welcome back, " + User.Identity.Name + "!";
                AuthenticatedMessagePanel.Visible = true;

            }
            else
            {
                AuthenticatedMessagePanel.Visible = false;
            }
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            //Response.Write("Login1_Authenticate");
            //e.Authenticated = true;
            
            if(AuthManager.Instance.Authenticate(Login1.UserName, Login1.Password))
            {
                e.Authenticated = true;
            }
           
        }

        public bool IsValidEmail(string strIn)
        {
            // Return true if strIn is in valid email format.
            return Regex.IsMatch(strIn, @"^([\w\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");
        }

        protected void onLogging(object sender, LoginCancelEventArgs e)
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
        protected void onLoginError(object sender, EventArgs e)
        {
            Login1.InstructionText = "email hoặc mật khẩu không chính xác";

        }

    }
}