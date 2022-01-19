<%@ page language="C#" masterpagefile="~/AdminTool/Master.master" autoeventwireup="true" inherits="ThemProducts, App_Web_pzl4nev4" title="Untitled Page" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxImageSlider" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v14.1" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../../../../ckfinder/ckfinder.js" type="text/javascript">  </script>
    <script language="javascript" type="text/javascript">
        var hfIDImage = document.getElementById("<%= hfIDImage.ClientID %>");
        if (hfIDImage) {
            hfIDImage.value = 0;
        }
        function CheckNull() {
            if (TreeList && TreeList.GetFocusedNodeKey() == '') {
                alertN('Danh mục sản phẩm không được rỗng!', function () { txtID_Catalog.SetFocus(true); });
                return false;
            }
            if (txtManufacture.GetSelectedIndex() < 0) {
                alertN('Nhà sản xuất không được rỗng!', function () { txtManufacture.SetFocus(true); });
                return false;
            }
            if (txtProductName.GetValue() != null && !isValid(txtProductName.GetValue())) {
                alertN('Tên sản phẩm không được chứa ký tự đặc biệt!', function () { txtProductName.SetFocus(true); });
                return false;
            }
            if (txtProductCode.GetValue() != null && !isValid(txtProductCode.GetValue())) {
                alertN('Mã sản phẩm không được chứa ký tự đặc biệt!', function () { txtProductCode.SetFocus(true); });
                return false;
            }
            if (txtImage.GetValue() != null && !isValid(txtImage.GetValue())) {
                alertN('Hình ảnh không được chứa ký tự đặc biệt!', function () { txtImage.SetFocus(true); });
                return false;
            }
            if (txtDescription.GetValue() != null && !isValid(txtDescription.GetValue())) {
                alertN('Mô tả không được chứa ký tự đặc biệt!', function () { txtDescription.SetFocus(true); });
                return false;
            }
            if (txtQuantity.GetValue() != null && !isValid(txtQuantity.GetValue())) {
                alertN('Số lượng không được chứa ký tự đặc biệt!', function () { txtQuantity.SetFocus(true); });
                return false;
            }
            if (txtProductPrice.GetValue() != null && !isValid(txtProductPrice.GetValue())) {
                alertN('Giá đề xuất không được chứa ký tự đặc biệt!', function () { txtProductPrice.SetFocus(true); });
                return false;
            }
            if (txtPrice.GetValue() != null && !isValid(txtPrice.GetValue())) {
                alertN('Giá cũ không được chứa ký tự đặc biệt!', function () { txtPrice.SetFocus(true); });
                return false;
            }
            if (txtSale.GetValue() != null && !isValid(txtSale.GetValue())) {
                alertN('Giá mới không được chứa ký tự đặc biệt!', function () { txtSale.SetFocus(true); });
                return false;
            }
            if (txtProductionDate.GetValue() != null && !isValid(txtProductionDate.GetValue())) {
                alertN('Ngày sản xuất không được chứa ký tự đặc biệt!', function () { txtProductionDate.SetFocus(true); });
                return false;
            }
            if (txtExpireDate.GetValue() != null && !isValid(txtExpireDate.GetValue())) {
                alertN('Hạn sử dụng không được chứa ký tự đặc biệt!', function () { txtExpireDate.SetFocus(true); });
                return false;
            }
            if (txtCurrencyUnit.GetValue() != null && !isValid(txtCurrencyUnit.GetValue())) {
                alertN('Loại tiền tệ không được chứa ký tự đặc biệt!', function () { txtCurrencyUnit.SetFocus(true); });
                return false;
            }
            if (txtUnit.GetValue() != null && !isValid(txtUnit.GetValue())) {
                alertN('Đơn vị tính không được chứa ký tự đặc biệt!', function () { txtUnit.SetFocus(true); });
                return false;
            }
            if (txtShowPrices.GetValue() != null && !isValid(txtShowPrices.GetValue())) {
                alertN('Hiển thị giá không được chứa ký tự đặc biệt!', function () { txtShowPrices.SetFocus(true); });
                return false;
            }
            if (txtAllowSale.GetValue() != null && !isValid(txtAllowSale.GetValue())) {
                alertN('Cho phép đặt hàng không được chứa ký tự đặc biệt!', function () { txtAllowSale.SetFocus(true); });
                return false;
            }
            if (txtVAT.GetValue() != null && !isValid(txtVAT.GetValue())) {
                alertN('Thuế VAT không được chứa ký tự đặc biệt!', function () { txtVAT.SetFocus(true); });
                return false;
            }
            if (txtStatus.GetValue() != null && !isValid(txtStatus.GetValue())) {
                alertN('Tình trạng không được chứa ký tự đặc biệt!', function () { txtStatus.SetFocus(true); });
                return false;
            }
            return true;
        }
        var checkTextBox = "";
        function fileSelectChanged(s, e) {
            var file = e.file;
            if (file) {
                var name = file.GetFullName();
                tbFileName.SetText(name.replace(/\\/g, "/"));
            }
        }
        cfheight = 140;
        cfwidth = 140;
        function setPictureLink(link) {
            if (checkTextBox == 'Image') {
                txtImage.SetText(link);
                return;
            }
            var InputText = document.getElementById(checkTextBox);
            if (InputText) {
                InputText.value = link;
            }
        }
        function showSaveAsDialog(check) {
            checkTextBox = check;
            var h = window.innerHeight;
            var w = window.innerWidth - 20;
            if (w > 800) {
                w = 800;
            }
            if (h > 550) {
                h = 550;
            }
            window.parent.pcSaveAs.SetContentUrl("Module/FileManagerCrop.aspx?height=" + cfheight + "&width=" + cfwidth + "&module=tbProducts");
            window.parent.pcSaveAs.SetSize(w, h);
            window.parent.pcSaveAs.Show();
        }
        function formatLinkSEO() {
            var text = txtTitleWeb.GetValue();
            if (text != null && text != "") {
                txtLink_SEO.SetText(locdau(text));
            }
        }
        function createDiv() {
            var textbox = document.createElement('input');
            textbox.type = 'text';
            document.getElementById("<%= dnm.ClientID %>").appendChild(textbox);
        }
        var counter = 0;
        function addNew() {
            var mainContainer = document.getElementById("<%= dnm.ClientID %>");
            var newDiv = document.createElement('div');
            var newbuttongetlink = document.createElement('input');
            newbuttongetlink.type = "button";
            newbuttongetlink.value = "Duyệt ảnh";
            var c = counter;
            newbuttongetlink.onclick = function () {
                showSaveAsDialog(c);
            }
            var newText = document.createElement('input');
            newText.id = counter;
            newText.name = counter;
            newText.type = "input";
            newText.setAttribute('size', 10);
            newText.style.width = '700px';
            newText.value = "";
            var newDelButton = document.createElement('input');
            newDelButton.type = "button";
            newDelButton.value = "Hủy";
            newDiv.appendChild(newbuttongetlink);
            newDiv.appendChild(newText);
            newDiv.appendChild(newDelButton);
            mainContainer.appendChild(newDiv);
            counter++;
            newDelButton.onclick = function () {
                mainContainer.removeChild(newDiv);
            }
        }
        var checkCB = false;
        function SetImagePopup(ID_HangHoa) {
            if (ID_HangHoa != 0) {
                popupImage.Hide();
                ClientContactDetailsPanel.PerformCallback('HangHoa' + ID_HangHoa);
                checkCB = true;
            }
        }
        function OnImageClick(name) {
            var imageSliderItem = imageSlider.GetItemByName(name);
            if (!imageSliderItem)
                return;
            window.location.hash = name;
            popup.Show();
            window.setTimeout(function () { UpdatePopupPosition(); }, 0);
            imageSlider.SetActiveItem(imageSliderItem, true);
            UpdateText();
        }
        var name = '';
        function callback_funcThongBaoXoaHinhAnh(btnval) {
            if (btnval == 'Có') {
                var btnXoaAnh = document.getElementById("<%= btnXoaAnh.ClientID %>");
           if (btnXoaAnh) {
               btnXoaAnh.click();
           }
       } else {
           hfIDImage.value = 0;
       }
   }
   function OnDelete(names) {
       confirmA('Bạn có chắc chắn xóa hình ảnh của khách sạn này không!', callback_funcThongBaoXoaHinhAnh);
       name = names;
       hfIDImage.value = name;
   }
   function OnPopupCloseUp() {
       window.location.hash = "";
   }
   function OnPopupUp() {
       imageSlider.Focus();
   }
   function OnImageUp() {
       imageSliderPopup.Focus();
   }
   function OnActiveItemChanged(s, e) {
       window.location.hash = e.item.name;
       UpdateText();
   }
   function UpdateText() {
       document.getElementById("itemText").innerHTML = (imageSlider.GetActiveItemIndex() + 1) + " / " + imageSlider.GetItemCount();
   }
   function UpdateTextPopup() {
       document.getElementById("itemTextPopup").innerHTML = (imageSliderPopup.GetActiveItemIndex() + 1) + " / " + imageSliderPopup.GetItemCount();
   }
   function UpdatePopupPosition() {
       if (popup.IsVisible())
           popup.UpdatePosition();
   }
   function UpdateImagePopupPosition() {
       if (popupImage.IsVisible())
           popupImage.UpdatePosition();
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
       txtID_Catalog.SetText(text);
       txtID_Catalog.SetKeyValue(key);
       txtID_Catalog.HideDropDown();
       UpdateButtons();
   }
   function UpdateButtons() {
       clearButton.SetEnabled(txtID_Catalog.GetText() != '');
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
                                        <label></label>
                                        <div class="controls">
                                            <dx:ASPxCallbackPanel runat="server" ID="ContactDetailsPanel" ClientInstanceName="ClientContactDetailsPanel"
                                                RenderMode="Div" Width="100%" Height="100%" LoadingPanelText="Đang nạp dữ liệu">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <asp:SqlDataSource ID="dsID_Catalog" runat="server" EnableCaching="false" />
                                                        <dx:ASPxDropDownEdit ID="txtID_Catalog" runat="server" ClientInstanceName="txtID_Catalog" Width="100%" AllowUserInput="False" AnimationType="Slide">
                                                            <DropDownWindowStyle>
                                                                <Border BorderWidth="0px" />
                                                            </DropDownWindowStyle>
                                                            <ClientSideEvents DropDown="OnDropDown" />
                                                            <DropDownWindowTemplate>
                                                                <div>
                                                                    <dx:ASPxTreeList ID="TreeList" ClientInstanceName="TreeList" runat="server" EnableCallbacks="true" Width="100%" DataSourceID="dsID_Catalog"
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
                                                                                <ClientSideEvents Click="function(s,e) { txtID_Catalog.HideDropDown(); }" />
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
                                        <label>Nhà sản xuất <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <asp:SqlDataSource ID="dsManufacture" runat="server" EnableCaching="false" />
                                            <dx:ASPxComboBox ID="txtManufacture" OnLoad="OnComboBoxLoad" DataSourceID="dsManufacture" TextField="ManufactureName" ValueField="ID_Manufacture" runat="server" ClientInstanceName="txtManufacture" AutoPostBack="false"
                                                ValueType="System.String" TextFormatString="{1}" IncrementalFilteringMode="Contains" DropDownWidth="183" DropDownHeight="200" DropDownStyle="DropDownList" Width="100%">
                                                <ClientSideEvents EndCallback="function(s,e){txtManufacture.SetSelectedIndex(txtManufacture.GetItemCount()-1); }" />
                                            </dx:ASPxComboBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Tên sản phẩm <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtProductName" runat="server" ClientInstanceName="txtProductName" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Mã sản phẩm <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtProductCode" runat="server" ClientInstanceName="txtProductCode" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Hình ảnh đại diện <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtImage" runat="server" ClientInstanceName="txtImage" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Chi tiết sản phẩm <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <CKEditor:CKEditorControl ID="txtDetail" Language="Vi" BasePath="~/ckeditor" runat="server"></CKEditor:CKEditorControl>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Mô tả sản phẩm <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtDescription" runat="server" ClientInstanceName="txtDescription" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Số lượng <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxSpinEdit ID="txtQuantity" runat="server" ClientInstanceName="txtQuantity" CssClass="InputText" Width="80px" Number="1"
                                                MaxValue="1000" MinValue="0" AllowMouseWheel="false" NumberType="Integer" HorizontalAlign="Right">
                                                <ClientSideEvents Init="function(s, e) { s.GetNextTimerInterval = function (iterationIndex) { return iterationIndex === 1 ? 10000000 : 1000000;}}" />
                                            </dx:ASPxSpinEdit>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Giá đề xuất <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtProductPrice" runat="server" ClientInstanceName="txtProductPrice" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Giá cũ <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtPrice" runat="server" ClientInstanceName="txtPrice" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Giá mới <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtSale" runat="server" ClientInstanceName="txtSale" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Ngày sản xuất <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxDateEdit ID="txtProductionDate" runat="server" ClientInstanceName="txtProductionDate" HorizontalAlign="Left" Width="100%"></dx:ASPxDateEdit>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Hạn sử dụng <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxDateEdit ID="txtExpireDate" runat="server" ClientInstanceName="txtExpireDate" HorizontalAlign="Left" Width="100%"></dx:ASPxDateEdit>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Loại tiền tệ <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtCurrencyUnit" runat="server" ClientInstanceName="txtCurrencyUnit" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Đơn vị tính <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtUnit" runat="server" ClientInstanceName="txtUnit" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Hiển thị giá <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxCheckBox ID="txtShowPrices" runat="server" ClientInstanceName="txtShowPrices" CssClass="InputText" Width="100px"></dx:ASPxCheckBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Cho phép đặt hàng <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxCheckBox ID="txtAllowSale" runat="server" ClientInstanceName="txtAllowSale" CssClass="InputText" Width="100px"></dx:ASPxCheckBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Giá đã bao gồm thuế <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxCheckBox ID="txtVAT" runat="server" ClientInstanceName="txtVAT" CssClass="InputText" Width="100px"></dx:ASPxCheckBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Tình trạng sản phẩm <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtStatus" runat="server" ClientInstanceName="txtStatus" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label>Đường dẫn thân thiện <span style="color: #f00;">(*)</span></label>
                                        <div class="controls">
                                            <dx:ASPxTextBox ID="txtLink_SEO" runat="server" ClientInstanceName="txtLink_SEO" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                        <dx:ASPxCallbackPanel runat="server" ID="CP" ClientInstanceName="ClientContactDetailsPanel"
                            RenderMode="Div" Width="98%" LoadingPanelText="Đang nạp dữ liệu"
                            ClientSideEvents-EndCallback="function(s,e){ if(checkCB == true){ popupImage.Show(); checkCB=false; } }">
                            <PanelCollection>
                                <dx:PanelContent>
                                    <fieldset id="Fieldset1" class="border_radius" style="padding: 5px 30px">
                                        <legend class="textBlue" style="margin-left: 5px">Hình&nbsp;ảnh</legend>
                                        <div style="overflow: auto; height: 105px">
                                            <div class="content-if img">
                                                <asp:Repeater ID="dvGalery" OnLoad="dvGalery_Load"
                                                    runat="server">
                                                    <ItemTemplate>
                                                        <a style="margin-right: 20px;" onclick='OnImageClick(<%# Eval("ID_Image")%>)' href="#">
                                                            <img src='/<%# Eval("Image")%>' alt="" width="150px" />
                                                        </a>
                                                        <a href='<%# string.Format("javascript:OnDelete(\"{0}\")", Eval("ID_Image"))%>'
                                                            style="color: red; font-size: 10px; padding-top: 0; margin-top: 0; position: absolute; margin-left: -20px;">Xóa </a>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <dx:ASPxPopupControl ID="p4" runat="server" ClientInstanceName="popup"
                                        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                                        BackColor="Transparent" ShowShadow="false" Border-BorderStyle="None" ShowHeader="false"
                                        ShowPageScrollbarWhenModal="false" EnableDefaultAppearance="false" EnableTheming="false"
                                        Width="800" Height="450" Top="0">
                                        <ContentStyle Paddings-Padding="0" Border-BorderWidth="0" />
                                        <ClientSideEvents CloseUp="OnPopupCloseUp" PopUp="OnPopupUp" />
                                        <ModalBackgroundStyle Opacity="100" BackColor="#1a1a1a" />
                                        <ContentCollection>
                                            <dx:PopupControlContentControl>
                                                <div id="imgHangHoa" style="width: 100%; height: auto; display: block">
                                                    <div style="position: absolute; top: 0; right: 0; z-index: 9999">
                                                        <a onclick="popup.Hide();" style="padding: 0px; float: right;">
                                                            <img alt="Close" src="../../../../images/close.png" title="Nhấn Esc để thoát" /></a>
                                                    </div>
                                                    <div style="width: inherit; height: auto">
                                                        <center>
     <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" OnLoad="SlideImage_Load" ClientInstanceName="imageSlider"
    NameField="ID_Image" EnableTheming="false" ImageUrlField="Image"
     ShowNavigationBar="true" Width="800" Height="450"
    Styles-Item-BackgroundImage-HorizontalPosition="center">
     <SettingsImageArea NavigationButtonVisibility="Always" />
     <SettingsBehavior EnablePagingByClick="True" ImageLoadMode="DynamicLoadAndCache"/>
      <Styles>
          <ImageArea BackgroundImage-HorizontalPosition="center" Width="400px" />
          <Item BackgroundImage-HorizontalPosition="center" />
          <ItemTextArea BackgroundImage-HorizontalPosition="center" />
        </Styles>
        <ClientSideEvents ActiveItemChanged="OnActiveItemChanged" />
        </dx:ASPxImageSlider>
     </center>
                                                    </div>
                                                    <div style="position: absolute; bottom: 0; right: 0">
                                                        <span style="color: #ffffff; font-size: 9pt; font-family: 'Segoe UI', 'Helvetica Neue', Tahoma;" id="itemText">1/20</span>
                                                    </div>
                                                </div>
                                            </dx:PopupControlContentControl>
                                        </ContentCollection>
                                        <Border BorderStyle="None"></Border>
                                    </dx:ASPxPopupControl>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                        <fieldset id="Fieldset8" class="border_radius" style="padding: 5px 30px">
                            <legend>Đường&nbsp;dẫn&nbsp;ảnh&nbsp;website&nbsp;:&nbsp;</legend>
                            <div style="max-height: 120px; overflow: auto">
                                <span id="dnm" runat="server"></span>
                                <dx:ASPxButton ID="btnAddDiv" ClientInstanceName="btnAddDiv" runat="server" AutoPostBack="false"
                                    ToolTip="Click để thêm link" Text="Thêm">
                                    <ClientSideEvents Click="function(s, e) { addNew(); }" />
                                </dx:ASPxButton>
                            </div>
                        </fieldset>
                    </div>
                    <asp:HiddenField ID="hf" Value="" runat="server" />
                    <asp:HiddenField ID="hfIDImage" Value="" runat="server" />
                    <div style="display: none">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                            <ContentTemplate>
                                <a href="#" id="btnXoaAnh" runat="server" onserverclick="btnXoaAnh_Click"></a>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
