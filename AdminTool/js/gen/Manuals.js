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
   if (p1.GetContentIFrameWindow().btnLuu)
    {
    var col_h = CalculateSize_Content();
     p1.GetContentIFrameWindow().setHeightFrame(col_h);
 }
 }
 function OnGridDoubleClick(values) {
     if (values != null || values != "") {
    FirstLoading = true;
     p1.SetContentUrl('Module/DanhMuc/Manuals/PopUp/ThemManuals.aspx?isNew=0&double=1&id=' + values +'&ID_Form='+ID_Form);
     lblTitle.SetText('Chi Tiết Bài Viết HDSD');
  ShowPopup();
  }
 }
 function Refresh() {
 var bt = document.getElementById(refresh); 
    if (bt) { 
   bt.click();
     }
 }
 function confirmDelete() {
   lp.Show();
        var i = grvManuals.GetSelectedRowCount();
  if (i == 0)
  {
     alertTB('Bạn vui lòng chọn bài viết hdsd để xóa!');
     lp.Hide();
   } else
   {
      if (i == 1)
     {
         confirmA('Bạn có chắc chắn muốn xóa bài viết hdsd này không ?', DoDelete);
     }
     else
    {
      confirmA('Bạn có chắc chắn muốn xóa những bài viết hdsd này không?',DoDelete);
    }
   }
 }
  function DoDelete(btnVal) {
   if (btnVal == "Có") {
     var bt = document.getElementById(delID);
    if (bt) {
       bt.click();
    }
  } else {
       grvManuals.UnselectAllRowsOnPage();
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
   if (wiz.isChanged() && wiz.btnLuuThem && wiz.btnLuuThem.GetEnabled()) {
     confirmMessage('ExitChangeData', 'Dữ liệu thay đổi chưa lưu.\r Nếu thoát sẽ mất toàn bộ dữ liệu?', XuLyThoat);
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
  function ThemManuals() {
   var c = treeList.GetVisibleNodeKeys().length;
   var key = treeList.GetFocusedNodeKey();
  if ((ID_Manual_Group != '0' && ID_Manual_Group != 'All')||(c==0)) {
    FirstLoading = true;
    if (c == 0) {
     key = '';
  }
   FirstLoading = true;
   p1.SetContentUrl('Module/DanhMuc/Manuals/PopUp/ThemManuals.aspx?isNew=1&double=0&ID_Form='+ID_Form+'&ID_Manual_Group=' + key);
  lblTitle.SetText('Thêm Bài Viết HDSD');
  ShowPopup();
  }
  else {
     StylesMsg('warning', 'Vui lòng chọn nhóm bài viết hdsd!');
  }
  }
 function ChiTietManuals(values) {
    if (values != null || values != "")  {
       FirstLoading = true;
    p1.SetContentUrl('Module/DanhMuc/Manuals/PopUp/ThemManuals.aspx?isNew=0&double=0&id=' + values + '&ID_Form='+ID_Form);
    lblTitle.SetText('Chi Tiết Bài Viết HDSD');
      ShowPopup();
     }
  }
    function ShowPopup() {
 var width = window.innerWidth - 20;
 var height = window.innerHeight - 20;
 var checkp = false;
 if (width > 800) {
     width = 800;
     checkp = true;
  }
 if (height > 550) {
     height = 550;
 }
      p1.SetSize(width, height);
 if (checkp == false) {
    p1.ShowAtPos(50, 50);
  } else {
      p1.Show();
  }
}
        function CollapsePopup() {
  p1.SetCollapsed(!p1.GetCollapsed());
  }
 function MinMaxPopup() {
    p1.SetMaximized(!p1.GetMaximized());
 }
    function OnInit(s, e) {
   AdjustSize();
   var key = treeList.GetFocusedNodeKey();
   ID_Manual_Group = key;
  }
  function OnEndCallback(s, e) {
  }
  function OnControlsInitialized(s, e) {
   ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
        AdjustSize();
     CalculateSize();
   });
  }
   function AdjustSize() {
      var h = CheckNameClass("contentMain");
   var w = window.innerWidth;
       grvManuals.SetHeight(h);
       treeList.SetHeight(h-7);
    if (p1.GetContentIFrameWindow().btnLuu)
    {
      var col_h = CalculateSize_Content();
      p1.GetContentIFrameWindow().setHeightFrame(col_h);
  }
  if (hf.Get("Width") != undefined || w < 800)
  {
  if (hf.Get("Width") != w)
  {
     hf.Set("Width", w);
     grvManuals.PerformCallback();
  }
  }
   }
        function CalculateSize_Content() {
   var ht = CalculateSize();
   return ht - 60 - 46;
  }
  function CalculateSize() {
 width = window.innerWidth - 20;
  height = window.innerHeight - 20;
  var checkp = false;
  if (width > 800) {
      width = 800;
      checkp = true;
 }
  if (height > 550) {
       height = 550;
   }
  var checkHide = false;
   if (checkp == false) {
      var oldw = p1.GetWidth();
      var oldh = p1.GetHeight();
     if (oldw >= 800) {
         checkHide = true;
     }
    if (height < 240) {
        height = oldh;
    }
  }
  p1.SetSize(width, height);
  if (checkHide && p1.GetVisible() == true) {
      p1.Hide();
     p1.ShowAtPos(50, 50);
 }
 return height;
}
   function GoToTreeList() {
         if (window.innerWidth < 980) { 
 $('html, body').animate({
     scrollTop: $('#contentMain').offset().top
  }, 100);
 }
 }
  function gotoGrid() { 
         if (window.innerWidth < 980) { 
  $('html, body').animate({
        scrollTop: $('#Manuals').offset().top
   }, 100);
 }
    }
     function confirmDeleteTL() {
 if (treeList.GetFocusedNodeKey() != "") {
   if (ID_Manual_Group != "0") {
       if (confirmA('Bạn có chắc chắn xóa nhóm bài viết hdsd đã chọn có mã ' + ID_Manual_Group + ' ?', DoDeleteTL)) {
         lp.Show();
     }
   }
  else {
      StylesMsg('warning', 'Vui lòng chọn nhóm bài viết hdsd để xóa!');
   }
  }
}
  function DoDeleteTL(btnVal) {
   if (btnVal == "Có") {
     var bt = document.getElementById(deltl);
    if (bt) {
       bt.click();
    }
  } else {
       lp.Hide();
  }
 }
     function ThemManual_Groups() {
   var c = treeList.GetVisibleNodeKeys().length;
   var key = treeList.GetFocusedNodeKey();
  if ((ID_Manual_Group != '0' && ID_Manual_Group != 'All')||(c==0)) {
    FirstLoading = true;
    if (c == 0) {
     key = '';
  }
   p1.SetContentUrl('Module/DanhMuc/Manual_Groups/PopUp/ThemManual_Groups.aspx?isNew=1&double=0&ID_Form='+ID_FormTreeList+'&ID_Manual_Group=' + key);
   lblTitle.SetText('Thêm Nhóm bài viết HDSD');
      ShowPopup();
  }
  else {
     StylesMsg('warning', 'Vui lòng chọn nhóm bài viết hdsd!');
  }
  }
var checkFocus = false;
   function OnGridFocusedRowChanged() {
     if (grvManuals.GetFocusedRowIndex() >= 0 ||   document.getElementById("Fieldset1")) {
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
             ClientContactDetailsPanel.PerformCallback('Manuals'+name);
     }
     function OnDelete(names) {
        confirmA('Bạn có chắc chắn xóa hình ảnh của bài viết hdsd này không!', callback_funcThongBaoXoaHinhAnh);
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
           if (ID_Manual_Group != "0") {
               if (confirm('Bạn có chắc chắn xóa nhóm bài viết hdsd đã chọn có mã ' + ID_Manual_Group + ' ?')) {
                  lp.Show();
                  return true;
             }
             else
                return false;
           }
          else {
               StylesMsg('warning', 'Vui lòng chọn nhóm bài viết hdsd để xóa!');
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
