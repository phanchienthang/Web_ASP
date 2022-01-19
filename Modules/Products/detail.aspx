<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Modules_Products_detail, App_Web_zh3bjvrk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        $(function () {
            $page = jQuery.attr("/san-pham.html");
            if (!$page) {
                $page = '/san-pham.aspx';
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
        <asp:SqlDataSource ID="ds" runat="server"
            SelectCommand="select * from tbProducts, tbManufacture where tbProducts.ID_Manufacture = tbManufacture.ID_Manufacture"></asp:SqlDataSource>
        <asp:Repeater ID="rpt1" runat="server" DataSourceID="ds">
            <ItemTemplate>
                <h3 class="cate"><%# Eval("ProductName")%></h3>
                <div class="tt-ct-main">
                    <div class="col12 _lib-mg-t-10 _lib-mg-bt-10">
                        <div class="col6">
                            <img class="_img_content" src="<%# Eval("Image")%>" />
                        </div>
                        <div class="col6 lib_cl-gray17">
                            <div class="col12 ">
                                <div class="col7">
                                    <span class="_lib-fw-6 ">Cập nhật:</span> <%# Eval("EditTime")%>
                                </div>
                                <div class="col5">
                                    <span class="_lib-fw-6 ">Tình trạng:</span> <%# Eval("Status")%>
                                </div>
                                <div class="col7">
                                    <span class="_lib-fw-6 ">Hãng sản xuất:</span> <%# Eval("ManufactureName")%>
                                </div>
                                <div class="col12 _lib-mg-t-10 btn_price">
                                    <a class="_btncart btn a2" data-animate="rotateInLeft">
                                        <strong>
                                            <i class="fa fa-opencart"></i></strong>
                                    </a>
                                    <span style="margin: 0 5px;">Giá: </span><span style="font-size: 24px; font-weight: 600;"><%# Eval("Price")%> </span>
                                    <span class="_lib-tx-underline"><%# Eval("CurrencyUnit")%></span>
                                </div>
                            </div>
                            <div class="col12 _lib-mg-t-10">
                                Sản phẩm được sản xuất bởi công ty Thành Công thuộc nhóm 13 sinh viên đại học Vinh.
                                Nếu có gì thắc mắc bạn có thể<a href="../../../lien-he.aspx"> Click vào đây</a> để thông báo cho chúng tôi biết. 
                                Xin trân trọng cảm ơn bạn!
                            </div>
                        </div>
                    </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Right" runat="Server">
</asp:Content>

