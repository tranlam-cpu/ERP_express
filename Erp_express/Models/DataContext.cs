using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
namespace Erp_express.Models
{
    public class DataContext: DbContext
    {
        public DataContext(): base("name=erpData")
        {
        }   

        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Permission> Permissions { get; set; }

    }
}