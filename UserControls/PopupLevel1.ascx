<%@ control language="C#" autoeventwireup="true" inherits="PopupLevel1, App_Web_bgxm25lq" %>

<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors"
        TagPrefix="dx" %>
        <%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dx" %>
            <dx:ASPxPopupControl ID="p1" ClientInstanceName="p1" runat="server" AllowDragging="True"
                AllowResize="false" Modal="true" ShowCollapseButton="true" ContentUrl="javascript:void(0);"
                EnableClientSideAPI="True" PopupAction="None" PopupHorizontalAlign="WindowCenter"
                PopupVerticalAlign="WindowCenter" ShowFooter="false" CloseAction="CloseButton"
                ShowHeader="true" ShowSizeGrip="true" ShowShadow="true" EnableAnimation="true"
                ShowCloseButton="true" ShowMaximizeButton="true" ShowRefreshButton="true" ScrollBars="None">
                <ClientSideEvents Init="OnPopupInit" Shown="OnPopupShown" />
                <HeaderStyle CssClass="clearfix" />
                <HeaderTemplate>
                    <div style="float:left; margin:0">
                        <dx:ASPxLabel ID="lblTitle" runat="server" CssClass="titlePopup" 
                        ClientInstanceName="lblTitle" 
                        Font-Size="18px"></dx:ASPxLabel> 
                    </div>
                    <div class="btn_popup">
                        <%--<a href="#" onclick="CollapsePopup()"><span class="icon32 icon-green icon-carat-2-ns" />--%>
                        <a href="#" onclick="CollapsePopup()"><span>
                            <i class="glyphicon glyphicon-minus green"></i>
                        </span>
                        
                        </a>
                        <a href="#" onclick="MinMaxPopup()"><span>
                            <i class="glyphicon glyphicon-list-alt green"></i>
                        </span>
                        <%--<span class="icon32 icon-color icon-newwin" />--%>
                        </a><a href="#" onclick="ThongBaoStyles_Thoat()"> <span>
                            <i class="glyphicon glyphicon-off red"></i>
                        </span>
                        <%--<span class="icon32 icon-color icon-cross" />--%>
                        </a>
                    </div>
              
                </HeaderTemplate>
                <ContentCollection>
                </ContentCollection>
                <ContentStyle>
                    <Paddings Padding="0px"></Paddings>
                </ContentStyle>
            </dx:ASPxPopupControl>
  