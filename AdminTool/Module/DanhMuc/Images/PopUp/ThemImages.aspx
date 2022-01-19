<%@ page language="C#" masterpagefile="~/AdminTool/Master.master" autoeventwireup="true" inherits="ThemImages, App_Web_p0yzl3jo" title="Untitled Page" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script language="javascript" type="text/javascript">
 function CheckNull() {
        if (txtProducts.GetSelectedIndex() < 0) {
    alertN( 'ID_Product không được rỗng!',  function() { txtProducts.SetFocus(true); });
     return false;
   }
 if(txtImage.GetValue() != null && !isValid(txtImage.GetValue())){
       alertN( 'Hình ảnh không được chứa ký tự đặc biệt!',  function() { txtImage.SetFocus(true); });
     return false;
 }
 if(txtAlt.GetValue() != null && !isValid(txtAlt.GetValue())){
       alertN( 'Mô tả ảnh không được chứa ký tự đặc biệt!',  function() { txtAlt.SetFocus(true); });
     return false;
 }
 if(txtDescription.GetValue() != null && !isValid(txtDescription.GetValue())){
       alertN( 'Mô tả không được chứa ký tự đặc biệt!',  function() { txtDescription.SetFocus(true); });
     return false;
 }
 return true;
  }
 var cfheight = 140;
 var cfwidth = 140;
       var checkTextBox="";
  function fileSelectChanged(s,e) {
   var file = e.file;
  if(file) {
   var name=file.GetFullName();
  tbFileName.SetText(name.replace(/\\/g, "/"));
  }
  }
  function setPictureLink(link){
 if(checkTextBox=='ID_Image'){
    txtID_Image.SetText(link);
  return;
 }
 if(checkTextBox=='Image'){
    txtImage.SetText(link);
  return;
 }
 var InputText = document.getElementById(checkTextBox);
   if (InputText)
   {
      InputText.value = link;
  }
  }
  function showSaveAsDialog(check) {
  checkTextBox=check;
   var h = window.innerHeight ;
   var w = window.innerWidth - 20;
   if (w > 800)
   {
      w = 800;
  }
   if (h > 550)
   {
      h = 550;
     }
    window.parent.pcSaveAs.SetContentUrl("Module/FileManagerCrop.aspx?height=" + cfheight + "&width=" + cfwidth + "&module=tbImages");
   window.parent.pcSaveAs.SetSize(w, h);
   window.parent.pcSaveAs.Show();
  }
 function setHeightFrame(height) {
 if ($('.form_add')) {
    $('.form_add').css({ "border": '1px solid #ccc', "overflow-x": 'auto', "height": height });
 }
  }
  function isChanged() {
 return isFormChanged();
 }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" Runat="Server">
<div class="container">
    <div class="row">
    <div class="box-content">
    <div class="row-fluid">
<div class="btn StyleButton_menu">
    <div  class="button">
     <asp:UpdatePanel runat="server" ID="UpdatePanel_Luu" UpdateMode="Conditional">
        <ContentTemplate>
       <dx:ASPxButton ID="btnLuu" runat="server" UseSubmitBehavior="false" AutoPostBack="false" ClientInstanceName="btnLuu"
 Text="Lưu"  ClientSideEvents-Click="function(s, e) {e.processOnServer = CheckNull(); }" OnClick="btnLuu_Click"/>
        </ContentTemplate>
       </asp:UpdatePanel>
        </div>
    <div  class="button">
     <asp:UpdatePanel runat="server" ID="UpdatePanel_LuuThem" UpdateMode="Conditional">
        <ContentTemplate>
       <dx:ASPxButton ID="btnLuuThem" runat="server" UseSubmitBehavior="false" AutoPostBack="false" ClientInstanceName="btnLuuThem"
 Text="Lưu và thêm mới" EnableClientSideAPI="True" OnClick="btnLuuThem_Click"  ClientSideEvents-Click="function(s, e) {e.processOnServer = CheckNull(); }" />
        </ContentTemplate>
       </asp:UpdatePanel>
        </div>
    <div  class="button">
     <asp:UpdatePanel runat="server" ID="UpdatePanel_Sua" UpdateMode="Conditional">
        <ContentTemplate>
       <dx:ASPxButton ID="btnSua" runat="server" UseSubmitBehavior="false" AutoPostBack="false" ClientInstanceName="btnSua"
 Text="Sửa" ClientEnabled="false" EnableClientSideAPI="True" OnClick="btnSua_Click"  />
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
     <%-- <%= Utils.getLabelControlAdmin(1,ID_Form,true,"Images_ID_Product","")%>--%>
   <div class="controls">
          <asp:SqlDataSource ID="dsProducts" runat="server" EnableCaching="false" />
                            <dx:ASPxComboBox ID="txtProducts" OnLoad="OnComboBoxLoad" DataSourceID="dsProducts" TextField="ProductName"  ValueField="ID_Product" runat="server" ClientInstanceName="txtProducts" AutoPostBack="false"
        ValueType="System.String" TextFormatString="{1}" IncrementalFilteringMode="Contains" DropDownWidth="183" DropDownHeight="200" DropDownStyle="DropDownList" Width="100%">
  <ClientSideEvents EndCallback="function(s,e){txtProducts.SetSelectedIndex(txtProducts.GetItemCount()-1); }" /> </dx:ASPxComboBox> 
    </div>
     </div>
       <div class="control-group">
 <%--<%= Utils.getLabelControlAdmin(2,ID_Form,true,"Images_Image","showSaveAsDialog('Image');")%>--%>
   <div class="controls">
                            <dx:ASPxTextBox ID="txtImage" runat="server" ClientInstanceName="txtImage" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
    </div>
     </div>
       <div class="control-group">
    <%--  <%= Utils.getLabelControlAdmin(1,ID_Form,true,"Images_Alt","")%>--%>
   <div class="controls">
                            <dx:ASPxTextBox ID="txtAlt" runat="server" ClientInstanceName="txtAlt" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
    </div>
     </div>
       <div class="control-group">
      <%--<%= Utils.getLabelControlAdmin(1,ID_Form,true,"Images_Description","")%>--%>
   <div class="controls">
                            <dx:ASPxTextBox ID="txtDescription" runat="server" ClientInstanceName="txtDescription" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
    </div>
     </div>
  </fieldset>
    </form>
    </div>
        </div>
   <asp:hiddenfield id="hf" value="" runat="server"/>
        </div>
     </div>
    </div>
    </div>
  </asp:Content>
