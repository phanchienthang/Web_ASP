<%@ page language="C#" masterpagefile="~/AdminTool/MP.master" autoeventwireup="true" inherits="DanhSachManufacture, App_Web_o1yggtw0" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
 <%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxLoadingPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>
      <%@ Register Src="~/UserControls/PopupFM.ascx" TagName="PopupFM" TagPrefix="pFM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script language="javascript" type="text/javascript" async>
 var delID = "<%= xoa.ClientID %>";
  var ID_Form = "<%= Utils.GetID_Form(this.Page) %>";
   var refresh = "<%= refresh.ClientID %>";
var cloneID = "<%= clone.ClientID %>";
   function confirmClone() {
  if (grvManufacture.GetFocusedRowIndex() >= 0) {
   lp.Show();
    confirmA('Bạn có chắc chắn nhân bản manufacture đang chọn ?', DoClone);
   }
   else {
       alertTB('Bạn vui lòng chọn manufacture để nhân bản !');
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
<script type="text/javascript" src="js/gen/Manufacture.js?ver=12" async></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" Runat="Server">
<div class="divMain">
<dx:ASPxLoadingPanel ID="lp" Modal="true" Text="Đang nạp dữ liệu" ClientInstanceName="lp" runat="server"></dx:ASPxLoadingPanel>

     <div class="row"  id="contentMain">
 <div class="box col-md-12">
   <div class="box-inner">
     <div class="box-header well" data-original-title="">
      <h2>
        <i class="icon-th"></i>Manufacture</h2>
     <div class="box-icon">
    <a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>
     </div>
  </div>
   <div class="box-content">
   <div class="row-fluid">
              <div class="btn StyleButton_menu">
                 <div class="button">
              <a class="btn btn-success" onclick="ThemManufacture()" href="#">
     <i class="glyphicon glyphicon-plus-sign white"></i><span class="text_hidden">Thêm</span></a>
        </div>
        </div>
        </div>
  <asp:ObjectDataSource ID="dsManufacture" runat="server"
   SelectMethod="getDataTable_My" TypeName="Library.Business.Cls_Manufacture"> </asp:ObjectDataSource>
    <dx:ASPxGridView ID="grvManufacture" DataSourceID="dsManufacture" OnRowUpdating="grid_RowUpdating" OnCustomJSProperties="ASPxGridView_CustomJSProperties" KeyFieldName="ID_Manufacture" runat="server" EnableViewState="false" CssClass="bgGridview" Paddings-PaddingLeft="0" RenderMode="Lightweight" ClientInstanceName="grvManufacture"  OnCustomCallback="ASPxGridView_CustomCallback" AutoGenerateColumns="False" Width="100%">
        <Columns>
 <dx:GridViewDataTextColumn EditFormSettings-Visible="False" Name="Edit" Caption="" Width="200px"  >
       <DataItemTemplate>
         <a class="btn btn-info" onclick="confirmClone()"
             href="#"><i class="glyphicon glyphicon-plus-sign white"></i><span class="text_hidden">Nhân bản</span></a>
         <a class="btn btn-info" onclick="ChiTietManufacture('<%# Eval("ID_Manufacture") %>')"
             href="#"><i class="glyphicon glyphicon-edit white"></i><span class="text_hidden">Sửa</span>
          </a><a class="btn btn-danger" onclick="confirmDelete()" href="#"><i class="glyphicon glyphicon-trash white">
           </i><span class="text_hidden">Xóa</span></a>
         </DataItemTemplate>
     </dx:GridViewDataTextColumn>
      <dx:GridViewDataColumn Name="ID_Manufacture" FieldName="ID_Manufacture" ReadOnly="true" Caption="ID_Manufacture" Visible="False" />
      <dx:GridViewDataColumn Name="ManufactureName"  FieldName="ManufactureName" Settings-AutoFilterCondition="Contains" Caption="ManufactureName" Width="250px" />
      <dx:GridViewDataColumn EditFormSettings-Visible="False" Name="AddTime"  FieldName="AddTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm đăng" Width="120px" />
      <dx:GridViewDataColumn EditFormSettings-Visible="False" Name="EditTime"  FieldName="EditTime" Settings-AutoFilterCondition="Contains" Caption="Thời điểm sửa" Width="110px" />
    </Columns>
   <SettingsEditing Mode="Batch" BatchEditSettings-ShowConfirmOnLosingChanges="true" BatchEditSettings-EditMode="Cell" BatchEditSettings-StartEditAction="Click" />
                      <SettingsText  CommandBatchEditCancel="Hủy" CommandBatchEditUpdate="Lưu thay đổi" />
    <Templates>
                 <DetailRow>
                   <div class="content_grv">
               <div class="grv_images">
                <img src="/<%# Eval("Logo")%>?v=18" />
           </div>
          <div class="grv_contain">
     <b>ManufactureName</b> : <%# Eval("ManufactureName")%><br>
     <b>Thời điểm đăng</b> : <%# Eval("AddTime")%><br>
     <b>Thời điểm sửa</b> : <%# Eval("EditTime")%><br>
     </div>
    </div>
    </DetailRow>
       </Templates>
     <SettingsDetail ShowDetailRow="true" />
       <SettingsText HeaderFilterShowAll="Tất cả"/>
       <Settings ShowGroupPanel="False" ShowFilterRow="true" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
       <SettingsBehavior AutoExpandAllGroups="true" AllowFocusedRow="true" AutoFilterRowInputDelay="3000" ColumnResizeMode="Control" />
      <ClientSideEvents RowDblClick="function(s, e) { OnGridDoubleClick(s.GetRowKey(e.visibleIndex));}" Init="OnInit" EndCallback="OnEndCallback" />
       <SettingsPager Mode="ShowAllRecords"> </SettingsPager>
       <SettingsLoadingPanel Text="Đang nạp dữ liệu" />
     </dx:ASPxGridView>
     <dx:ASPxGlobalEvents ID="ge" runat="server">
      <ClientSideEvents ControlsInitialized="OnControlsInitialized" />
    </dx:ASPxGlobalEvents>
   <dx:ASPxHiddenField runat="server" ClientInstanceName="hf" ID="hf"> </dx:ASPxHiddenField>
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
    <a href="#" id="clone" runat="server" onserverclick="Clone_Click"></a>
       </ContentTemplate>
   </asp:UpdatePanel>
    </div>
    </div>
   </asp:Content>
