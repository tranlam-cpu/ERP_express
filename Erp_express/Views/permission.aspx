<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Dashboard.Master" AutoEventWireup="true" CodeBehind="permission.aspx.cs" Inherits="Erp_express.Views.permission" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var loadingDivText = '<div style="vertical-align: middle; text-align: center;">Loading&hellip;</div>';
       
         

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main-content">
        <dx:ASPxCallbackPanel 
            runat="server" 
            ID="NewsCallback" 
            ClientInstanceName="NewsCallback"
            OnCallback="NewsCallback_Callback"
   
        >
            <PanelCollection>
                <dx:PanelContent runat="server" ID="ASPxPanel2">
                    <div>
                        <asp:SiteMapPath ID="SiteMapPath1" runat="server" CssClass="breadcrumb" PathSeparator="&gt;" />
                    </div>
                    <div class="p-3 mb-3 bg-white w-100 shadow-sm d-flex justify-content-center align-items-center gap-3">
                        <div>
                            
                        </div>
                        <div class="flex-grow-1 w-100">
                            <dx:ASPxTextBox ID="searchBox" runat="server" ClientInstanceName="searchBox" NullText="Enter search text here..." Width="100%" CssClass="inputSearch">
                                <ClientSideEvents 
                                    KeyPress="function(s, e) { 
                                        
                                           ASPxGridView1.PerformCallback(s.GetText());
                                        
                                    }" 
                                 />
                            </dx:ASPxTextBox>
                        </div>
                    </div>
                    <div class="w-100">
                        <dx:ASPxGridView 
                            ID="ASPxGridView1" 
                            ClientInstanceName="ASPxGridView1"
                            runat="server" 
                            Width="100%" 
                            CssClass="gridviewLayout" 
                            AutoGenerateColumns="True"
                            OnDataBound="ASPxGridView1_DataBound"
                            Font-Size="Medium"
                            AutoPostback="false"
                            OnCustomCallback="ASPxGridView1_CustomCallback"
                       >
                            <ClientSideEvents 
                                EndCallback="function(s, e) {
                                    $('#btnThem').click(function () {               
                                        ASPxPopupControl1.SetHeaderText('Thêm mới');
                                        ASPxPopupControl1.Show();
                                    });
                                }" 

                            />
                            <Settings HorizontalScrollBarMode="Auto" />
                            <Styles>
                                <Header Border-BorderWidth="0px" Paddings-Padding="5px" BackColor="#ffd7c4" Font-Bold="True" Border-BorderStyle="None" >
                                    <Paddings Padding="5px"></Paddings>

                                    <Border BorderStyle="None" BorderWidth="0px"></Border>
                                </Header>

                                <Cell Paddings-Padding="10px" BorderTop-BorderStyle="None" BorderRight-BorderStyle="None" BorderLeft-BorderStyle="None" >
                                    <Paddings Padding="10px"></Paddings>

                                    <BorderLeft BorderStyle="None"></BorderLeft>

                                    <BorderTop BorderStyle="None"></BorderTop>

                                    <BorderRight BorderStyle="None"></BorderRight>
                                </Cell>
                            </Styles>

                            <SettingsPopup>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>
                            <Toolbars>
                                <dx:GridViewToolbar>
                                    <Items>
                                        <dx:GridViewToolbarItem>
                                            <Template>
                                               <div class="d-flex flex-wrap justify-content-between align-items-center">
                                                <div class="task-gap d-flex flex-wrap justify-content-start">
                                                    <div id="btnThem" class="fromLeft me-5 text-muted fw-semibold">
                                                        thêm
                                            
                                                    </div>
                                                    <div class="fromLeft me-5 text-muted fw-semibold">
                                                       sửa
                                                    </div>
                                                    <div class="fromLeft me-5 text-muted fw-semibold">
                                                       xoá
                                                    </div>
                                        
                                                </div>
                                                <div class="task-gap d-flex justify-content-end">
                                                    <div class="text-muted fw-semibold">
                                                        Export
                                                    </div>
                                                    <div class="ms-5 text-muted fw-semibold">
                                                        Import
                                                    </div>
                                                </div>
                                               </div>
                                            </Template>
                                        </dx:GridViewToolbarItem>
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                            <SettingsSearchPanel Visible="false"  />
                            <Border BorderWidth="0px" />
                            <SettingsPager Position="Bottom" Mode="ShowPager" PageSize="10" Visible="true">
                                <PageSizeItemSettings  Caption="Nội dung" Visible="true" Items="10, 20, 50" />
                            </SettingsPager>
                        </dx:ASPxGridView>
                    </div>

                    <dx:ASPxPopupControl 
                        ID="ASPxPopupControl1" 
                        ClientInstanceName="ASPxPopupControl1" 
                        runat="server"
                        PopupHorizontalAlign="WindowCenter" 
                        PopupVerticalAlign="WindowCenter"
                        CloseAction="CloseButton" 
                        CloseOnEscape="true" 
                        Modal="True"
                        HeaderText="" 
                        AllowDragging="True"
                        ClientSideEvents-Init="function(s, e) {
                
                            $('#btnThem').click(function () {               
                                 s.SetHeaderText('Thêm mới');
                                 s.Show();
                    
                            });
                        }" 
                        Theme="Office365"
                    >
                        <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); ASPxPopupControl1.Focus(); }" />
                        <ContentCollection>
                            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
                                <dx:ASPxPanel ID="Panel1" runat="server" DefaultButton="btOK">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server" ID="ASPxPanel1">
                                
                                            <dx:ASPxFormLayout ID="createForm" ClientInstanceName="createForm" runat="server" Width="100%" Height="100%">
                                                <Items>
                                                    <dx:LayoutItem Caption="tên quyền">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer Width="100%">
                                                                <dx:ASPxTextBox ID="permissionName" ClientInstanceName="permissionName" runat="server" Width="100%">
                                                                    <ValidationSettings 
                                                                        EnableCustomValidation="True" 
                                                                        ValidationGroup="entryGroup" 
                                                                        SetFocusOnError="True"
                                                                        ErrorDisplayMode="Text" 
                                                                        ErrorTextPosition="Bottom" 
                                                                        CausesValidation="True">
                                                                        <RequiredField ErrorText="tên quyền không bỏ trống" IsRequired="True" />
                                                                        <ErrorFrameStyle Font-Size="10px" ForeColor="Red">
                                                                            <ErrorTextPaddings PaddingLeft="0px" />                                           
                                                                        </ErrorFrameStyle>
                                                         
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </dx:LayoutItemNestedControlContainer>                                               
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>

                                                    <dx:LayoutItem Caption="slug">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer Width="100%">
                                                                <dx:ASPxComboBox 
                                                                    ID="slug" 
                                                                    runat="server"  
                                                                    CallbackPageSize="5"
                                                                    IncrementalFilteringMode="Contains"
                                                                    DropDownRows="5"
                                                                    AutoPostBack="false"
                                                                    SelectedIndex="0"                      
                                                                    ValueType="System.String"
                                                                    EnableCallbackMode="true"
                                                                >
                                                                    
                                                                </dx:ASPxComboBox>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>
                                                    </dx:LayoutItem>

                                                    <dx:LayoutItem ShowCaption="False" Paddings-PaddingTop="19">
                                                        <LayoutItemNestedControlCollection>
                                                            <dx:LayoutItemNestedControlContainer Width="100%">
                                                                <dx:ASPxButton ID="btOK" runat="server" Text="create" AutoPostBack="False" ValidationGroup="entryGroup" Theme="Office365">
                                                                    <ClientSideEvents 
                                                                        Click="function(s, e) {
                                                                            if (ASPxClientEdit.ValidateGroup('entryGroup')) {
                                                                
                                                                                if (!NewsCallback.InCallback()){
                                                                                 
                                                                                    NewsCallback.PerformCallback('Create');
                                                                                }
                                                                            }
                                                                        }" 
                                                                    />
                                                                </dx:ASPxButton>

                                                                <dx:ASPxButton ID="cancel" runat="server" Text="cancel" AutoPostBack="False" Theme="Office365" CssClass="btnHuy">
                                                                    <ClientSideEvents Click="function(s, e) {
                                                                        ASPxPopupControl1.Hide();
                                                                    }" />
                                                                </dx:ASPxButton>
                                                            </dx:LayoutItemNestedControlContainer>
                                                        </LayoutItemNestedControlCollection>

                                                        <Paddings PaddingTop="19px"></Paddings>
                                                    </dx:LayoutItem>
                                                </Items>
                                            </dx:ASPxFormLayout>                                     
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxPanel>
                            </dx:PopupControlContentControl>
                        </ContentCollection>
                    </dx:ASPxPopupControl>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>      
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="bottom" runat="server">
    
</asp:Content>
