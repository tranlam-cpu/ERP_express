namespace Erp_express.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class update : DbMigration
    {
        public override void Up()
        {
            RenameTable(name: "dbo.RoleUsers", newName: "UserRoles");
            RenameTable(name: "dbo.PermissionRoles", newName: "RolePermissions");
            DropPrimaryKey("dbo.UserRoles");
            DropPrimaryKey("dbo.RolePermissions");
            AddPrimaryKey("dbo.UserRoles", new[] { "User_Id", "Role_Id" });
            AddPrimaryKey("dbo.RolePermissions", new[] { "Role_Id", "Permission_Id" });
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.RolePermissions");
            DropPrimaryKey("dbo.UserRoles");
            AddPrimaryKey("dbo.RolePermissions", new[] { "Permission_Id", "Role_Id" });
            AddPrimaryKey("dbo.UserRoles", new[] { "Role_Id", "User_Id" });
            RenameTable(name: "dbo.RolePermissions", newName: "PermissionRoles");
            RenameTable(name: "dbo.UserRoles", newName: "RoleUsers");
        }
    }
}
