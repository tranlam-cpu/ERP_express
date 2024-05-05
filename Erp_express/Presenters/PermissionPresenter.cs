using Erp_express.Models;
using Erp_express.Repositories;
using Erp_express.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp_express.Presenters
{
    public class PermissionPresenter
    {
        private IPermissionView _view;
        private IRepository<Permission> _repository;

        public PermissionPresenter(IPermissionView view, IRepository<Permission> repository)
        {
            _view = view;
            _repository = repository;
            _view.LoadPermissions += LoadPermissions;
        }

        void LoadPermissions(object sender, EventArgs e)
        {
            var permissions = _repository.GetAll();
            _view.DisplayEntities(permissions);
        }
    }
}