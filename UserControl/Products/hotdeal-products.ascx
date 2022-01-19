<%@ control language="C#" autoeventwireup="true" inherits="UserControl_Products_hotdeal_products, App_Web_vi0udbra" %>
<script src="/js/jquery.bxslider.min.js"></script>
<script>
    $(function () {
        $('#hl-product').bxSlider({
            mode: 'vertical',
            minSlides: 2,
            maxSlides: 2,
            //slideWidth: 270,
            nextText: '<i class="fa fa-caret-up"></i>',
            prevText: '<i class="fa fa-caret-down"></i>',
            nextSelector: '#specials-next',
            prevSelector: '#specials-prev',
            pager: false,
            auto: true,
        });
    });
</script>
<div class="box-inner _lib-bg-w">
    <div class="cate">
        <div class="nav-scroll">
            <span id="specials-prev"><a href=""></a></span>
            <span id="specials-next"><a href=""></a></span>
        </div>
        <h3>Sản phẩm nổi bật</h3>
    </div>
    <div>
        <ul id="hl-product" class="_hot_prd">
            <asp:SqlDataSource runat="server" ID="ds" SelectCommand="Select * from tbProducts"></asp:SqlDataSource>
            <asp:Repeater ID="rpt2" runat="server" DataSourceID="ds">
                <ItemTemplate>
                    <li class="item">
                        <div class="_lib-al-c">
                            <div class="sale">Sale</div>
                            <img src='<%# Eval("Image")%>' alt='<%# Eval("ProductName")%>' />
                            <div>
                                <p>
                                    <a href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Product"))%>'><%# Eval("ProductName")%></a>
                                    <br />
                                    <span><%# Eval("Description")%></span>
                                </p>
                                <p>Giá: <%# Eval("Price")%> <span class="_lib-tx-underline"><%# Eval("CurrencyUnit")%></span> / <%# Eval("Unit")%></p>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>
