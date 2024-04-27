using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Erp_express.Models
{
    public class Role
    {
        [Key, Display(Name = "Id")]
        public int Id { get; set; }
        [Required, StringLength(40), Display(Name = "Name")]
        public string Name { get; set; }
        [StringLength(40), Display(Name = "Description")]
        public string description { get; set; }

        public List<User> Users { get; }= new List<User>();
        public List<Permission> Permissions { get; } = new List<Permission>();
    }
}