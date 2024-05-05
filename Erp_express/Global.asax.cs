using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Erp_express
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {

            // Code that runs on application startup
            //RouteConfig.RegisterRoutes(RouteTable.Routes);
            RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Home", "", "~/Default.aspx");
            routes.MapPageRoute("user", "user", "~/Views/user.aspx");
            routes.MapPageRoute("login", "login", "~/Views/Login.aspx");
            routes.MapPageRoute("dashboard", "dashboard", "~/Views/dashboard.aspx");
            routes.MapPageRoute("dashboard/permission", "dashboard/permission", "~/Views/permission.aspx");
        }   
    }
}