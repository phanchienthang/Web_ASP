<%--<%@ Page Language="C#" MasterPageFile="~/SystemStyles/MasterF.master" AutoEventWireup="true" CodeFile="FileManagerCrop.aspx.cs" Inherits="FileManager" Title="Untitled Page" %>--%>
<%@ page language="C#" masterpagefile="~/AdminTool/MasterF.master" autoeventwireup="true" inherits="FileManager, App_Web_2lvnnguj" title="Untitled Page" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxFileManager" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../js/crop/jquery.Jcrop.css" type="text/css" />
     <style>
        .dxpc-contentWrapper
        {
            display:block !important; overflow:auto;
        }
    </style>
    <%--  <script src="../js/jquery.min.js" type="text/javascript"></script>--%>
    <%-- <script src="../js/jquery-1.7.2.min.js"> </script>--%>
    <script type="text/javascript" src="/js/jquery-1.8.2.js?t=16"></script>
    <script src="../js/crop/jquery.Jcrop.js" type="text/javascript"></script>
    <script src="../js/crop/crop.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var cfheight = "<%= GetHeight()%>";
        var cfwidth = "<%= GetWidth() %>";
        var imagelogo = "/images/logo-bs-w.png";
        var jcrop_api;
        var linkImage;
        var linkImageWM;


        function InitImage(rw, rh, w, h) {
            jQuery(function ($) {

                var intNewWidth;
                var intNewHeight;
                var hScreen = window.innerHeight - 200;
                //   var rate = 768 / h;


                //determine if landscape or portrait 
                var intMaxSide;

                if (w >= h) {
                    intMaxSide = w;
                }
                else {
                    intMaxSide = h;
                }


                if (intMaxSide > hScreen) {
                    //set new width and height 
                    var dblCoef = hScreen / intMaxSide;
                    intNewWidth = dblCoef * w;
                    intNewHeight = dblCoef * h;
                }
                else {
                    intNewWidth = w;
                    intNewHeight = h;
                }


                // alert(intNewWidth + intNewHeight);

                $('#originalImage').Jcrop({
                    onChange: showCoords,
                    onSelect: showCoords,
                    aspectRatio: rw / rh,
                    bgColor: 'white',
                    bgOpacity: .4,
                    setSelect: [100, 100, 50, 50],
                    minSize: [rw, rh],
                    boxWidth: intNewWidth,   //Maximum width you want for your bigger images
                    boxHeight: intNewHeight,

                }, function () {
                    jcrop_api = this;
                });

            });
        }
        var img = new Image();
        var imgwm = new Image();
        function showCoords(c) {
            //  jcrop_api = c;
            $('#x1').val(c.x);
            $('#y1').val(c.y);
            $('#x2').val(c.x2);
            $('#y2').val(c.y2);
            $('#w').val(c.w);
            $('#h').val(c.h);
        }
        function fileSelectChanged(s, e) {
            var file = e.file;
            if (file) {

                var path = s.GetCurrentFolderPath();
                               window.parent.setCookies('link', path, 100);
                               var name = "UploadImages/" + file.GetFullName();
                               tbFileName.SetText(name.replace(/\\/g, "/"));

               

             
            }
        }
        function setPictureLink() {

            var link = tbFileName.GetText();

            img.onload = function () {
                if (img.src != "") {
                    var height = img.height;
                    var width = img.width;
                    if (height >= cfheight && width >= cfwidth) {

                        var RateH = Math.round(width * 100 / height);
                        var RateD=Math.round(cfwidth * 100 / cfheight);
                        if (RateH == RateD || RateH == (RateD + 1) || RateH == (RateD - 1)) {
                            var path = fm.GetCurrentFolderPath();
                            window.parent.setCookies('link', path, 100);
                            if (window.parent.p1) {
                                window.parent.p1.GetContentIFrameWindow().setPictureLink(link);
                                window.parent.pcSaveAs.Hide();
                            } else {
                                window.parent.setPictureLink(link);
                                window.parent.pcSaveAs.Hide();
                            }
                         
                        } else {

                            window.parent.alertTB('Ảnh bạn chọn không đúng tỉ lệ ảnh yêu cầu! Bạn cần phải cắt ảnh theo đúng tỉ lệ ', function () {
                                pcEditImage.Show();
                                window.parent.pcSaveAs.SetMaximized(true);
                                document.getElementById('originalImage').src = img.src;
                                img.src = "";
                                $('#imgCropped').val(linkImage);
                                InitImage(cfwidth, cfheight, width, height);

                            });

                        }
                    } else {
                        window.parent.alertTB('Ảnh bạn chọn có kích thước (chiều rộng) ' + width + ' X ' + height + ' (chiều cao)! Ảnh bạn chọn phải có chiều rộng lớn hơn ' + cfwidth + 'px và chiều cao lớn hơn ' + cfheight + 'px');
                    }
                }

            }
            var path = fm.GetCurrentFolderPath();

            linkImage = "../../" + link;
            img.src = "../../" + link + "?t=" + (new Date().getTime());
          
        }

        function SetLinkAfterCrop(name) {
            var path = fm.GetCurrentFolderPath();
            window.parent.setCookies('link', path, 100);

            tbFileName.SetText(name.replace(/\\/g, "/"));
        }
        function ResetInputFile() {
            //   $('#originalImage').hide();
            jcrop_api.destroy();
            pcEditImage.Hide();
            fm.Refresh();
        };

        function ResetInputFileWM() {
            //   $('#originalImage').hide();
            //   jcrop_api.destroy();
            pcwm.Hide();
            fm.Refresh();
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="C1" runat="Server">
    <div class="divMain" style="height: 550px; overflow: auto">


        <dx:ASPxFileManager ID="fm" runat="server" OnFileUploading="ASPxFileManager1_FileUploading"  oninit="ASPxFileManager1_Init"
            ClientInstanceName="fm">
            <Border BorderWidth="0px" />
            <Settings RootFolder="~/UploadImages/shops" ThumbnailFolder="~/UploadImages/Thumb" />
            <SettingsUpload Enabled="true" ValidationSettings-GeneralErrorText="" UseAdvancedUploadMode="true" AdvancedModeSettings-EnableMultiSelect="true"></SettingsUpload>
            <%--<SettingsEditing AllowCreate="true" AllowMove="true" AllowRename="true" AllowDelete="true"/>
<SettingsToolbar ShowDownloadButton="true"/>--%>
            <Styles>
                <%--<FolderContainer Width="150px">
            </FolderContainer>--%>
                <UploadPanel Paddings-Padding="0" Paddings-PaddingLeft="0" Paddings-PaddingRight="0">
                </UploadPanel>
                <LoadingPanel Paddings-PaddingLeft="0" Paddings-PaddingRight="0"></LoadingPanel>
            </Styles>
            <%-- <SettingsUpload Enabled="false"></SettingsUpload>--%>
            <%--<SettingsFileList ThumbnailsViewSettings-ThumbnailSize="100" DetailsViewSettings-AllowColumnDragDrop="true" DetailsViewSettings-ThumbnailSize="100"></SettingsFileList>--%>
            <ClientSideEvents SelectedFileChanged="fileSelectChanged" ErrorOccurred="function(s,e){  fm.Refresh();}" />
        </dx:ASPxFileManager>
        <table style="float: left;">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tên File:">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="tbFileName" runat="server" Width="150px" CssClass="float" ClientInstanceName="tbFileName">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxCheckBox ID="txtCheckLogo" Checked="true" Text="Tự động chèn logo" TextAlign="Right" runat="server" ClientInstanceName="txtCheckLogo" CssClass="InputText" Width="100px"></dx:ASPxCheckBox>
                </td>
                <td>
                    <dx:ASPxCheckBox ID="txtCheckReduce" Checked="true" Text="Tự động nén hình ảnh" TextAlign="Right" runat="server" ClientInstanceName="txtCheckReduce" CssClass="InputText" Width="150px"></dx:ASPxCheckBox>
                </td>
                <td>
                    <a href="#" onclick="AddLogo();return false;">Chèn logo bằng tay</a>
                </td>
            </tr>
        </table>
        <table align="right">
            <tr>
                <td>
                    <dx:ASPxButton ID="btnOk" runat="server" Text="Chọn" AutoPostBack="false">
                        <ClientSideEvents Click="function() { setPictureLink(); }" />
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Hủy" AutoPostBack="false">
                        <ClientSideEvents Click="function() { window.parent.pcSaveAs.Hide(); }" />
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>



        <dx:ASPxPopupControl ID="pcEditImage" runat="server" ClientInstanceName="pcEditImage" CloseAction="CloseButton"
            AllowDragging="true" PopupHorizontalAlign="WindowCenter"
            ShowMaximizeButton="true" Modal="true" HeaderText="Chỉnh sửa ảnh có sẵn" Width="100%"
            Height="667px" PopupVerticalAlign="WindowCenter">
            <ClientSideEvents CloseButtonClick=" function(s,e){ jcrop_api.destroy();s.PerformCallback();}" />
            <ContentStyle Paddings-Padding="1px">
                <Paddings Padding="0px"></Paddings>
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>

                                <div style="overflow: auto;" id="imgContainer">
                                    <img src="" alt="My auto" title="That's my auto" id="originalImage" />
                                </div>
                                <div style="background: #ececec">
                                    X1
                                    <input type="text" size="4" id="x1" name="x1" class="coor" readonly="readonly" />
                                    Y1
                                    <input type="text" size="4" id="y1" name="y1" class="coor" readonly="readonly" />
                                    X2
                                    <input type="text" size="4" id="x2" name="x2" class="coor" readonly="readonly" />
                                    Y2
                                    <input type="text" size="4" id="y2" name="y2" class="coor" readonly="readonly" />
                                    W
                                    <input type="text" size="4" id="w" name="w" class="coor" readonly="readonly" />
                                    H
                                    <input type="text" size="4" id="h" name="h" class="coor" readonly="readonly" />
                                </div>
                                <div>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel_Luu" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <asp:Button runat="server" ID="btnCrop" OnClick="btnCrop_Click" Text="Lưu ảnh đã cắt" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                            </td>

                        </tr>
                    </table>

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
      <dx:ASPxPopupControl ID="pcwm" runat="server" ClientInstanceName="pcwm" CloseAction="CloseButton"
            AllowDragging="true" PopupHorizontalAlign="WindowCenter"
            ShowMaximizeButton="true" Modal="true" HeaderText="Chèn logo ảnh có sẵn" Width="100%"
            Height="600px" PopupVerticalAlign="TopSides">
            <ClientSideEvents CloseButtonClick=" function(s,e){s.PerformCallback();}" />
            <ContentStyle Paddings-Padding="1px">
                <Paddings Padding="0px"></Paddings>
            </ContentStyle>
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td>

                                <div style="overflow: auto;" id="Div1">
                                    <img id="watermarked">
                                </div>
                                <div style="background: #ececec">
                                    X
                                    <input type="text" size="4" id="wmx" name="wmx" class="coor" readonly="readonly" />
                                    Y
                                    <input type="text" size="4" id="wmy" name="wmy" class="coor" readonly="readonly" />

                                    W
                                    <input type="text" size="4" id="wmw" name="wmw" class="coor" readonly="readonly" />
                                    H
                                    <input type="text" size="4" id="wmh" name="wmh" class="coor" readonly="readonly" />
                                </div>
                                <div>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                        <ContentTemplate>

                                            <asp:Button runat="server" ID="btnWatermark" OnClick="btnWatermark_Click" Text="Lưu ảnh" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                            </td>

                        </tr>
                    </table>


                    <link type="text/css" href="/js/ui/jquery.ui.core.css?t=16" rel="stylesheet">
                    <link type="text/css" href="/js/ui/jquery.ui.theme.css?t=16" rel="stylesheet">
                    <link type="text/css" href="/js/ui/jquery.ui.resizable.css?t=16" rel="stylesheet">


                    <script type="text/javascript" src="/js/ui/jquery.ui.core.min.js?t=16"></script>
                    <script type="text/javascript" src="/js/ui/jquery.ui.draggable.min.js?t=16"></script>
                    <script type="text/javascript" src="/js/ui/jquery.ui.resizable.min.js?t=16"></script>
                    <script type="text/javascript" src="/js/ui/jquery.watermarker.js?t=18"></script>
                    <style type="text/css">
                        div.watermark
                        {
                            border: 1px dashed #000;
                        }

                        img.watermark:hover
                        {
                            cursor: move;
                        }
                    </style>
                    <script type="text/javascript">
                        function AddLogo() {
                            var file = fm.GetSelectedFile();
                            linkImageWM = "../../UploadImages/" + file.GetFullName().replace(/\\/g, "/");
                            imgwm.src = "../../UploadImages/" + file.GetFullName().replace(/\\/g, "/") + "?t=" + (new Date().getTime());
                            imgwm.onload = function () {
                                if (imgwm.src != "") {
                                    var height = imgwm.height;
                                    var width = imgwm.width;


                                    pcwm.SetSize(800, 500);
                                    pcwm.Show();
                                    window.parent.pcSaveAs.SetMaximized(true);
                                    //    document.getElementById('originalImage').src = img.src;
                                    document.getElementById('watermarked').src = imgwm.src;
                                    imgwm.src = "";
                                    $('#imgWMed').val(linkImageWM);
                                    InitImages(cfwidth, cfheight, width, height, imagelogo);





                                }

                            }

                        }
                        function InitImages(rw, rh, w, h, image) {
                            $().ready(function () {
                                image = "/" + image;
                                $('#watermarked').Watermarker(
                                {
                                    watermark_img: image,
                                    x: 100,
                                    y: 100,
                                    w: 290,
                                    h: 50,
                                    opacity: 1,
                                    position: 'bottomright',
                                    onChange: showwmCoords
                                });
                                $(window).scrollTop(9999);
                                $(window).scrollLeft(9999);
                            });
                        }
                        function showwmCoords(c) {
                            $('#wmx').val(c.x);
                            $('#wmy').val(c.y);
                            $('#wmw').val(c.w);
                            $('#wmh').val(c.h);
                        };


                    </script>



                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <input type="hidden" name="imgCropped" id="imgCropped" />
        <input type="hidden" name="imgWMed" id="imgWMed" />
    </div>

</asp:Content>
