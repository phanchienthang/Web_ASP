<%@ control language="C#" autoeventwireup="true" inherits="PopupFM, App_Web_bgxm25lq" %>

<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors"
        TagPrefix="dx" %>
        <%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dx" %>




           <dx:ASPxPopupControl ID="pcSaveAs" runat="server" ClientInstanceName="pcSaveAs" CloseAction="CloseButton"
                ContentUrl="javascript:void(0);" AllowDragging="true" AllowResize="true" PopupHorizontalAlign="WindowCenter"
                ShowMaximizeButton="true" Modal="true" HeaderText="Chọn ảnh có sẵn" Width="320px"
                Height="480px" PopupVerticalAlign="WindowCenter">
                <ContentStyle Paddings-Padding="1px">
                    <Paddings Padding="0px"></Paddings>
                </ContentStyle>
                <ContentCollection>
                    <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
  