<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Erp_express._Default" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="/Style/site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/layout/default.js" type="text/javascript"></script>
    <script type="text/javascript"> 

        var curTailElement = null;
        var loadingDivText = '<div style="vertical-align: middle; text-align: center;">Loading&hellip;</div>';

        function OnTailClick(newsID, htmlElement) {
         
            if (!NewsCallback.InCallback() && !IsCurrentNews(htmlElement)) {
                curTailElement = htmlElement;
                ShowPopup(htmlElement, loadingDivText);
                NewsCallback.PerformCallback(newsID);
            }
        }
        function OnCallbackComplete(result) {
            if (GetPopupControl().IsVisible())
                ShowPopup(curTailElement, result);

  
           
        }
        function OnNewsControlBeginCallback() {
            GetPopupControl().Hide();
        }
        function IsCurrentNews(htmlElement) {
            return (curTailElement == htmlElement) && GetPopupControl().IsVisible();
        }
        function GetPopupControl() {
            return ASPxPopupClientControl;
        }   
        function ShowPopup(element, contentText) {
            GetPopupControl().Hide();
            GetPopupControl().SetContentHTML(contentText);
            GetPopupControl().ShowAtElement(element);


        }
    </script>
    <style media="screen and (max-width: 767.98px)">
       
    .mb-flex {
        flex-direction:column !important;
    }
    .img-blod{
        left: -100px;
    }
    
    .cimg-3, .cimg-4{
        display: none;
    }
    .cimg-1{
        top : unset;
        bottom: 0;
        left: -4em;
    }
    .cimg-2{
         top : unset;
         bottom: 0;
         right: -4em;
    }
    .community{
        width: 100%;
    }
    .community-title{
        width: 100%;
        top:-6.5em;
    }
    .community-content{
        margin-top: 0 !important;
        padding-top: 0 !important;
    }
    .customNewControl{
        width: 300px !important;
    }
    </style>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <div class="d-flex mb-flex flex-row justify-content-between align-items-center gap-5">
                <div class="w-50 text-left">
                    <h2>ERP - Xu hướng quản lý cho Doanh Nghiệp</h2>
                    <h3 class="text-muted">Hệ thống quản lý tài sản số 1 Việt Nam</h3>
                    <p class="text-wrap">
                        Số hóa mọi quy trình nghiệp vụ: Mua sắm, quản lý sử dụng, đánh giá, kiểm kê, tính hao mòn tài sản giúp tiết kiệm 70% công sức thực hiện.
                    </p>
                </div>
                <div class="w-50 d-flex justify-content-center align-items-center">
             
                        <div class="blod position-relative">
                            <img class="img-blod" src="images/image1.PNG" alt="image1" />
                            <div class="img-sub1-blod">
                                &nbsp;
                            </div>
                            <div class="img-sub2-blod">
                                &nbsp;
                            </div>
                            <div class="img-sub3-blod">
                                &nbsp;
                            </div>
                            <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
                              <path fill="#F28870" transform="translate(100 100)" >
                                  <animate 
                                      attributeName="d"
                                      dur="10000ms"
                                      repeatCount="indefinite"
                                      values="M39.6,-50.6C50.7,-37.9,58.7,-24.8,63.9,-9.2C69.1,6.4,71.5,24.6,64.1,36.6C56.7,48.7,39.4,54.7,21.9,61.8C4.3,69,-13.4,77.3,-30.9,75.2C-48.5,73,-65.8,60.5,-75.8,43.6C-85.8,26.6,-88.5,5.3,-82.8,-12.4C-77.1,-30.2,-63,-44.2,-47.8,-56.3C-32.6,-68.3,-16.3,-78.3,-1,-77.1C14.2,-75.9,28.5,-63.4,39.6,-50.6Z;
                                      
                                      M50.4,-55.4C66.1,-46.8,80.3,-31.7,84.3,-14.1C88.3,3.5,82.1,23.7,70.7,38.3C59.3,53,42.6,62.2,26.3,64.9C10.1,67.5,-5.8,63.6,-21.8,58.4C-37.7,53.2,-53.6,46.7,-64.1,34.2C-74.7,21.8,-79.8,3.4,-76.6,-13.3C-73.4,-30,-61.8,-45,-47.7,-53.9C-33.5,-62.8,-16.8,-65.6,0.3,-65.9C17.3,-66.2,34.6,-64.1,50.4,-55.4Z;

                                      M57.7,-66.8C74,-55.2,85.9,-36.2,85,-18.3C84.2,-0.5,70.7,16.3,58.7,30.8C46.6,45.3,36.1,57.7,22.9,62.2C9.7,66.7,-6.1,63.3,-21.7,58.3C-37.4,53.2,-52.9,46.4,-61.1,34.3C-69.2,22.2,-69.8,4.9,-69,-14.3C-68.2,-33.6,-66,-54.8,-54.2,-67.2C-42.5,-79.6,-21.2,-83.3,-0.3,-83C20.7,-82.7,41.5,-78.4,57.7,-66.8Z;

                                      M53.3,-61.7C65.6,-53.1,69.8,-33.1,74,-12.6C78.2,7.9,82.3,28.9,74.2,42.6C66,56.3,45.6,62.7,26.4,67.6C7.1,72.6,-10.9,76,-27.7,71.8C-44.6,67.6,-60.2,55.7,-70.8,39.7C-81.5,23.7,-87.3,3.7,-82,-12.4C-76.7,-28.5,-60.4,-40.5,-44.9,-48.6C-29.4,-56.6,-14.7,-60.6,2.9,-64C20.5,-67.4,40.9,-70.3,53.3,-61.7Z;

                                      M41.1,-48.7C54.8,-37.4,68.7,-26,71.8,-12.1C74.9,1.8,67.3,18.1,58.2,33.4C49.1,48.6,38.5,62.7,24.4,68.6C10.2,74.4,-7.5,72,-24.5,66.3C-41.5,60.6,-57.7,51.6,-68.8,37.3C-80,23,-86,3.4,-81.8,-13.3C-77.5,-30,-62.9,-43.8,-47.6,-54.9C-32.3,-66,-16.1,-74.3,-1.2,-72.8C13.7,-71.3,27.3,-60.1,41.1,-48.7Z;

                                      M39.6,-50.6C50.7,-37.9,58.7,-24.8,63.9,-9.2C69.1,6.4,71.5,24.6,64.1,36.6C56.7,48.7,39.4,54.7,21.9,61.8C4.3,69,-13.4,77.3,-30.9,75.2C-48.5,73,-65.8,60.5,-75.8,43.6C-85.8,26.6,-88.5,5.3,-82.8,-12.4C-77.1,-30.2,-63,-44.2,-47.8,-56.3C-32.6,-68.3,-16.3,-78.3,-1,-77.1C14.2,-75.9,28.5,-63.4,39.6,-50.6Z;
                                  "></animate>
                              </path>
                            </svg>
                        </div>
                 
                </div>
            </div>
        </section>

        <section class="my-5 row" aria-labelledby="aspnetTitle2">
           <div class="marquee d-flex">
               <div class="marquee-content">
                   <div class="d-flex">
                        <div>rethink</div>
                        <div>reuse</div>
                        <div>refill</div>
                    </div>
                    <div class="d-flex">
                         <div>rethink</div>
                         <div>reuse</div>
                         <div>refill</div>
                    </div>
                    <div class="d-flex">
                          <div>rethink</div>
                          <div>reuse</div>
                          <div>refill</div>
                     </div>
                      <div class="d-flex">
                          <div>rethink</div>
                          <div>reuse</div>
                          <div>refill</div>
                     </div>
                     <div class="d-flex">
                          <div>rethink</div>
                          <div>reuse</div>
                          <div>refill</div>
                     </div>
               </div>     
           </div>
        </section>
        
        <section class="bg-aspnetTitle3 mt-5" aria-labelledby="aspnetTitle3">
            <div class="community">
                <div class="community-title">
                    <img src="images/LogoIVS.jpeg" alt="IVS" />
                </div>
                <p class="community-content text-center pt-5 mt-4 fw-semibold fs-5">
                    Tại Công ty IVS có một đội ngũ chuyên viên phân tích nghiệp vụ. Với kinh nghiệm tư vấn cho hơn 100 công ty trong nhiều lĩnh vực khác nhau. Các chuyên viên của IVS sẽ lắng nghe mọi khó khăn của khách hàng để đưa ra giải pháp tốt nhất với phương châm: “Hiện thực hóa mọi ý tưởng quản lý của khách hàng”.
                </p>
                <img class="cimg-1" src="images/community-img_01.png" alt="cmt-1" />
                <img class="cimg-2" src="images/community-img_02.png" alt="cmt-1" />
                <img class="cimg-3" src="images/community-img_03.png" alt="cmt-1" />
                <img class="cimg-4" src="images/community-img_04.png" alt="cmt-1" />
            </div>
        </section>
        <dx:ASPxPopupControl 
            ID="ASPxPopupControl1"
            ClientInstanceName="ASPxPopupClientControl"
            HeaderText="chi tiết"
            PopupAction="None"
            AllowDragging="True"
            PopupHorizontalAlign="OutsideRight"
            PopupVerticalAlign="TopSides" 
            PopupHorizontalOffset="50"
            PopupVerticalOffset="-50"
            EnableViewState="False"
            Width="250px"
            PopupAnimationType="None"
            runat="server"
            CssClass="CustomPopup" 
            AllowResize="True">
            <HeaderStyle CssClass="headerPopup" />
        </dx:ASPxPopupControl>
        <section class="bg-aspnetTitle4" aria-labelledby="aspnetTitle4">

            <h3 class="text-center">Chúng tôi lắng nghe <p style="color:#f74c25; font-weight: 600">mang đến giải pháp tốt nhất cho bạn</p></h3>
            
            <dx:ASPxNewsControl 
                ID="ASPxNewsControl1" 
                runat="server" 
                Width="600px"
                NameField="Name"
                DataSourceID="XmlDataSource1"
                NavigateUrlFormatString="javascript:void('{0}');"  
                cssClass="customNewControl"
            >
                <ItemSettings 
                    ShowImageAsLink="True" 
                    MaxLength="50"
                    TailText="xem thêm" 
                />
                
                <PagerSettings 
                    CurrentPageNumberFormat="{0}" 
                    NumericButtonCount="5"
                Summary-Text="Trang">
                    <NextPageButton Visible="True" Text="sau" />
                    <PrevPageButton Visible="True" Text="trước" />
                </PagerSettings>   
                <ClientSideEvents 
                    TailClick="function(s, e) { OnTailClick(e.name, e.htmlElement); }"
                    BeginCallback="function(s, e) { OnNewsControlBeginCallback(); }" 
                />
            </dx:ASPxNewsControl>
            <dx:ASPxCallback 
                ID="ASPxCallback1"
                ClientInstanceName="NewsCallback" 
                OnCallback="ASPxCallback1_Callback"
                runat="server"
            >
                <ClientSideEvents CallbackComplete="function(s, e) { OnCallbackComplete(e.result); }" />
            </dx:ASPxCallback>
            <asp:XmlDataSource 
                ID="XmlDataSource1" 
                runat="server" 
                DataFile="~/App_Data/NewControl/dataRSS.xml"
                TransformFile="~/dataRSS.xslt"
                XPath="//item"
            >
            </asp:XmlDataSource>
        </section>
      
    </main>

</asp:Content>
