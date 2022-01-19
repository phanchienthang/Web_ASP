<%@ control language="C#" autoeventwireup="true" inherits="UserControl_Products_new_products, App_Web_vi0udbra" %>
<div class="box-inner _lib-bg-w">
    <h3 class="cate">Sản phẩm mới</h3>
    <div>
        <ul id="new-product" class="_new_prd">
            <asp:SqlDataSource runat="server" ID="ds" SelectCommand="Select * from tbProducts"></asp:SqlDataSource>
            <asp:Repeater ID="rpt2" runat="server" DataSourceID="ds">
                <ItemTemplate>
                    <li class="item">
                        <div class="_lib-al-c">
                            <div class="new_pr">New</div>
                            <img src='<%# Eval("Image")%>' alt='<%# Eval("ProductName")%>' />
                            <div>
                                <p><a href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Product"))%>'><%# Eval("ProductName")%></a></p>
                                <p>Giá: <%# Eval("Price")%> <span class="_lib-tx-underline"><%# Eval("CurrencyUnit")%></span> / <%# Eval("Unit")%></p>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="load">
        <div id="loadMore">
            <span>Hiển thị thêm</span>
            <i class="fa fa-plus"></i>
        </div>
        <div id="showLess">
            <span>Hiển thị ít</span>
            <i class="fa fa-minus"></i>
        </div>
    </div>
</div>
