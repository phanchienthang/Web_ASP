<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Modules_Products_viewcategory, App_Web_zh3bjvrk" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="/js/jquery.inview.js"></script>
    <script src="/js/jquery.hoverex.min.js"></script>
    <script>
        $(function () {
            $page = jQuery.attr("/san-pham.aspx");
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
        <asp:SqlDataSource runat="server" ID="ds" SelectCommand="Select * from tbCatalogsProducts"></asp:SqlDataSource>
        <asp:Repeater ID="rpt1" runat="server" DataSourceID="ds">
            <ItemTemplate>
                <div class="col12 title-head">
                    <div>
                        <h3><%# Eval("CatalogName")%></h3>
                    </div>
                    <div class="form_sort">
                        <span class="col4">Sort by:</span>
                        <select class="col8 select_styled white_select" name="sort_list" id="sort_list">
                            <option value="1" selected="" data-sort="price">Giá từ thấp đến cao</option>
                            <option value="2" data-sort="price">Giá từ cao đến thấp</option>
                            <option value="3">Tên từ A-Z</option>
                            <option value="4">Tên từ Z-A</option>
                        </select>
                    </div>
                </div>
                <div class="tt-ct-main">
                    <ul class="col12 list-prd effect_fadeInDowndelay animated list_item_product">
                        <asp:Repeater ID="rpt2" runat="server" DataSource='<%# getItem(Eval("ID_Catalog"))%>'>
                            <ItemTemplate>
                                <li class="col3 _lib-al-c item _product">
                                    <div>
                                        <div class="_prd he-wrap">
                                            <img src='<%# Eval("Image")%>' alt='<%# Eval("ProductName")%>' />
                                            <div class="he-view">
                                                <div class="bg a0" data-animate="fadeIn">
                                                    <h3 class="a1" data-animate="fadeInDown"><%# Eval("ProductName")%></h3>

                                                    <a href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Product"))%>' class="btn a2" data-animate="rotateInRight">
                                                        <i class="fa fa-search"></i>Chi tiết 
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product-details offer_data">
                                            <p><a href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Product"))%>'><%# Eval("ProductName")%></a></p>
                                            <p>Giá: <strong class="offer_price"><%# Eval("Price")%> </strong>
                                                <span class="_lib-tx-underline"><%# Eval("CurrencyUnit")%></span> / <%# Eval("Unit")%></p>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Right" runat="Server">
</asp:Content>

