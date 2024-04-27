
using Erp_express.Models;
using Erp_express.Repositories;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Erp_express.utils
{
    public class AuthManager
    {
        private static AuthManager _instance;
        private static readonly object _lock = new object();
        private UserRepository _repository;
    
        private AuthManager() {
            _repository = new UserRepository(new DataContext());
        }

        public static AuthManager Instance
        {
            get
            {
                lock (_lock)
                {
                    if (_instance == null)
                    {
                        _instance = new AuthManager();
                    }
                    return _instance;
                }
            }
        }

       
        public bool Authenticate(string username, string password)
        {
            
            return _repository.login(username, password);
           
            
        }


        public bool HasPermission(string username, string permission)
        {
            //permission is a url
            List<Permission> permissionList = new List<Permission>();
            permissionList = _repository.getPermission(username);
            foreach (Permission p in permissionList)
            {

                if (p.slug.Equals(permission))
                {
                    return true;
                }
                //Debug.WriteLine(p.slug);
            }
            return false;
        }
    }
}