using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Erp_express.Component
{
    public partial class Navigation : System.Web.UI.UserControl
    {
        public string PropertyType { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (PropertyType == "Mobile")
            {
                ASPxNavBarIcon.Visible = true;
               
            }
            else
            {
                ASPxNavBar1.Visible = true;
               
            }


        }

       
    }
}