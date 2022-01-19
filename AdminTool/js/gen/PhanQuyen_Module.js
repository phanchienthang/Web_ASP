 var FirstLoading = true;
 var checkRefresh = false;
 var iframe;
  function OnPopupInit(s, e) {
  iframe = p1.GetContentIFrame();
 ASPxClientUtils.AttachEventToElement(iframe, 'load', OnContentLoaded);
 }
  function OnPopupShown(s, e) {
  if (FirstLoading)
       lp.ShowInElement(iframe);
  }
 function OnContentLoaded(e) {
     FirstLoading = false;
    lp.Hide();
 }
 function OnGridDoubleClick(values) {
     if (values != null || values != "") {
    FirstLoading = true;
     p1.SetContentUrl('Module/DanhMuc/PhanQuyen_Module/PopUp/ThemPhanQuyen_Module.aspx?isNew=0&double=1&id=' + values +'&ID_Form='+ID_Form);
    p1.SetSize(550,208);
     lblTitle.SetText('Chi Tiết phanquyen_module');
    p1.Show();
  }
 }
 window.onload = function () {
    GetSubTabIndex();
  displayHeight125("contentMain");
 }
 function Refresh() {
   btnNapLai.DoClick();
 }
 function confirmDelete() {
   if (grvPhanQuyen_Module.GetFocusedRowIndex() >= 0) {
     lp.Show();
     confirmA('Bạn có chắc chắn xóa những thông tin đã được đánh dấu ?', DoDelete);
  }
  else {
    alertTB('Bạn vui lòng chọn phanquyen_module để xóa !');
   }
 }
  function DoDelete(btnVal) {
   if (btnVal == "Có") {
     var bt = document.getElementById(delID);
    if (bt) {
       bt.click();
    }
  } else {
       lp.Hide();
  }
 }
     function setCheckRefresh(check) {
  checkRefresh = check;
  }
 function getCheckRefresh() {
    return checkRefresh;
 }
    function ThongBaoStyles_Thoat() 
   {
  var wiz = p1.GetContentIFrameWindow();
  if (wiz.btnLuu){
       if (wiz.btnLuu.GetEnabled()) {
      confirmMessage('ExitChangeData', 'Dữ liệu thay đổi chưa lưu.\r Nếu thoát sẽ mất toàn bộ dữ liệu?', XuLyThoat);
   } else {
     XuLyThoat('Có');
   }
   } else {
  XuLyThoat('Có');
   } 
  }
 function XuLyThoat(btnval) {
  if (btnval == 'Có') {
    if (checkRefresh) {
    Refresh();
     setCheckRefresh(false); }
   p1.SetContentUrl('about:blank');
    p1.Hide();
   }
  }
  function ThemPhanQuyen_Module() {
   FirstLoading = true;
   p1.SetContentUrl('Module/DanhMuc/PhanQuyen_Module/PopUp/ThemPhanQuyen_Module.aspx?isNew=1&double=0&ID_Form='+ID_Form);
    p1.SetSize(550,208);
  lblTitle.SetText('Thêm phanquyen_module');
  p1.Show();
  }
 function ChiTietPhanQuyen_Module() {
   if (grvPhanQuyen_Module.GetFocusedRowIndex() >= 0) {
       FirstLoading = true;
    p1.SetContentUrl('Module/DanhMuc/PhanQuyen_Module/PopUp/ThemPhanQuyen_Module.aspx?isNew=0&double=0&ID_Form='+ID_Form);
    p1.SetSize(550,208);
    lblTitle.SetText('Chi Tiết phanquyen_module');
     p1.Show();
     }
  else {
       alertTB('Vui lòng chọn phanquyen_module để xem chi tiết!');
  }
  }
    function OnInit(s, e) {
   AdjustSize();
  }
  function OnEndCallback(s, e) {
     AdjustSize();
  }
  function OnControlsInitialized(s, e) {
   ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
        AdjustSize();
   });
  }
   function AdjustSize() {
      var h = CheckNameClass("contentMain");
       grvPhanQuyen_Module.SetHeight(h - 30);
   }
  function AdjustSize_click() {
     var h = CheckNameClass_click("contentMain");
   grvPhanQuyen_Module.SetHeight(h - 30);
 }
