using DevExpress.ClipboardSource.SpreadsheetML;
using DevExpress.Utils;
using DevExpress.Web;
using Erp_express.Migrations;
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
        event EventHandler<PermissionEventArgs> createPermission;

        void DisplayEntities(IEnumerable<Permission> permissions);

        void successPoup();
        IEnumerable<Permission> GetGridViewDataSource();
    }
    public partial class permission : System.Web.UI.Page, IPermissionView
    {
        public event EventHandler LoadPermissions;
        public event EventHandler<PermissionEventArgs> createPermission;
        private PermissionPresenter _presenter;

        public void DisplayEntities(IEnumerable<Permission> permissions)
        {
            
           ASPxGridView1.DataSource = permissions;
           ASPxGridView1.DataBind();
           Session["DataSource"] = permissions;
        }

        public void successPoup()
        {
       
            ASPxPopupControl1.ShowOnPageLoad = false;
         
        }
        
        public IEnumerable<Permission> GetGridViewDataSource()
        {

            return Session["DataSource"] as IEnumerable<Permission>;
           
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            _presenter = new PermissionPresenter(this, new PermissionRepository(new DataContext()));
            if (!IsPostBack)
            {
                slug.DataSource=getSlugFromRoute();
                slug.DataBind();
                LoadPermissions?.Invoke(this, EventArgs.Empty);

            }
            else
            {
                // Re-bind the data source
                LoadPermissions?.Invoke(this, EventArgs.Empty);
            }

            // Apply the search filter if there is a search text in the Session
            string searchText = Session["SearchText"] as string;
            if (!string.IsNullOrEmpty(searchText))
            {
                ASPxGridView1.SearchPanelFilter = searchText;
            }
            else
            {
                ASPxGridView1.SearchPanelFilter = string.Empty;
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
            
            string callbackName = e.Parameter;

            switch (callbackName)
            {
                case "Create":
                    Permission permission = new Permission();
                    permission.Name= permissionName.Text.ToString();
                    permission.slug = slug.Value.ToString();
                    createPermission?.Invoke(this, new PermissionEventArgs(permission));
                    //break;
                    break;
            }
        }

        //protected void slug_ItemsRequestedByFilterCondition(object source, ListEditItemsRequestedByFilterConditionEventArgs e)
        //{
        //    //ASPxComboBox comboBox = (ASPxComboBox)source;
        //    //comboBox.Items.Clear();
        //    //List<string> urlRoute = getSlugFromRoute();



        //    // Filter the items based on the filter condition
        //    slug.Items.Clear();
        //    List<string> urlRoute = getSlugFromRoute();

        //    //string filter = e.Filter;
        //    //if (filter != null && filter!="")
        //    //{

        //    //    List<string> filteredItems = urlRoute.Where(item => item.Contains(filter)).ToList();

        //    //    // Add the filtered items to the ASPxComboBox
        //    //    foreach (string item in filteredItems)
        //    //    {
        //    //        slug.Items.Add(item, item);
        //    //    }
        //    //}


        //    int startIndex = e.BeginIndex;
        //    int endIndex = Math.Min(e.EndIndex, urlRoute.Count - 1);
        //    for (int i = startIndex; i <= endIndex; i++)
        //    {

        //        slug.Items.Add(urlRoute[i], urlRoute[i]);
        //    }
        //}

        //protected void slug_ItemRequestedByValue(object source, ListEditItemRequestedByValueEventArgs e)
        //{
        //    try
        //    {
        //        Debug.WriteLine("e.Value: " + e.Value);
        //        Debug.WriteLine("e.Value type: " + e.Value?.GetType());

        //        string value = e.Value as string;
        //        Debug.WriteLine("Value: " + value);
        //        if (value != null)
        //        {
        //            slug.Items.Add(value, value);
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        Debug.WriteLine("error");
        //    }



        //}

        private List<string> getSlugFromRoute()
        {
            List<string> urlRoute = new List<string>();
            foreach (Route route in RouteTable.Routes)
            {
                if(route.Url != "")
                {
                    urlRoute.Add(route.Url);
                }
                
            }
         
            //slug.DataSource = urlRoute;
            //slug.DataBind();
            //slug.Items.RemoveAt(0);
            //slug.SelectedIndex = 0;
            
            return urlRoute;
        }

        protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string searchText = e.Parameters;
            Session["SearchText"] = searchText;

        }
    }
}