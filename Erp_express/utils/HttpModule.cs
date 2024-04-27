using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Erp_express.utils
{
    public class HttpModule : IHttpModule
    {
        public void Dispose()
        {
            
        }

        public void Init(HttpApplication context)
        {
            context.BeginRequest += new EventHandler(context_BeginRequest);
        }

        private void context_BeginRequest(object sender, EventArgs e)
        {
            var app = sender as HttpApplication;
            if (app != null)
            {
                string url = app.Context.Request.Url.AbsolutePath;
               
                if (url.EndsWith("aa", StringComparison.OrdinalIgnoreCase))
                {
                    HttpCookie refererCookie = app.Context.Request.Cookies["LastUrl"];
                    if (refererCookie != null)
                    {
                        string referer = refererCookie.Value;
                        app.Context.Response.Redirect(referer);
                    }
                    else
                    {
                        app.Context.Response.Redirect("/");
                    }
                }
                else
                {
                    app.Context.Response.Cookies["LastUrl"].Value = url;
                }
            }
            //Debug.WriteLine("Original URL: " + HttpContext.Current.Request.Url);
        }
    }
}