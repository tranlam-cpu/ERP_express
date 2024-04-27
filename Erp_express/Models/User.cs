using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Erp_express.Models
{
    public class User
    {
        [Key, Display(Name = "Id")]
        public int Id { get; set; }
        [Required, StringLength(40), Display(Name = "Name")]
        public string Name { get; set; }
        [Required, StringLength(40), Display(Name = "Email")]
        public string Email { get; set; }
        [Required, StringLength(40), Display(Name = "Password")]
        public string Password { get; set; }

        public List<Role> Roles { get; } = new List<Role>();
    }
}