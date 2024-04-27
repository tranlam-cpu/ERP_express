using Erp_express.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Data.Entity;
namespace Erp_express.Repositories
{
    public class UserRepository : IRepository<User>
    {
        private DataContext _context;

        public UserRepository(DataContext context)
        {
            _context = context;
        }

        public IEnumerable<User> GetAll()
        {
            return _context.Users.ToList();
        }

        public bool login(string email, string password)
        {
            var user = _context.Users.Where(u => u.Email == email && u.Password == password).FirstOrDefault();
            if (user != null)
            {
                return true;
            }

            return false;
        }

        public List<Permission> getPermission(string email)
        {

            var user = _context.Users.Include(u => u.Roles.Select(r => r.Permissions))
                                                .SingleOrDefault(u => u.Email == email);



            if (user != null)
            {
                return user.Roles.SelectMany(r => r.Permissions).Distinct().ToList();
            }
            else
            {
                return new List<Permission>();

            }

            
        }

        public User Get(int id) {
            return _context.Users.Find(id);
        }

        public void Add(User entity)
        {
            _context.Users.Add(entity);
            _context.SaveChanges();
        }
        public void Update(User entity)
        {
            _context.Entry(entity).State = System.Data.Entity.EntityState.Modified;
            _context.SaveChanges();
        }

        public void Delete(User user)
        {
            _context.Users.Remove(user);
            _context.SaveChanges();
        }
    }
}