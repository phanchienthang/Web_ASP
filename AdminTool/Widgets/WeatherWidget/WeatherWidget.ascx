<%@ Control Language="C#" ClassName="WeatherWidget" %>
<%@ Register Src="~/AdminTool/Widgets/WeatherWidget/DayUserControl.ascx" TagName="Day"
    TagPrefix="uc" %>
      <%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dx" %>
<script runat="server">
</script>
<table width="100%" style="text-align: center;">
    <tr>
        <td colspan="4" style="text-align: left;">
            <dx:ASPxHyperLink runat="server" ID="ASPxHyperLink1" Text="Today" Font-Size="Larger" NavigateUrl="javascript:void(0)">
            </dx:ASPxHyperLink>
        </td>
    </tr>
    <tr>
        <td>
            
            <dx:ASPxImage runat="server" ID="ASPxImage1" ImageUrl="../Images/Widgets/Weather/rain_thunderstorm.png"
                CssClass="todayImg">
            </dx:ASPxImage>
        </td>
        <td style="text-align: left;">
            <dx:ASPxLabel runat="server" ID="ASPxLabel1" Text="+4°C" Font-Bold="true" Font-Size="Medium">
            </dx:ASPxLabel>
        </td>
        <td colspan="2" style="text-align: left;">
            Current: Rain
            <br />
            Wind: N at 26 km/h
            <br />
            Humidity: 81%
        </td>
    </tr>
    <tr>
        <td>
            <uc:Day ID="Day1" runat="server" DayOfWeek="Tu" Temperature="+2°|-1°" WeatherImageUrl="../Images/Widgets/Weather/rain_common.png" />
        </td>
        <td>
            <uc:Day ID="Day2" runat="server" DayOfWeek="We" Temperature="+4°| 0°" WeatherImageUrl="../Images/Widgets/Weather/cloudiness_hi.png" />
        </td>
        <td>
            <uc:Day ID="Day3" runat="server" DayOfWeek="Th" Temperature="+5°|+1°" WeatherImageUrl="../Images/Widgets/Weather/cloudiness_partly.png" />
        </td>
        <td>
            <uc:Day ID="Day4" runat="server" DayOfWeek="Fr" Temperature="+7°|+3°" WeatherImageUrl="../Images/Widgets/Weather/cloudiness_low.png" />
        </td>
    </tr>
</table>
