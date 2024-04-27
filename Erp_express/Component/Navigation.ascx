<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navigation.ascx.cs" Inherits="Erp_express.Component.Navigation" %>
<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<link href="../Style/layout/navigation.css" rel="stylesheet" type="text/css"/>



<dx:ASPxNavBar ID="ASPxNavBar1" ClientInstanceName="ASPxNavBar1" runat="server" AllowSelectItem="true" EnableAnimation="true" Theme="Office365" ClientSideEvents-ItemClick="function(s,e){e.processOnServer = false; onItemClick(e.item.name) }" CssClass="navigation" style="width: auto !important" Visible="False">
    <Groups>
        <dx:NavBarGroup Text="Trang chủ">
            <Items>
                <dx:NavBarItem Text="usAjax"  Name="/Views/user.aspx"/>
                <dx:NavBarItem Text="DashboardAjax" Name="/dashboard" Selected="True" />
            </Items>
        </dx:NavBarGroup>
        
        <dx:NavBarGroup Text="cài đặt">
            <Items>
                <dx:NavBarItem Text="tài khoản" NavigateUrl="~/SalesReport.aspx" />
            </Items>
        </dx:NavBarGroup>
    </Groups>
</dx:ASPxNavBar>

<dx:ASPxNavBar ID="ASPxNavBarIcon" ClientInstanceName="ASPxNavBarIcon" runat="server" AllowSelectItem="True" EnableAnimation="True" Theme="Office365" ClientSideEvents-ItemClick="function(s,e){e.processOnServer = false; onItemClick(e.item.name) }" CssClass="navigationIcon" style="width: auto !important" Visible="False">
<ClientSideEvents ItemClick="function(s,e){e.processOnServer = false; onItemClick(e.item.name) }"></ClientSideEvents>
    <Groups>
        <dx:NavBarGroup Text="TC">
            <ItemStyle HorizontalAlign="Center" />
            <Items>
               <dx:NavBarItem Text="" Name="/Views/user.aspx" >
                    <Image IconID="businessobjects_bo_vendor_svg_16x16"></Image>
                </dx:NavBarItem>
                <dx:NavBarItem Text="" Name="/dashboard" Selected="True" >
                    <Image IconID="dashboards_choroplethmap_svg_16x16"></Image>
                </dx:NavBarItem>
            </Items>
        </dx:NavBarGroup>
        
        <dx:NavBarGroup Text="CD">
            <ItemStyle HorizontalAlign="Center" />
            <Items>
                <dx:NavBarItem Text="" Name="~/SalesReport.aspx"  > 
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

            $.ajax({
                type: "GET",
                url: name,
                success: function (data) {
                    /*find content for DOM*/
                    var content = $(data).find('#main-content').html();

                    $('.content').html(content);

                    /*add new entry to the browser history*/
                    history.pushState(null, null, name);
                }
            });
        }
    }
</script>