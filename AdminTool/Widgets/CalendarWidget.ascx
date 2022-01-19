<%@ Control Language="C#" ClassName="CalendarWidget" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dx" %>
<script runat="server">
    protected void Page_Init(object sender, EventArgs e) {
        Calendar.SelectedDate = DateTime.Now;
    }
</script>
<dx:ASPxCalendar runat="server" ID="Calendar" ShowClearButton="false" ShowHeader="false"
    ShowTodayButton="false" ShowWeekNumbers="false" HighlightToday="false" Width="100%">
    <Border BorderStyle="None" />
</dx:ASPxCalendar>
