<%@ page language="C#" masterpagefile="~/AdminTool/MP.master" autoeventwireup="true" inherits="DanhSachImages, App_Web_q0p4mvxq" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>
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
  if (grvImages.GetFocusedRowIndex() >= 0) {
   lp.Show();
    confirmA('Bạn có chắc chắn nhân bản images đang chọn ?', DoClone);
   }
   else {
       alertTB('Bạn vui lòng chọn images để nhân bản !');
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
<script type="text/javascript" src="js/gen/Images.js?ver=12" async></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" Runat="Server">
<div class="divMain">
<dx:ASPxLoadingPanel ID="lp" Modal="true" Text="Đang nạp dữ liệu" ClientInstanceName="lp" runat="server"></dx:ASPxLoadingPanel>

  <div id="contentMain" class="row">
 <div class="box col-md-3 space-right">
  <div class="box-inner">
 <div class="box-header well" data-original-title="">
    <h2>Products</h2>
  <div class="box-icon">
  <a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>
  </div>
 </div>
 <div class="box-content">
    <div class="row-fluid">
   <div class="btn">&nbsp;</div>
 </div>
    <div class="row-fluid">
 <asp:ObjectDataSource ID="dsProducts" runat="server" OnSelecting="dsProducts_Selecting"
        SelectMethod="getDataTable_LikeKey" TypeName="Library.Business.Cls_Products" />
    <dx:ASPxGridView ID="grvProducts" DataSourceID="dsProducts" KeyFieldName="ID_Product"  EnableViewState="false" runat="server" CssClass="bgGridview" Paddings-PaddingLeft="0" RenderMode="Lightweight" ClientInstanceName="grvProducts"  AutoGenerateColumns="False" Width="100%">
   <SettingsLoadingPanel Text="Đang nạp dữ liệu" />
      <Styles>
        <Header CssClass="Head_dev" Font-Bold="True"> </Header>
     <GroupRow CssClass="GroupRow_dev"> </GroupRow>
      <FocusedGroupRow CssClass="FocusedGroupRow_dev"></FocusedGroupRow>
      <Row CssClass="Row_dev" Wrap="True"></Row>
    </Styles>
  <ClientSideEvents Init="OnInit" EndCallback="OnEndCallback"
    FocusedRowChanged="function(s, e) {  checkFocus=true;   var w = window.innerWidth; if (hf.Get('Width') != undefined || w < 800) {  if (hf.Get('Width') != w) { hf.Set('Width', w); } grvImages.Refresh(); }else{ hf.Set('Width', w); } e.processOnServer = false;}" />
        <Columns>
      <dx:GridViewDataColumn Name="ID_Product" FieldName="ID_Product" ReadOnly="true" Caption="ID_Product" Visible="False" />
      <dx:GridViewDataColumn FieldName="CatalogName" Caption="Thuộc danh mục sản phẩm" GroupIndex="0" Width="230px" />
      <dx:GridViewDataColumn FieldName="ManufactureName" Caption="ID_Manufacture" GroupIndex="0" Width="140px" />
      <dx:GridViewDataColumn FieldName="ProductName" Settings-AutoFilterCondition="Contains" Caption="Tên sản phẩm" Width="300px" />
      <dx:GridViewDataColumn FieldName="ProductCode" Settings-AutoFilterCondition="Contains" Caption="Mã code sản phẩm" Width="300px" />
      <dx:GridViewDataColumn FieldName="Description" Settings-AutoFilterCondition="Contains" Caption="Mô tả" Width="300px" />
      <dx:GridViewDataColumn FieldName="ProductPrice" Settings-AutoFilterCondition="Contains" Caption="ProductPrice" Width="300px" />
      <dx:GridViewDataColumn FieldName="Price" Settings-AutoFilterCondition="Contains" Caption="Giá" Width="300px" />
      <dx:GridViewDataColumn FieldName="Sale" Settings-AutoFilterCondition="Contains" Caption="Sale" Width="300px" />
      <dx:GridViewDataColumn FieldName="ProductionDate" Settings-AutoFilterCondition="Contains" Caption="ProductionDate" Width="140px" />
      <dx:GridViewDataColumn FieldName="ExpireDate" Settings-AutoFilterCondition="Contains" Caption="ExpireDate" Width="100px" />
      <dx:GridViewDataColumn FieldName="CurrencyUnit" Settings-AutoFilterCondition="Contains" Caption="CurrencyUnit" Width="300px" />
      <dx:GridViewDataColumn FieldName="Unit" Settings-AutoFilterCondition="Contains" Caption="Unit" Width="300px" />
      <dx:GridViewDataColumn FieldName="AddTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm đăng" Width="140px" />
      <dx:GridViewDataColumn FieldName="EditTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm sửa" Width="130px" />
      <dx:GridViewDataColumn FieldName="Status" Settings-AutoFilterCondition="Contains" Caption="Tình trạng" Width="300px" />
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
  <div id="Images" class="box col-md-9">
  <div class="box-inner">
 <div class="box-header well" data-original-title="">
    <h2>Images</h2>
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
           <a class="btn btn-success" onclick="ThemImages()" href="#">
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
   <asp:ObjectDataSource ID="dsImages" runat="server" OnSelecting="dsImages_Selecting" 
             SelectMethod="getDataTable_With_ID_Product" TypeName="Library.Business.Cls_Images">
 <SelectParameters>
    <asp:SessionParameter Name="ID_Product" SessionField="ID_Product" Type="Int32" />
  </SelectParameters>
  </asp:ObjectDataSource>
    <dx:ASPxGridView ID="grvImages" KeyFieldName="ID_Image" OnRowUpdating="grid_RowUpdating" OnCustomJSProperties="ASPxGridView_CustomJSProperties" OnBeforePerformDataSelect="grvImages_BeforePerformDataSelect" runat="server" DataSourceID="dsImages" EnableViewState="false" CssClass="bgGridview" Paddings-PaddingLeft="0" RenderMode="Lightweight" ClientInstanceName="grvImages"  OnCustomCallback="ASPxGridView_CustomCallback" AutoGenerateColumns="False" Width="100%">
   <SettingsLoadingPanel Text="Đang nạp dữ liệu" />
      <Styles>
        <Header CssClass="Head_dev" Font-Bold="True"> </Header>
     <GroupRow CssClass="GroupRow_dev"> </GroupRow>
      <FocusedGroupRow CssClass="FocusedGroupRow_dev"></FocusedGroupRow>
      <Row CssClass="Row_dev" Wrap="True"></Row>
    </Styles>
  <ClientSideEvents RowDblClick="function(s, e) {OnGridDoubleClick(s.GetRowKey(e.visibleIndex));}" 
    EndCallback="function(s, e) { if (s.cpUpdate) {alertU();} lp.Hide();if(checkFocus){ checkFocus=false;  gotoGrid(); if(grvImages.GetPageIndex()!=0){ grvImages.GotoPage(0);}  grvImages.SetFocusedRowIndex(0); } OnEndCallback();}" />
        <Columns>
 <dx:GridViewCommandColumn Name="Select"  ShowSelectCheckbox="True" ShowClearFilterButton="true"
   Width="45" MinWidth="45" SelectAllCheckboxMode="Page"> </dx:GridViewCommandColumn>
 <dx:GridViewDataTextColumn EditFormSettings-Visible="False" Name="Edit" Caption="" Width="130px"  >
       <DataItemTemplate>
         <a class="btn btn-info" onclick="confirmClone()"
             href="#"><i class="glyphicon glyphicon-plus-sign white"></i><span class="text_hidden">Nhân bản</span></a>
         <a class="btn btn-info" onclick="ChiTietImages('<%# Eval("ID_Image") %>')"
             href="#"><i class="glyphicon glyphicon-edit white"></i><span class="text_hidden">Sửa</span></a>
         </DataItemTemplate>
     </dx:GridViewDataTextColumn>
      <dx:GridViewDataColumn Name="ID_Image" FieldName="ID_Image" ReadOnly="true" Caption="ID_Image" Visible="False" />
      <dx:GridViewDataColumn Name="Alt"  FieldName="Alt" Settings-AutoFilterCondition="Contains" Caption="Mô tả ảnh" Width="250px" />
      <dx:GridViewDataColumn Name="Description"  FieldName="Description" Settings-AutoFilterCondition="Contains" Caption="Mô tả" Width="250px" />
    </Columns>
   <SettingsEditing Mode="Batch" BatchEditSettings-ShowConfirmOnLosingChanges="true" BatchEditSettings-EditMode="Cell" BatchEditSettings-StartEditAction="Click" />
                      <SettingsText  CommandBatchEditCancel="Hủy" CommandBatchEditUpdate="Lưu thay đổi" />
    <Templates>
                 <DetailRow>
                   <div class="content_grv">
               <div class="grv_images">
                <img src="/<%# Eval("ID_Image")%>?v=18" />
                <img src="/<%# Eval("Image")%>?v=18" />
           </div>
          <div class="grv_contain">
     <b>Mô tả ảnh</b> : <%# Eval("Alt")%><br>
     <b>Mô tả</b> : <%# Eval("Description")%><br>
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
