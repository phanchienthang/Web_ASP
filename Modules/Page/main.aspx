<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Modules_Page_main, App_Web_c4ootjre" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Công ty TNHH Thành Công</title>
    <link href="css/owl.carousel.css" rel="stylesheet" />

    <script src="js/jquery.inview.js"></script>
    <script src="js/jquery.hoverex.min.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/modernizr.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Banner_Slider" runat="Server">
    <div id="slider_w" runat="server">
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Left" runat="Server">
    <div id="new_product" runat="server">
    </div>
    <div id="hotdeal_product" runat="server">
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box-inner sub-cate _lib-mg-bt-10 _lib-bg-w">
        <h3 class="cate">sản phẩm</h3>
        <div id="list-prd">
            <div class="_lib-mg-t-10 tt-ct-main listing">
                <div id="main_product" runat="server">
                </div>
            </div>
        </div>
    </div>
    <div class="box-inner sub-cate _lib-mg-bt-10 _lib-bg-w">
        <h3 class="cate">tin tức</h3>
        <div id="main_news" runat="server">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Right" runat="Server">
</asp:Content>

