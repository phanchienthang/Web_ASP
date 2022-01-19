 var checkRefresh = false;
 var FirstLoading = true;
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
     p1.SetContentUrl('Module/DanhMuc/Solutions/PopUp/ThemSolutions.aspx?isNew=0&double=1&id=' + values +'&ID_Form='+ID_Form);
     lblTitle.SetText('Chi Tiết Giải Pháp');
  ShowPopup();
  }
 }
 function setResizeLeftMenu() {
       treeList.PerformCallback();
grvSolutions.Refresh();
 }
 function Refresh() {
 var bt = document.getElementById(refresh); 
    if (bt) { 
   bt.click();
     }
 }
 function confirmDelete() {
   lp.Show();
        var i = grvSolutions.GetSelectedRowCount();
  if (i == 0)
  {
     alertTB('Bạn vui lòng chọn giải pháp để xóa!');
     lp.Hide();
   } else
   {
      if (i == 1)
     {
         confirmA('Bạn có chắc chắn muốn xóa giải pháp này không ?', DoDelete);
     }
     else
    {
      confirmA('Bạn có chắc chắn muốn xóa những giải pháp này không?',DoDelete);
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
       grvSolutions.UnselectAllRowsOnPage();
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
  function ThemSolutions() {
   var c = treeList.GetVisibleNodeKeys().length;
   var key = treeList.GetFocusedNodeKey();
  if ((ID_Solution_Cate != '0' && ID_Solution_Cate != '-1')||(c==0)) {
    FirstLoading = true;
    if (c == 0) {
     key = '';
  }
   FirstLoading = true;
   p1.SetContentUrl('Module/DanhMuc/Solutions/PopUp/ThemSolutions.aspx?isNew=1&double=0&ID_Form='+ID_Form+'&ID_Solution_Cate=' + key);
  lblTitle.SetText('Thêm Giải Pháp');
  ShowPopup();
  }
  else {
     StylesMsg('warning', 'Vui lòng chọn nhóm giải pháp!');
  }
  }
 function ChiTietSolutions(values) {
    if (values != null || values != "")  {
       FirstLoading = true;
    p1.SetContentUrl('Module/DanhMuc/Solutions/PopUp/ThemSolutions.aspx?isNew=0&double=0&id=' + values + '&ID_Form='+ID_Form);
    lblTitle.SetText('Chi Tiết Giải Pháp');
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
   ID_Solution_Cate = key;
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
       grvSolutions.SetHeight(h);
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
     grvSolutions.PerformCallback();
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
        scrollTop: $('#Solutions').offset().top
   }, 100);
 }
    }
     function confirmDeleteTL() {
 if (treeList.GetFocusedNodeKey() != "") {
   if (ID_Solution_Cate != "0") {
       if (confirmA('Bạn có chắc chắn xóa nhóm giải pháp đã chọn có mã ' + ID_Solution_Cate + ' ?', DoDeleteTL)) {
         lp.Show();
     }
   }
  else {
      StylesMsg('warning', 'Vui lòng chọn nhóm giải pháp để xóa!');
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
     function ThemSolutions_Category() {
   var c = treeList.GetVisibleNodeKeys().length;
   var key = treeList.GetFocusedNodeKey();
    if (key == '-1') {
     key = '';
  }
   p1.SetContentUrl('Module/DanhMuc/Solutions_Category/PopUp/ThemSolutions_Category.aspx?isNew=1&double=0&ID_Form='+ID_FormTreeList+'&ID_Solution_Cate=' + key);
   lblTitle.SetText('Thêm Nhóm Giải Pháp');
      ShowPopup();
  }
     function ChiTietSolutions_Category() {
   var c = treeList.GetVisibleNodeKeys().length;
   var key = treeList.GetFocusedNodeKey();
    if (key == '-1') {
   p1.SetContentUrl('Module/DanhMuc/Solutions_Category/PopUp/ThemSolutions_Category.aspx?isNew=0&double=0&ID_Form='+ID_FormTreeList+'&id=' + key);
   lblTitle.SetText('Sửa Nhóm Giải Pháp');
      ShowPopup();
  }
          else {
          StylesMsg('warning', 'Vui lòng chọn nhóm giải pháp!');
       }
    }
var checkFocus = false;
   function OnGridFocusedRowChanged() {
     if (grvSolutions.GetFocusedRowIndex() >= 0 ||   document.getElementById("Fieldset1")) {
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
             ClientContactDetailsPanel.PerformCallback('Solutions'+name);
     }
     function OnDelete(names) {
        confirmA('Bạn có chắc chắn xóa hình ảnh của giải pháp này không!', callback_funcThongBaoXoaHinhAnh);
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
           if (ID_Solution_Cate != "0") {
               if (confirm('Bạn có chắc chắn xóa nhóm giải pháp đã chọn có mã ' + ID_Solution_Cate + ' ?')) {
                  lp.Show();
                  return true;
             }
             else
                return false;
           }
          else {
               StylesMsg('warning', 'Vui lòng chọn nhóm giải pháp để xóa!');
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
