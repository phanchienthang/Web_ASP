<%@ page language="C#" masterpagefile="~/AdminTool/Master.master" autoeventwireup="true" inherits="ThemManufacture, App_Web_3hujyfwr" title="Untitled Page" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script language="javascript" type="text/javascript">
 function CheckNull() {
 if(txtManufactureName.GetValue() != null && !isValid(txtManufactureName.GetValue())){
       alertN( 'ManufactureName không được chứa ký tự đặc biệt!',  function() { txtManufactureName.SetFocus(true); });
     return false;
 }
 if(txtLogo.GetValue() != null && !isValid(txtLogo.GetValue())){
       alertN( 'Logo không được chứa ký tự đặc biệt!',  function() { txtLogo.SetFocus(true); });
     return false;
 }
 return true;
  }
//      var cfheight = "<%= Utils.GetCacheValue("minheight_tbManufacture") %>";
 //  var cfwidth = "<%= Utils.GetCacheValue("minwidth_tbManufacture") %>";
       var checkTextBox="";
  function fileSelectChanged(s,e) {
   var file = e.file;
  if(file) {
   var name=file.GetFullName();
  tbFileName.SetText(name.replace(/\\/g, "/"));
  }
  }
  function setPictureLink(link){
 if(checkTextBox=='Logo'){
    txtLogo.SetText(link);
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
    window.parent.pcSaveAs.SetContentUrl("Module/FileManagerCrop.aspx?height=" + cfheight + "&width=" + cfwidth + "&module=tbManufacture");
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
      <%--<%= Utils.getLabelControlAdmin(1,ID_Form,true,"Manufacture_ManufactureName","")%>--%>
   <div class="controls">
                            <dx:ASPxTextBox ID="txtManufactureName" runat="server" ClientInstanceName="txtManufactureName" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
    </div>
     </div>
       <div class="control-group">
 <%--<%= Utils.getLabelControlAdmin(2,ID_Form,true,"Manufacture_Logo","showSaveAsDialog('Logo');")%>--%>
   <div class="controls">
                            <dx:ASPxTextBox ID="txtLogo" runat="server" ClientInstanceName="txtLogo" CssClass="InputText" Width="100%"></dx:ASPxTextBox>
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
