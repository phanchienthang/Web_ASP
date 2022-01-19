<%@ page language="C#" masterpagefile="~/AdminTool/Master.master" autoeventwireup="true" inherits="ThemCatalogsProducts, App_Web_g3kbikte" title="Untitled Page" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v14.1" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script language="javascript" type="text/javascript">
        function CheckNull() {
            if (TreeList && TreeList.GetFocusedNodeKey() == '') {
                alertN('Nhóm cao cấp không được rỗng!', function () { txtID_Parent.SetFocus(true); });
                return false;
            }
            if (txtCatalogName.GetValue() != null && !isValid(txtCatalogName.GetValue())) {
                alertN('Tên danh mục không được chứa ký tự đặc biệt!', function () { txtCatalogName.SetFocus(true); });
                return false;
            }
            return true;
        }
        function formatLinkSEO() {
            var text = txtTitleWeb.GetValue();
            if (text != null && text != "") {
                txtLink_SEO.SetText(locdau(text));
            }
        }
        function setHeightFrame(height) {
            if ($('.form_add')) {
                $('.form_add').css({ "border": '1px solid #ccc', "overflow-x": 'auto', "height": height });
            }
        }
        function isChanged() {
            return isFormChanged();
        }
        function ClearSelection() {
            TreeList.SetFocusedNodeKey('');
            UpdateControls(null, '');
        }
        function UpdateSelection() {
            var employeeName = '';
            var focusedNodeKey = TreeList.GetFocusedNodeKey();
            if (focusedNodeKey != '')
                employeeName = TreeList.cpEmployeeNames[focusedNodeKey];
            UpdateControls(focusedNodeKey, employeeName);
        }
        function UpdateControls(key, text) {
            txtID_Parent.SetText(text);
            txtID_Parent.SetKeyValue(key);
            txtID_Parent.HideDropDown();
            UpdateButtons();
        }
        function UpdateButtons() {
            clearButton.SetEnabled(txtID_Parent.GetText() != '');
            selectButton.SetEnabled(TreeList.GetFocusedNodeKey() != '');
        }
        function OnDropDown() {
            TreeList.MakeNodeVisible(TreeList.GetFocusedNodeKey());
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" runat="Server">
    <div class="container">
        <div class="row">
            <div class="box-content">
                <div class="row-fluid">
                    <div class="btn StyleButton_menu">
                        <div class="button">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel_Luu" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <dx:ASPxButton ID="btnLuu" runat="server" UseSubmitBehavior="false" AutoPostBack="false" ClientInstanceName="btnLuu"
                                        Text="Lưu" ClientSideEvents-Click="function(s, e) {e.processOnServer = CheckNull(); }" OnClick="btnLuu_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="button">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel_LuuThem" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <dx:ASPxButton ID="btnLuuThem" runat="server" UseSubmitBehavior="false" AutoPostBack="false" ClientInstanceName="btnLuuThem"
                                        Text="Lưu và thêm mới" EnableClientSideAPI="True" OnClick="btnLuuThem_Click" ClientSideEvents-Click="function(s, e) {e.processOnServer = CheckNull(); }" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="button">
                            <asp:UpdatePanel runat="server" ID="UpdatePanel_Sua" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <dx:ASPxButton ID="btnSua" runat="server" UseSubmitBehavior="false" AutoPostBack="false" ClientInstanceName="btnSua"
                                        Text="Sửa" ClientEnabled="false" EnableClientSideAPI="True" OnClick="btnSua_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <div class="row-fluid">
                    <div class="form_add">
                        <div class="box-content">
                            <form class="form-horizontal" action="">
                                <fieldset>
                                    <div class="control-group">
                                        <%--<%= Utils.getLabelControlAdmin(1,ID_Form,false,"CatalogsProducts_ID_Parent","")%>--%>
                                        <label>Nhóm cao cấp <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxCallbackPanel runat="server" ID="ContactDetailsPanel" ClientInstanceName="ClientContactDetailsPanel"
                                                RenderMode="Div" Width="100%" Height="100%" LoadingPanelText="Đang nạp dữ liệu">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <asp:SqlDataSource ID="dsID_Parent" runat="server" EnableCaching="false" />
                                                        <dx:ASPxDropDownEdit ID="txtID_Parent" runat="server" ClientInstanceName="txtID_Parent" Width="100%" AllowUserInput="False" AnimationType="Slide">
                                                            <DropDownWindowStyle>
                                                                <Border BorderWidth="0px" />
                                                            </DropDownWindowStyle>
                                                            <ClientSideEvents DropDown="OnDropDown" />
                                                            <DropDownWindowTemplate>
                                                                <div>
                                                                    <dx:ASPxTreeList ID="TreeList" ClientInstanceName="TreeList" runat="server" EnableCallbacks="true" Width="100%" DataSourceID="dsID_Parent"
                                                                        OnInit="OnTreeListInit" RenderMode="Lightweight" EnableViewState="false" OnCustomJSProperties="TreeList_CustomJSProperties"
                                                                        KeyFieldName="ID_Catalog" ParentFieldName="ID_Parent" CssClass="bgGridview">
                                                                        <Settings VerticalScrollBarMode="Auto" ScrollableHeight="300" />
                                                                        <ClientSideEvents FocusedNodeChanged="function(s,e){ selectButton.SetEnabled(true); }" />
                                                                        <BorderBottom BorderStyle="Solid" />
                                                                        <SettingsBehavior AllowFocusedNode="true" AutoExpandAllNodes="true" FocusNodeOnLoad="false" />
                                                                        <SettingsPager Mode="ShowAllNodes">
                                                                        </SettingsPager>
                                                                        <Styles>
                                                                            <Node Cursor="pointer"></Node>
                                                                            <Indent Cursor="default"></Indent>
                                                                            <Header CssClass="Head_dev" Font-Bold="True" HorizontalAlign="Left" />
                                                                            <PagerBottomPanel BackColor="#f4fafb"></PagerBottomPanel>
                                                                        </Styles>
                                                                        <Columns>
                                                                            <dx:TreeListTextColumn FieldName="CatalogName" SortIndex="0" SortOrder="Ascending" Caption="Nhóm Cao Cấp" Width="100%">
                                                                                <CellStyle>
                                                                                    <Paddings Padding="0" />
                                                                                </CellStyle>
                                                                                <EditCellStyle>
                                                                                    <Paddings Padding="0" />
                                                                                </EditCellStyle>
                                                                            </dx:TreeListTextColumn>
                                                                        </Columns>
                                                                    </dx:ASPxTreeList>
                                                                </div>
                                                                <table style="background-color: White; width: 100%;">
                                                                    <tr>
                                                                        <td style="padding: 10px;">
                                                                            <dx:ASPxButton ID="clearButton" ClientEnabled="false" ClientInstanceName="clearButton"
                                                                                runat="server" AutoPostBack="false" Text="Clear">
                                                                                <ClientSideEvents Click="ClearSelection" />
                                                                            </dx:ASPxButton>
                                                                        </td>
                                                                        <td style="text-align: right; padding: 10px;">
                                                                            <dx:ASPxButton ID="selectButton" ClientEnabled="false" ClientInstanceName="selectButton"
                                                                                runat="server" AutoPostBack="false" Text="Chọn">
                                                                                <ClientSideEvents Click="UpdateSelection" />
                                                                            </dx:ASPxButton>
                                                                        </td>
                                                                        <td style="text-align: right; padding: 10px;">
                                                                            <dx:ASPxButton ID="closeButton" runat="server" AutoPostBack="false" Text="Thoát">
                                                                                <ClientSideEvents Click="function(s,e) { txtID_Parent.HideDropDown(); }" />
                                                                            </dx:ASPxButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </DropDownWindowTemplate>
                                                        </dx:ASPxDropDownEdit>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Tên nhóm sản phẩm <span style="color: #f00;">(*)</span></label>
                                        <%--   <%= Utils.getLabelControlAdmin(1,ID_Form,true,"CatalogsProducts_CatalogName","")%>--%>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtCatalogName" runat="server" ClientInstanceName="txtCatalogName" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <%-- <%= Utils.getLabelControlAdmin(3,IDForm,true,CatalogsProducts_Link_SEO,"formatLinkSEO();")%>--%>
                                        <label>Đường dẫn website <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtLink_SEO" runat="server" ClientInstanceName="txtLink_SEO" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <asp:HiddenField ID="hf" Value="" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
