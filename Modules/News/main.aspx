<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Modules_News_main, App_Web_c2grlpfm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Công ty TNHH Thành Công | Tin tức</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Banner_Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Left" runat="Server">
    <div id="new_product" runat="server">
    </div>
    <div id="hotdeal_product" runat="server">
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box-inner sub-cate _lib-mg-bt-10 _lib-bg-w">
        <h3 class="cate">tin tức</h3>
        <div id="main_news" runat="server">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Right" runat="Server">
</asp:Content>

