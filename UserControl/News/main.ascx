<%@ control language="C#" autoeventwireup="true" inherits="UserControl_News_main, App_Web_2gkpvd4h" %>
<asp:SqlDataSource runat="server" ID="ds" SelectCommand="Select * from tbNews"></asp:SqlDataSource>
<asp:Repeater ID="rpt1" runat="server" DataSourceID="ds">
    <ItemTemplate>
        <div class="col12 news">
            <div class="col12">
                <div class="col3 news-img">
                    <a href='<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_News"))%>'>
                        <img src="<%# Eval("Image")%>" alt="<%# Eval("Title")%>" /></a>
                </div>
                <div class="col9">
                    <div class="tt-ct _lib-bd-bt-none">
                        <a href="<%# Utils.getAHrefURL(Eval("Link_SEO"), Eval("ID_News"))%>">
                            <span><%# Eval("Title")%></span></a>
                    </div>
                    <div class="sumary-ct">
                        <%# Eval("Description")%>
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
