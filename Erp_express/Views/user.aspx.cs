using Erp_express.Models;
using Erp_express.Presenters;
using Erp_express.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Erp_express.Views
{
    public interface IUserView
    {
        event EventHandler LoadUsers;
        void DisplayEntities(IEnumerable<User> users);
    }

    public partial class user : System.Web.UI.Page, IUserView
    {
        public event EventHandler LoadUsers;
        public void DisplayEntities(IEnumerable<User> users)
        {
            GridView1.DataSource = users;
            GridView1.DataBind();
        }

        private UserPresenter _presenter;

        protected void Page_Load(object sender, EventArgs e)
        {
            _presenter = new UserPresenter(this,new UserRepository(new DataContext()));
            if(!IsPostBack)
            {
                LoadUsers?.Invoke(this, EventArgs.Empty);
            }
        }
    }
}