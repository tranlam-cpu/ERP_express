using Erp_express.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Erp_express.Repositories
{
    public class PermissionRepository : IRepository<Permission>
    {
        private DataContext _context;

        public PermissionRepository(DataContext context)
        {
            _context = context;
        }

        public IEnumerable<Permission> GetAll()
        {
            return _context.Permissions.ToList();
        }

        public Permission Get(int id)
        {
            return _context.Permissions.Find(id);
        }

        public Permission Add(Permission entity)
        {

            _context.Permissions.Add(entity);
            _context.SaveChanges();
            return entity;
        }

        public void Update(Permission entity)
        {
            _context.Entry(entity).State = System.Data.Entity.EntityState.Modified;
        }

        public void Delete(Permission entity)
        {
            _context.Permissions.Remove(entity);
        }
    }
    
}