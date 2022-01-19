<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" inherits="Modules_Contact_main, App_Web_ckrz5dpf" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" maxPageStateFieldLength="50000" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title id="title">Công ty TNHH Thành Công | Liên hệ</title>
    <script src="/js/loadpage-ajax.js"></script>
    <script>
        $(function () {
            $('.contain-main').addClass('contact');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Banner_Slider" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Left" runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="box-inner sub-cate _lib-mg-bt-10 _lib-bg-w">
        <h3 class="cate">liên hệ</h3>
        <div class="_lib-mg-t-10 contact">
            <div class="info">
                <div><b>CÔNG TY TNHH THÀNH CÔNG</b></div>
                <div><b>Địa chỉ: </b>182 Lê Duẩn - P.Trường Thi - TP.Vinh</div>
                <div><b>HOTLINE: </b>0988838275 - 0987654321</div>
                <div><b>Email: </b>nguyenbathanh88888@gmail.com</div>

                <div class="col6 map">
                    <img src="/images/map.png" alt="" />
                </div>
                <div class="col6 contact-form" id="contact_form">
                   
                    <div>
                        <div>
                            <span>Họ và tên(*)</span>
                            <div class="ic-user ic-contact">
                                <input id="contact-name" onkeyup="validateName();" type="text" value="" name="text" placeholder="Nhập họ và tên liên hệ" />
                                <span class="_lib-fl-r error-message" id="name-error"></span>
                            </div>
                        </div>
                        <div>
                            <span>Email(*)</span>
                            <div class="ic-email ic-contact">
                                <input id="contact-email" onkeyup="validateEmail();" type="text" value="" name="text" placeholder="Nhập địa chỉ Email" />
                                <span class="_lib-fl-r error-message" id="email-error"></span>
                            </div>
                        </div>
                        <div>
                            <span>Số điện thoại(*)</span>
                            <div class="ic-phone ic-contact">
                                <input id="contact-phone" onkeyup="validatePhone()" type="text" value="" name="text" placeholder="Nhập số điện thoại" />
                                <span class="_lib-fl-r error-message" id="phone-error"></span>
                            </div>
                        </div>
                        <div>
                            <span>Địa chỉ</span>
                            <div class="ic-address ic-contact">
                                <input type="text" value="" name="text" placeholder="Nhập địa chỉ" />
                            </div>
                        </div>
                        <div>
                            <span>Tiêu đề(*)</span>
                            <div class="ic-title ic-contact">
                                <input id="contact-title" onkeyup="validateTitle();" type="text" value="" name="text" placeholder="Nhập tiêu đề" />
                                <span class="_lib-fl-r error-message" id="title-error"></span>
                            </div>
                        </div>
                        <div>
                            <span>Nội dung(*)</span>
                            <textarea id="contact-message" rows="4" placeholder="Nhập nội dung liên hệ" onkeyup="validateMessage();"></textarea>
                            <span class="_lib-fl-r error-message" id="message-error"></span>
                        </div>
                        <div>
                            
                            <input id="contact-submit" onclick="return validateForm();" type="submit" value="Gửi liên hệ" name="text" />
                            <span class="_lib-fl-r error-message" id="submit-error"></span>
                            <input type="reset" value="Viết lại" name="text" />
                        </div>
                    </div>
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Right" runat="Server">
    <div class="box-inner _lib-bg-w">
        <h3 class="cate">Thông tin liên hệ</h3>
        <div class="_info_contact">
            <div class="_name_company">
                Công ty TNHH Thành Công
            </div>
            <div>
                <i class="fa fa-map-marker fi-contact"></i>
                <span>182 Lê Duẩn - P.Trường Thi - TP.Vinh</span>
            </div>
            <div>
                <i class="fa fa-envelope-o fi-contact"></i>
                <span>nguyenbathanh88888@gmail.com</span>
            </div>
            <div>
                <i class="fa fa-phone fi-contact"></i>
                <span>0988838275 - 0987654321</span>
            </div>
        </div>
    </div>
</asp:Content>

