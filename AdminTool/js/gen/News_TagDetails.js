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
     p1.SetContentUrl('Module/DanhMuc/News_TagDetails/PopUp/ThemNews_TagDetails.aspx?isNew=0&double=1&id=' + values +'&ID_Form='+ID_Form);
    p1.SetSize(550,237);
     lblTitle.SetText('Chi Tiết News_TagDetails');
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
   if (grvNews_TagDetails.GetFocusedRowIndex() >= 0) {
     lp.Show();
     confirmA('Bạn có chắc chắn xóa những thông tin đã được đánh dấu ?', DoDelete);
  }
  else {
    alertTB('Bạn vui lòng chọn news_tagdetails để xóa !');
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
  function ThemNews_TagDetails() {
   FirstLoading = true;
   p1.SetContentUrl('Module/DanhMuc/News_TagDetails/PopUp/ThemNews_TagDetails.aspx?isNew=1&double=0&ID_Form='+ID_Form);
    p1.SetSize(550,237);
  lblTitle.SetText('Thêm News_TagDetails');
  p1.Show();
  }
 function ChiTietNews_TagDetails() {
   if (grvNews_TagDetails.GetFocusedRowIndex() >= 0) {
       FirstLoading = true;
    p1.SetContentUrl('Module/DanhMuc/News_TagDetails/PopUp/ThemNews_TagDetails.aspx?isNew=0&double=0&ID_Form='+ID_Form);
    p1.SetSize(550,237);
    lblTitle.SetText('Chi Tiết News_TagDetails');
     p1.Show();
     }
  else {
       alertTB('Vui lòng chọn news_tagdetails để xem chi tiết!');
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
       grvNews_TagDetails.SetHeight(h - 30);
       grvNews_Tags.SetHeight(h - 30);
   }
  function AdjustSize_click() {
     var h = CheckNameClass_click("contentMain");
   grvNews_TagDetails.SetHeight(h - 30);
       grvNews_Tags.SetHeight(h - 30);
 }
