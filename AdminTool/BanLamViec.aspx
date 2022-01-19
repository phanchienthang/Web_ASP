<%@ page language="C#" masterpagefile="~/AdminTool/MP.master" autoeventwireup="true" inherits="BanLamViec, App_Web_o1yggtw0" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Bàn làm việc</title>
    <link href="../../css/AdminTool/dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" runat="Server">
    <asp:PlaceHolder runat="server" ID="phScriptManager"></asp:PlaceHolder>
    <div class="row">
        <div class="col6">
            <div class="box-header">Ngày giờ</div>
            <div class="box-content has-border has-padding has-bg"><%= Utils.getDateTime()%></div>
        </div>
        <div class="col6">
            <div class="box-header">Lịch</div>
            <div class="box-content has-border has-padding has-bg">
                <asp:Calendar ID="calDate" runat="server" DayNameFormat="Shortest" CssClass="calendar">
                    <%--<SelectedDayStyle />
                    <TodayDayStyle />
                    <SelectorStyle />
                    <WeekendDayStyle/>
                    <OtherMonthDayStyle />
                    <NextPrevStyle />
                    <DayHeaderStyle CssClass="cld-day-header" />
                    <TitleStyle CssClass="cld-header" />--%>
                    <SelectedDayStyle CssClass="cld-select-day" />
                    <TodayDayStyle CssClass="cld-today" />
                    <OtherMonthDayStyle CssClass="cld-other-day" />
                </asp:Calendar>
            </div>
        </div>
        <div class="col12 _lib-mg-t-10">
            <div class="box-header">Hoạt động gần đây</div>
        </div>
    </div>
</asp:Content>

