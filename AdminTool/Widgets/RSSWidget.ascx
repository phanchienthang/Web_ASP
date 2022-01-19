<%@ control language="C#" autoeventwireup="true" inherits="Widgets_RSSWidget, App_Web_apq3e15u" enableviewstate="false" %>
<%@ Register Src="~/AdminTool/Widgets/OneTimePost.ascx" TagName="OneTimePost" TagPrefix="my" %>

<asp:Panel ID="SettingsPanel" runat="Server" Visible="False" >
<asp:Literal ID="ltlURL" EnableViewState="false" runat="server" Text="a" />: <asp:TextBox ID="FeedUrl" Text="" runat="server" MaxLength="2000" Columns="40" /><br />
<asp:Literal ID="Literal1" EnableViewState="false" runat="server" Text="b" />
<asp:DropDownList ID="FeedCountDropDownList" runat="Server">
<asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
<asp:ListItem>10</asp:ListItem>
<asp:ListItem>11</asp:ListItem>
<asp:ListItem>12</asp:ListItem>
<asp:ListItem>13</asp:ListItem>
<asp:ListItem>14</asp:ListItem>
<asp:ListItem>15</asp:ListItem>
<asp:ListItem>16</asp:ListItem>
<asp:ListItem>17</asp:ListItem>
<asp:ListItem>18</asp:ListItem>
<asp:ListItem>19</asp:ListItem>
<asp:ListItem>20</asp:ListItem>
</asp:DropDownList>
<asp:Literal ID="ltlWorking" EnableViewState="false" runat="server" Text="Item" />
<asp:Button ID="SaveSettings" runat="Server" OnClick="SaveSettings_Click" Text="Save" />
</asp:Panel>

<asp:MultiView ID="RSSMultiview" runat="server" ActiveViewIndex="0">

<asp:View runat="server" ID="RSSProgressView">
    
    <asp:Label runat="Server" ID="label1" Text="Loading" Font-Size="smaller" ForeColor="DimGray" />
</asp:View>

<asp:View runat="server" ID="RSSFeedView">

    <asp:DataList ID="FeedList" runat="Server" EnableViewState="False">
    <ItemTemplate>
    <asp:HyperLink ID="FeedLink" runat="server" Target="_blank" CssClass="feed_item_link" NavigateUrl='<%# Eval("link") %>' ToolTip='<%# Eval("description") %>'>
    <%# Eval("title") %>
    </asp:HyperLink>
    </ItemTemplate>
    </asp:DataList>
    <asp:Label ID="Message" runat="server" Visible="false" EnableViewState="true" />
</asp:View>

</asp:MultiView>

<%--<my:OneTimePost runat="server" ID="RssOneTimePost" />--%>