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
     p1.SetContentUrl('Module/DanhMuc/Blocks_Weight/PopUp/ThemBlocks_Weight.aspx?isNew=0&double=1&id=' + values +'&ID_Form='+ID_Form);
     lblTitle.SetText('Chi Tiết Blocks_Weight');
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
        var i = grvBlocks_Weight.GetSelectedRowCount();
  if (i == 0)
  {
     alertTB('Bạn vui lòng chọn blocks_weight để xóa!');
     lp.Hide();
   } else
   {
      if (i == 1)
     {
         confirmA('Bạn có chắc chắn muốn xóa blocks_weight này không ?', DoDelete);
     }
     else
    {
      confirmA('Bạn có chắc chắn muốn xóa những blocks_weight này không?',DoDelete);
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
       grvBlocks_Weight.UnselectAllRowsOnPage();
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
  function ThemBlocks_Weight() {
   FirstLoading = true;
   p1.SetContentUrl('Module/DanhMuc/Blocks_Weight/PopUp/ThemBlocks_Weight.aspx?isNew=1&double=0&ID_Form='+ID_Form);
  lblTitle.SetText('Thêm Blocks_Weight');
  ShowPopup();
  }
 function ChiTietBlocks_Weight(values) {
    if (values != null || values != "")  {
       FirstLoading = true;
    p1.SetContentUrl('Module/DanhMuc/Blocks_Weight/PopUp/ThemBlocks_Weight.aspx?isNew=0&double=0&id=' + values + '&ID_Form='+ID_Form);
    lblTitle.SetText('Chi Tiết Blocks_Weight');
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
       grvBlocks_Weight.SetHeight(h);
       grvModuleFunction.SetHeight(h);
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
     grvBlocks_Weight.PerformCallback();
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
        scrollTop: $('#Blocks_Weight').offset().top
   }, 100);
 }
    }
