 var FirstLoading = true;
        var checkTypeRefresh = 0;
        var iframe;
        var delID = "<%= xoa.ClientID %>";
        function OnPopupInit(s, e) {
            iframe = popupOptions.GetContentIFrame();
            /* the "load" event is fired when the content has been already loaded */
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
                popupOptions.SetContentUrl('Module/DanhMuc/ChuDe/PopUp/ThemChuDe.aspx?isNew=0&double=1&id=' + values);
                popupOptions.SetSize(350, 160);
                lblTitle.SetText('Chi Tiết Chủ Đề');
                popupOptions.Show();
            }
        }
        window.onload = function () {
            GetSubTabIndex();
            displayHeight125("contentMain");
        }
         function Refresh() {
            if (getCheckTypeRefresh() == 4) {
                grvChuDe.Refresh();
            }
            setCheckTypeRefresh(0);
        }

        function alertDeleteDev() {
            if (grvChuDe.GetFocusedRowIndex() >= 0) {
                confirmA('Bạn có chắc chắn xóa những thông tin đã được đánh dấu ?', DoDelete);

                lp.Show();

            }
            else {
                alertTB('Bạn vui lòng chọn chủ đề để xóa !');

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
        function setCheckTypeRefresh(checkType) {
            checkTypeRefresh = checkType;
        }
        function getCheckTypeRefresh() {
            return checkTypeRefresh;
        }
        function thongBaoThoatPpopupOptions(btnval) {
            if (btnval == 'Có') {

                Refresh();

                popupOptions.SetContentUrl('about:blank');
                popupOptions.Hide();
            }
        }
         function ThemChuDe() {
            FirstLoading = true;
            popupOptions.SetContentUrl('Module/DanhMuc/ChuDe/PopUp/ThemChuDe.aspx?isNew=1&double=0');
            popupOptions.SetSize(350, 160);
            lblTitle.SetText('Thêm Chủ Đề');
            popupOptions.Show();
        }
        function ChiTietChuDe() {
            if (grvChuDe.GetFocusedRowIndex() >= 0) {
                FirstLoading = true;
                popupOptions.SetContentUrl('Module/DanhMuc/ChuDe/PopUp/ThemChuDe.aspx?isNew=0&double=0');
                popupOptions.SetSize(350, 160);
                lblTitle.SetText('Chi Tiết Chủ Đề');
                popupOptions.Show();
            }
            else {
                alertTB('Vui lòng chọn chủ đề để xem chi tiết!');
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
            grvChuDe.SetHeight(h - 30);
        }
        function AdjustSize_click() {
            var h = CheckNameClass_click("contentMain");
            grvChuDe.SetHeight(h - 30);
        }