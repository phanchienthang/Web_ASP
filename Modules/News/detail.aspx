<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Modules_News_detail, App_Web_c2grlpfm" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(function () {
            $page = jQuery.attr("/tin-tuc.aspx");
            if (!$page) {
                $page = '/tin-tuc.aspx';
            }
            $('#nav li a').each(function () {
                var $href = $(this).attr('href');
                if (($href == $page) || ($href == '')) {
                    $(this).closest('li').addClass('active');
                } else {
                    $(this).closest('li').removeClass('active');
                }
            });
        });
    </script>
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
        <asp:SqlDataSource runat="server" ID="ds" SelectCommand="Select * from tbNews"></asp:SqlDataSource>
        <asp:Repeater ID="rpt1" runat="server" DataSourceID="ds">
            <ItemTemplate>
                <h3 class="cate"><%# Eval("Title")%></h3>
                <div class="_lib-mg-t-10 tt-ct-main new-ct">
                    <%# Eval("Detail")%>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Right" runat="Server">
</asp:Content>

