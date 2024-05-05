using DevExpress.Web;
using Erp_express.Models;
using Erp_express.Presenters;
using Erp_express.Repositories;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Erp_express.Views
{
    public interface IPermissionView
    {
        event EventHandler LoadPermissions;
        void DisplayEntities(IEnumerable<Permission> permissions);
    }
    public partial class permission : System.Web.UI.Page, IPermissionView
    {
        public event EventHandler LoadPermissions;
        private PermissionPresenter _presenter;

        public void DisplayEntities(IEnumerable<Permission> permissions)
        {
            
           ASPxGridView1.DataSource = permissions;
           ASPxGridView1.DataBind();
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            _presenter = new PermissionPresenter(this, new PermissionRepository(new DataContext()));
            if (!IsPostBack)
            {
                Debug.WriteLine("load");
                LoadPermissions?.Invoke(this, EventArgs.Empty);

            }
          
        }

        

        protected void ASPxGridView1_DataBound(object sender, EventArgs e)
        {
            GridViewDataColumn id= ASPxGridView1.Columns[0] as GridViewDataColumn;
            foreach (GridViewDataColumn column in ASPxGridView1.Columns)
            {
                if(column == id)
                {
                  
                    column.Width = Unit.Percentage(10);
                }
                else
                {
                    column.Width = Unit.Percentage(90 / (ASPxGridView1.Columns.Count - 1));
                }
            }
           
        }



        
        protected void NewsCallback_Callback(object sender, CallbackEventArgsBase e)
        {
            Debug.WriteLine("bind");
            string callbackName = e.Parameter;

            switch (callbackName)
            {
                case "renderFormCreate":

                    List<string> urlRoute = new List<string>();
                    foreach (Route route in RouteTable.Routes)
                    {
                        urlRoute.Add(route.Url);   
                    }
                    slug.DataSource = urlRoute;
                    slug.DataBind();
                    slug.Items.RemoveAt(0);
                    slug.SelectedIndex = 0;
                    break;
            }
        }
    }
}