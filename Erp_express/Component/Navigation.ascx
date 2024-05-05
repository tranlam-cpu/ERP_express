<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="Erp_express.Component.Navigation" %>
<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<link href="../Style/layout/navigation.css" rel="stylesheet" type="text/css"/>



<dx:ASPxNavBar 
    ID="ASPxNavBar1" 
    ClientInstanceName="ASPxNavBar1" 
    runat="server" 
    AllowSelectItem="true" 
    EnableAnimation="true" 
    Theme="Office365" 
    ClientSideEvents-ItemClick="function(s,e){e.processOnServer = false; onItemClick(e.item.name) }" 
    ClientSideEvents-HeaderClick="function(s,e){e.processOnServer = false; onHeadClick(s,e) }" 
    CssClass="navigation" 
    style="width: auto !important" 
    Visible="False">
    <Groups>
        <dx:NavBarGroup Name="TC" Text="Trang chủ">
            <Items>
                <dx:NavBarItem Text="usAjax" NavigateUrl="/Views/user.aspx"  Name="/Views/user.aspx"/>
                <dx:NavBarItem Text="DashboardAjax" NavigateUrl="/dashboard" Name="/dashboard" Selected="True" />
            </Items>
        </dx:NavBarGroup>
        
        <dx:NavBarGroup Name="CD" Text="cài đặt">
            <Items>
                <dx:NavBarItem Text="quyền" NavigateUrl="/dashboard/permission" Name="/dashboard/permission" />
            </Items>
        </dx:NavBarGroup>
    </Groups>
</dx:ASPxNavBar>

<dx:ASPxNavBar 
    ID="ASPxNavBarIcon" 
    ClientInstanceName="ASPxNavBarIcon" 
    runat="server" 
    AllowSelectItem="True" 
    EnableAnimation="True" 
    Theme="Office365" 
    ClientSideEvents-ItemClick="function(s,e){e.processOnServer = false; onItemClick(e.item.name) }" 
    ClientSideEvents-HeaderClick="function(s,e){e.processOnServer = false; onHeadClickIcon(s,e) }" 
    CssClass="navigationIcon" 
    style="width: auto !important" 
    Visible="False">

    <Groups>
        <dx:NavBarGroup Name="TC" Text="TC">
            <ItemStyle HorizontalAlign="Center" />
            <Items>
               <dx:NavBarItem Text="" NavigateUrl="/Views/user.aspx" Name="/Views/user.aspx" >
                    <Image IconID="businessobjects_bo_vendor_svg_16x16"></Image>
                </dx:NavBarItem>
                <dx:NavBarItem Text="" NavigateUrl="/dashboard" Name="/dashboard" Selected="True" >
                    <Image IconID="dashboards_choroplethmap_svg_16x16"></Image>
                </dx:NavBarItem>
            </Items>
        </dx:NavBarGroup>
        
        <dx:NavBarGroup Name="CD" Text="CD">
            <ItemStyle HorizontalAlign="Center" />
            <Items>
                <dx:NavBarItem Text="" NavigateUrl="/dashboard/permission"  Name="/dashboard/permission"  > 
                    <Image IconID="businessobjects_bo_lead_svg_16x16">
                    </Image>
                </dx:NavBarItem>
            </Items>
        </dx:NavBarGroup>
    </Groups>
</dx:ASPxNavBar>
<script type="text/javascript">
    function onItemClick(name) {
        
        if (name) {
            ASPxNavBar1.SetSelectedItem(ASPxNavBar1.GetItemByName(name));
            ASPxNavBarIcon.SetSelectedItem(ASPxNavBarIcon.GetItemByName(name));

            //$.ajax({
            //    type: "GET",
            //    url: name,
            //    success: function (data) {
                    
            //        /*find content css express for DOM*/
            //        var linkHref = $(data).find('link[href*="/DXR"]').attr('href');
            //        var linkElement = document.querySelector('link[href*="/DXR"]');
            //        if (linkElement) {
            //            linkElement.href = linkHref
            //        } else {
            //            var newLink = document.createElement('link');
            //            newLink.rel = 'stylesheet';
            //            newLink.href = linkHref 
            //            $('head').append(newLink);
            //        }

                    
            //        /*find content for DOM*/
            //        var content = $(data).find('#main-content').html();
            //        $('.content').html(content);

                    
                   

                 
                    


                    
            //    },
            //    complete: function () {
            //        /*add new entry to the browser history*/
            //         history.pushState(null, null, name);

            //        /* Manually call the EndCallback event of the DevExpress controls */     
            //        //ASPxClientControl.GetControlCollection().ForEachControl(function (control) {
            //        //    if (control) {
                           
            //        //        if (typeof control.PerformCallback === 'function' && control.PerformCallback) {
                                
            //        //            // For DevExpress controls that support callbacks
            //        //            control.PerformCallback();
                                
            //        //            if (typeof control.HideLoadingPanel === 'function') {
            //        //                control.HideLoadingPanel();
                                    
            //        //            }
            //        //        }
                           
            //        //    }
                    
            //        //});
            //    }
            //});
        }
    }

    function onHeadClick(s,e) {
        if (e.group && !e.processOnServer) {
            var isExpanded = e.group.GetExpanded();
            var groupIcon = ASPxNavBarIcon.GetGroupByName(e.group.name);
            groupIcon.SetExpanded(!isExpanded);
            
        }     

    }

    function onHeadClickIcon(s, e) {
        if (e.group && !e.processOnServer) {
            var isExpanded = e.group.GetExpanded();
            var group = ASPxNavBar1.GetGroupByName(e.group.name);
 
            group.SetExpanded(!isExpanded);

  
        }    
    }

    $(document).ready(function () {
        var currentPath = window.location.pathname;
        var item = ASPxNavBar1.GetItemByName(currentPath);
        if (item) {
            ASPxNavBar1.SetSelectedItem(item);
        }
        var itemIcon = ASPxNavBarIcon.GetItemByName(currentPath);
        if (itemIcon) {
            ASPxNavBarIcon.SetSelectedItem(itemIcon);
        }
    });
</script>