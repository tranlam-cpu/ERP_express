using Erp_express.Models;
using Erp_express.Repositories;
using Erp_express.Views;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;

namespace Erp_express.Presenters
{

    public class PermissionEventArgs : EventArgs
    {
        public Permission Permission { get; set; }

        public PermissionEventArgs(Permission permission)
        {
            Permission = permission;
        }
    }

    public class PermissionPresenter
    {
        private IPermissionView _view;
        private IRepository<Permission> _repository;

        public PermissionPresenter(IPermissionView view, IRepository<Permission> repository)
        {
            _view = view;
            _repository = repository;
            _view.LoadPermissions += LoadPermissions;
            _view.createPermission += createPermissions;
        }

        void LoadPermissions(object sender, EventArgs e)
        {
            var permissions = _repository.GetAll();
            _view.DisplayEntities(permissions);
        }

        void createPermissions(object sender, PermissionEventArgs e)
        {
            try
            {
                Permission newPermission = _repository.Add(e.Permission);
                var permissions = _view.GetGridViewDataSource().ToList();
                permissions.Add(newPermission);
                _view.DisplayEntities(permissions);
                _view.successPoup();
            }catch(Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
            

        }
    }
}