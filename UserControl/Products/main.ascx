<%@ control language="C#" autoeventwireup="true" inherits="UserControl_Products_main, App_Web_vi0udbra" %>
<asp:SqlDataSource runat="server" ID="ds" SelectCommand="Select * from tbCatalogsProducts where ID_Catalog <> 1"></asp:SqlDataSource>
<asp:Repeater ID="rpt1" runat="server" DataSourceID="ds">
    <ItemTemplate>
        <div class="col12 _item">
            <div class="col12 tt-ct">
                <div class="_lib-tx-upper">
                    <a class="" href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Catalog"))%>'><%# Eval("CatalogName")%></a>
                </div>
                <div>
                    <a class="" href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Catalog"))%>'>Xem tất cả<span> </span></a>
                </div>
            </div>
            <ul class="col12 list-prd effect_fadeInDowndelay animated">
                <asp:Repeater ID="rpt2" runat="server" DataSource='<%# getItem(Eval("ID_Catalog"))%>'>
                    <ItemTemplate>
                        <li class="col3 _lib-al-c item">
                            <div>
                                <div class="_prd he-wrap">
                                    <img src='<%# Eval("Image")%>' alt='<%# Eval("ProductName")%>' />
                                    <div class="he-view">
                                        <div class="bg a0" data-animate="fadeIn">
                                            <h3 class="a1" data-animate="fadeInDown" data-info='<%# Eval("ID_Product")%>'><%# Eval("ProductName")%></h3>
                                            <a href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Product"))%>' class="btn a2" data-animate="rotateInRight">
                                                <i class="fa fa-search"></i><span class="_detail">Chi tiết</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product-details">
                                    <p>
                                        <a href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_Product"))%>'>
                                            <%# Eval("ProductName")%></a>
                                    </p>
                                    <p>Giá: <%# Eval("Price")%> <span class="_lib-tx-underline">VNĐ</span> / cái</p>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </ItemTemplate>
</asp:Repeater>
