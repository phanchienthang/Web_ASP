<%@ page language="C#" masterpagefile="~/AdminTool/MP.master" autoeventwireup="true" inherits="DanhSachProducts, App_Web_o1yggtw0" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
 <%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
      <%@ Register Src="~/UserControls/PopupFM.ascx" TagName="PopupFM" TagPrefix="pFM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script language="javascript" type="text/javascript" async>
 var delID = "<%= xoa.ClientID %>";
  var cdelID = "<%= confirmxoa.ClientID %>";
  var ID_Form = "<%= Utils.GetID_Form(this.Page) %>";
   var refresh = "<%= refresh.ClientID %>";
var cloneID = "<%= clone.ClientID %>";
   function confirmClone() {
  if (grvProducts.GetFocusedRowIndex() >= 0) {
   lp.Show();
    confirmA('Bạn có chắc chắn nhân bản products đang chọn ?', DoClone);
   }
   else {
       alertTB('Bạn vui lòng chọn products để nhân bản !');
   }
    }
  function DoClone(btnVal) {
     if (btnVal == "Có") {
       var bt = document.getElementById(cloneID);
     if (bt) {
        bt.click();
    }
  } else {
       lp.Hide();
   }
    }
   </script>
<script type="text/javascript" src="js/gen/Products.js?ver=12" async></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" Runat="Server">
<div class="divMain">
<dx:ASPxLoadingPanel ID="lp" Modal="true" Text="Đang nạp dữ liệu" ClientInstanceName="lp" runat="server"></dx:ASPxLoadingPanel>

  <div id="contentMain" class="row">
 <div class="box col-md-3 space-right">
  <div class="box-inner">
 <div class="box-header well" data-original-title="">
    <h2>Manufacture</h2>
  <div class="box-icon">
  <a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>
  </div>
 </div>
 <div class="box-content">
    <div class="row-fluid">
   <div class="btn">&nbsp;</div>
 </div>
    <div class="row-fluid">
 <asp:ObjectDataSource ID="dsManufacture" runat="server" OnSelecting="dsManufacture_Selecting"
        SelectMethod="getDataTable_LikeKey" TypeName="Library.Business.Cls_Manufacture" />
    <dx:ASPxGridView ID="grvManufacture" DataSourceID="dsManufacture" KeyFieldName="ID_Manufacture"  EnableViewState="false" runat="server" CssClass="bgGridview" Paddings-PaddingLeft="0" RenderMode="Lightweight" ClientInstanceName="grvManufacture"  AutoGenerateColumns="False" Width="100%">
   <SettingsLoadingPanel Text="Đang nạp dữ liệu" />
      <Styles>
        <Header CssClass="Head_dev" Font-Bold="True"> </Header>
     <GroupRow CssClass="GroupRow_dev"> </GroupRow>
      <FocusedGroupRow CssClass="FocusedGroupRow_dev"></FocusedGroupRow>
      <Row CssClass="Row_dev" Wrap="True"></Row>
    </Styles>
  <ClientSideEvents Init="OnInit" EndCallback="OnEndCallback"
    FocusedRowChanged="function(s, e) {  checkFocus=true;   var w = window.innerWidth; if (hf.Get('Width') != undefined || w < 800) {  if (hf.Get('Width') != w) { hf.Set('Width', w); } grvProducts.Refresh(); }else{ hf.Set('Width', w); } e.processOnServer = false;}" />
        <Columns>
      <dx:GridViewDataColumn Name="ID_Manufacture" FieldName="ID_Manufacture" ReadOnly="true" Caption="ID_Manufacture" Visible="False" />
      <dx:GridViewDataColumn FieldName="ManufactureName" Settings-AutoFilterCondition="Contains" Caption="ManufactureName" Width="300px" />
      <dx:GridViewDataColumn FieldName="AddTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm đăng" Width="140px" />
      <dx:GridViewDataColumn FieldName="EditTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm sửa" Width="130px" />
    </Columns>
       <SettingsText HeaderFilterShowAll="Tất cả"/>
       <Settings ShowGroupPanel="False" ShowFilterRow="true" ShowHeaderFilterButton="true" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
       <SettingsBehavior AutoExpandAllGroups="true" AllowFocusedRow="true" AutoFilterRowInputDelay="3000" ColumnResizeMode="Control" />
                             <SettingsPager PageSize="30" Summary-Text="" Summary-AllPagesText="" NumericButtonCount="5">
                   <PageSizeItemSettings Visible="false" ShowAllItem="true" Caption="Hiển thị" />
                   <NextPageButton Visible="false">
                   </NextPageButton>
                   <PrevPageButton Visible="false">
                  </PrevPageButton>
              </SettingsPager>
     </dx:ASPxGridView>
    </div>
 </div>
    </div>
    </div>
  <div id="Products" class="box col-md-9">
  <div class="box-inner">
 <div class="box-header well" data-original-title="">
    <h2>Products</h2>
  <div class="box-icon">
  <a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>
  </div>
 </div>
 <div class="box-content">
    <div class="row-fluid">
  <div class="btn StyleButton_menu">
 <div class="button">
                    <a class="btn btn-success" onclick="GoToTreeList()" href="#"> <i class="glyphicon glyphicon-backward"></i></a>
 </div>
 <div class="button">
           <a class="btn btn-success" onclick="ThemProducts()" href="#">
          <i class="glyphicon glyphicon-plus-sign">
         </i><span class="hidden-1">Thêm </span></a>
 </div>
 <div class="button">
         <a class="btn btn-danger" onclick="confirmDelete()" href="#"><i class="glyphicon glyphicon-trash white">
         </i><span class="hidden-1">Xóa </span></a>
 </div>
       </div>
 </div>
    <div class="row-fluid">
   <asp:ObjectDataSource ID="dsProducts" runat="server" OnSelecting="dsProducts_Selecting" 
             SelectMethod="getDataTable_With_ID_Manufacture" TypeName="Library.Business.Cls_Products">
 <SelectParameters>
    <asp:SessionParameter Name="ID_Manufacture" SessionField="ID_Manufacture" Type="Int32" />
  </SelectParameters>
  </asp:ObjectDataSource>
    <dx:ASPxGridView ID="grvProducts" KeyFieldName="ID_Product" OnRowUpdating="grid_RowUpdating" OnCustomJSProperties="ASPxGridView_CustomJSProperties" OnBeforePerformDataSelect="grvProducts_BeforePerformDataSelect" runat="server" DataSourceID="dsProducts" EnableViewState="false" CssClass="bgGridview" Paddings-PaddingLeft="0" RenderMode="Lightweight" ClientInstanceName="grvProducts"  OnCustomCallback="ASPxGridView_CustomCallback" AutoGenerateColumns="False" Width="100%">
   <SettingsLoadingPanel Text="Đang nạp dữ liệu" />
      <Styles>
        <Header CssClass="Head_dev" Font-Bold="True"> </Header>
     <GroupRow CssClass="GroupRow_dev"> </GroupRow>
      <FocusedGroupRow CssClass="FocusedGroupRow_dev"></FocusedGroupRow>
      <Row CssClass="Row_dev" Wrap="True"></Row>
    </Styles>
  <ClientSideEvents RowDblClick="function(s, e) {OnGridDoubleClick(s.GetRowKey(e.visibleIndex));}" 
    EndCallback="function(s, e) { if (s.cpUpdate) {alertU();} lp.Hide();if(checkFocus){ checkFocus=false;  gotoGrid(); if(grvProducts.GetPageIndex()!=0){ grvProducts.GotoPage(0);}  grvProducts.SetFocusedRowIndex(0); } OnEndCallback();}" />
        <Columns>
 <dx:GridViewCommandColumn Name="Select"  ShowSelectCheckbox="True" ShowClearFilterButton="true"
   Width="45" MinWidth="45" SelectAllCheckboxMode="Page"> </dx:GridViewCommandColumn>
 <dx:GridViewDataTextColumn EditFormSettings-Visible="False" Name="Edit" Caption="" Width="130px"  >
       <DataItemTemplate>
         <a class="btn btn-info" onclick="confirmClone()"
             href="#"><i class="glyphicon glyphicon-plus-sign white"></i><span class="text_hidden">Nhân bản</span></a>
         <a class="btn btn-info" onclick="ChiTietProducts('<%# Eval("ID_Product") %>')"
             href="#"><i class="glyphicon glyphicon-edit white"></i><span class="text_hidden">Sửa</span></a>
         </DataItemTemplate>
     </dx:GridViewDataTextColumn>
      <dx:GridViewDataColumn Name="ID_Product" FieldName="ID_Product" ReadOnly="true" Caption="ID_Product" Visible="False" />
      <dx:GridViewDataColumn Name="ProductName"  FieldName="ProductName" Settings-AutoFilterCondition="Contains" Caption="Tên sản phẩm" Width="250px" />
      <dx:GridViewDataColumn Name="ProductCode"  FieldName="ProductCode" Settings-AutoFilterCondition="Contains" Caption="Mã code sản phẩm" Width="250px" />
      <dx:GridViewDataColumn Name="Description"  FieldName="Description" Settings-AutoFilterCondition="Contains" Caption="Mô tả" Width="250px" />
      <dx:GridViewDataColumn Name="Quantity"  FieldName="Quantity" Settings-AutoFilterCondition="Contains" Caption="Quantity" Width="80px" />
      <dx:GridViewDataColumn Name="ProductPrice"  FieldName="ProductPrice" Settings-AutoFilterCondition="Contains" Caption="ProductPrice" Width="250px" />
      <dx:GridViewDataColumn Name="Price"  FieldName="Price" Settings-AutoFilterCondition="Contains" Caption="Giá" Width="250px" />
      <dx:GridViewDataColumn Name="Sale"  FieldName="Sale" Settings-AutoFilterCondition="Contains" Caption="Sale" Width="250px" />
      <dx:GridViewDataColumn Name="ProductionDate"  FieldName="ProductionDate" Settings-AutoFilterCondition="Contains" Caption="ProductionDate" Width="140px" />
      <dx:GridViewDataColumn Name="ExpireDate"  FieldName="ExpireDate" Settings-AutoFilterCondition="Contains" Caption="ExpireDate" Width="100px" />
      <dx:GridViewDataColumn Name="CurrencyUnit"  FieldName="CurrencyUnit" Settings-AutoFilterCondition="Contains" Caption="CurrencyUnit" Width="250px" />
      <dx:GridViewDataColumn Name="Unit"  FieldName="Unit" Settings-AutoFilterCondition="Contains" Caption="Unit" Width="250px" />
      <dx:GridViewDataColumn Name="ShowPrices"  FieldName="ShowPrices" Settings-AutoFilterCondition="Contains" Caption="ShowPrices" Width="100px" />
      <dx:GridViewDataColumn Name="AllowSale"  FieldName="AllowSale" Settings-AutoFilterCondition="Contains" Caption="AllowSale" Width="90px" />
      <dx:GridViewDataColumn Name="VAT"  FieldName="VAT" Settings-AutoFilterCondition="Contains" Caption="Thuế VAT" Width="80px" />
      <dx:GridViewDataColumn EditFormSettings-Visible="False" Name="AddTime"  FieldName="AddTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm đăng" Width="120px" />
      <dx:GridViewDataColumn EditFormSettings-Visible="False" Name="EditTime"  FieldName="EditTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm sửa" Width="110px" />
      <dx:GridViewDataColumn Name="Status"  FieldName="Status" Settings-AutoFilterCondition="Contains" Caption="Tình trạng" Width="250px" />
    </Columns>
   <SettingsEditing Mode="Batch" BatchEditSettings-ShowConfirmOnLosingChanges="true" BatchEditSettings-EditMode="Cell" BatchEditSettings-StartEditAction="Click" />
                      <SettingsText  CommandBatchEditCancel="Hủy" CommandBatchEditUpdate="Lưu thay đổi" />
    <Templates>
                 <DetailRow>
                   <div class="content_grv">
               <div class="grv_images">
                <img src="/<%# Eval("Image")%>?v=18" />
           </div>
          <div class="grv_contain">
     <b>Tên sản phẩm</b> : <%# Eval("ProductName")%><br>
     <b>Mã code sản phẩm</b> : <%# Eval("ProductCode")%><br>
     <b>Mô tả</b> : <%# Eval("Description")%><br>
     <b>Quantity</b> : <%# Eval("Quantity")%><br>
     <b>ProductPrice</b> : <%# Eval("ProductPrice")%><br>
     <b>Giá</b> : <%# Eval("Price")%><br>
     <b>Sale</b> : <%# Eval("Sale")%><br>
     <b>ProductionDate</b> : <%# Eval("ProductionDate")%><br>
     <b>ExpireDate</b> : <%# Eval("ExpireDate")%><br>
     <b>CurrencyUnit</b> : <%# Eval("CurrencyUnit")%><br>
     <b>Unit</b> : <%# Eval("Unit")%><br>
     <b>ShowPrices</b> : <%# Eval("ShowPrices")%><br>
     <b>AllowSale</b> : <%# Eval("AllowSale")%><br>
     <b>Thuế VAT</b> : <%# Eval("VAT")%><br>
     <b>Thời điểm đăng</b> : <%# Eval("AddTime")%><br>
     <b>Thời điểm sửa</b> : <%# Eval("EditTime")%><br>
     <b>Tình trạng</b> : <%# Eval("Status")%><br>
     </div>
    </div>
    </DetailRow>
       </Templates>
     <SettingsDetail ShowDetailRow="true" />
       <SettingsText HeaderFilterShowAll="Tất cả"/>
       <Settings ShowGroupPanel="False" ShowFilterRow="true" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
       <SettingsBehavior AutoExpandAllGroups="true" AllowFocusedRow="true" AutoFilterRowInputDelay="3000" ColumnResizeMode="Control" />
                             <SettingsPager Mode="ShowPager" PageSize="20" Summary-Text="" Summary-AllPagesText="" NumericButtonCount="5">
                   <PageSizeItemSettings Visible="false" ShowAllItem="true" Caption="Hiển thị" />
                   <NextPageButton Visible="false">
                   </NextPageButton>
                   <PrevPageButton Visible="false">
                  </PrevPageButton>
              </SettingsPager>
     </dx:ASPxGridView>
     <dx:ASPxGlobalEvents ID="ge" runat="server">
      <ClientSideEvents ControlsInitialized="OnControlsInitialized" />
    </dx:ASPxGlobalEvents>
   <dx:ASPxHiddenField runat="server" ClientInstanceName="hf" ID="hf"> </dx:ASPxHiddenField>
     </div>
   </div>
     </div>
   </div>
   </div>
   <div style="width: 100%; overflow: auto">   <pFM:PopupFM runat="server" ID="popFM"></pFM:PopupFM>   </div>
   <div style="display: none">
       <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
    <ContentTemplate>
      <a href="#" id="refresh" runat="server" onserverclick="btnNapLai_Click"></a>
       <a href="#" id="xoa" runat="server" onserverclick="Xoa_Click"></a>
    <a href="#" id="confirmxoa" runat="server" onserverclick="ConfirmXoa_Click"></a>
    <a href="#" id="clone" runat="server" onserverclick="Clone_Click"></a>
       </ContentTemplate>
   </asp:UpdatePanel>
    </div>
    </div>
   </asp:Content>
