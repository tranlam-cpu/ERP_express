using Erp_express.Models;
using Erp_express.Repositories;
using Erp_express.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp_express.Presenters
{
    public class UserPresenter
    {
        private IUserView _view;
        private IRepository<User> _repository;

        public UserPresenter(IUserView view, IRepository<User> repository)
        {
            _view = view;
            _repository = repository;
            _view.LoadUsers += LoadUsers;
        }

        public void LoadUsers(object sender, EventArgs e)
        {
            var users = _repository.GetAll();
            _view.DisplayEntities(users);
        }
    }
}