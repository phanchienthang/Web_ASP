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
     p1.SetContentUrl('Module/DanhMuc/PhanQuyen_Form/PopUp/ThemPhanQuyen_Form.aspx?isNew=0&double=1&id=' + values +'&ID_Form='+ID_Form);
    p1.SetSize(800,550);
     lblTitle.SetText('Chi Tiết phanquyen_form');
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
   if (grvPhanQuyen_Form.GetFocusedRowIndex() >= 0) {
     lp.Show();
     confirmA('Bạn có chắc chắn xóa những thông tin đã được đánh dấu ?', DoDelete);
  }
  else {
    alertTB('Bạn vui lòng chọn phanquyen_form để xóa !');
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
  function ThemPhanQuyen_Form() {
   var c = treeList.GetVisibleNodeKeys().length;
   var key = treeList.GetFocusedNodeKey();
  if ((ID_Module != '0' && ID_Module != 'All')||(c==0)) {
    FirstLoading = true;
    if (c == 0) {
     key = '';
  }
   p1.SetContentUrl('Module/DanhMuc/PhanQuyen_Form/PopUp/ThemPhanQuyen_Form.aspx?isNew=1&double=0&ID_Form='+ID_Form+'&ID_Module=' + key);
    p1.SetSize(800,550);
  lblTitle.SetText('Thêm phanquyen_form');
  p1.Show();
  }
  else {
     StylesMsg('warning', 'Vui lòng chọn phanquyen_module!');
  }
  }
 function ChiTietPhanQuyen_Form() {
   if (grvPhanQuyen_Form.GetFocusedRowIndex() >= 0) {
       FirstLoading = true;
    p1.SetContentUrl('Module/DanhMuc/PhanQuyen_Form/PopUp/ThemPhanQuyen_Form.aspx?isNew=0&double=0&ID_Form='+ID_Form);
    p1.SetSize(800,550);
    lblTitle.SetText('Chi Tiết phanquyen_form');
     p1.Show();
     }
  else {
       alertTB('Vui lòng chọn phanquyen_form để xem chi tiết!');
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
       grvPhanQuyen_Form.SetHeight(h - 30);
       treeList.SetHeight(h - 30);
     document.getElementById("contentMain1").style.height = (h - 31) + "px";
   document.getElementById("contentMain1").style.maxHeight = (h - 31) + "px";
     document.getElementById("contentMain1").style.minHeight = (h - 31) + "px";
   }
  function AdjustSize_click() {
     var h = CheckNameClass_click("contentMain");
   grvPhanQuyen_Form.SetHeight(h - 30);
       treeList.SetHeight(h - 30);
     document.getElementById("contentMain1").style.height = (h - 31) + "px";
   document.getElementById("contentMain1").style.maxHeight = (h - 31) + "px";
     document.getElementById("contentMain1").style.minHeight = (h - 31) + "px";
 }
var checkFocus = false;
   function OnGridFocusedRowChanged() {
     if (grvPhanQuyen_Form.GetFocusedRowIndex() >= 0 ||   document.getElementById("Fieldset1")) {
    ClientContactDetailsPanel.PerformCallback();
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
      window.setTimeout(function() { UpdatePopupPosition(); }, 0);
      imageSlider.SetActiveItem(imageSliderItem, true);
       UpdateText();
        }
      var name = '';
     function callback_funcThongBaoXoaHinhAnh(btnval) {
         if (btnval == 'Có')
             ClientContactDetailsPanel.PerformCallback('PhanQuyen_Form'+name);
     }
     function OnDelete(names) {
        confirmA('Bạn có chắc chắn xóa hình ảnh của phanquyen_form này không!', callback_funcThongBaoXoaHinhAnh);
        name = names;
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
      function alertDeleteNHH() {
        if (treeList.GetFocusedNodeKey() != "") {
           if (ID_Module != "0") {
               if (confirm('Bạn có chắc chắn xóa phanquyen_module đã chọn có mã ' + ID_Module + ' ?')) {
                  lp.Show();
                  return true;
             }
             else
                return false;
           }
          else {
               StylesMsg('warning', 'Vui lòng chọn phanquyen_module để xóa!');
               return false;
           }
       }
      }
      function clickButton(e, buttonid) {
        var evt = e ? e : window.event;
         var bt = document.getElementById(buttonid);
         if (bt) {
            if (evt.keyCode == 13) {
                bt.click();
               return false;
          }
       }
      }
