/* SET TITLE PAGE */
function setTitle(str) {
    var title = document.getElementById("title");
    if (title) {
        title.innerHTML = str;
    }
}

/* CHECK WEBSITE SCROLL */
$(function () {
    var dHeight = $(document).height();
    var wHeight = $(window).height();
    if (dHeight <= wHeight) {
        $('#_body').css('overflow', 'auto');
    }
});

/* POPUP ERROR */

$(function () {
    $('._btncart').live('click', function (e) {
        e.preventDefault();
        $('#popup').addClass('visible');
    });
    $('._cart_count').live('click', function (e) {
        e.preventDefault();
        $('#popup').addClass('visible');
    });
    $('.popup-close').click(function (e) {
        e.preventDefault();
        $('#popup').removeClass('visible');
    });
});

/* SCROLL TO TOP */
$(function () {

    // hide #back-top first
    $("#back-top").hide();

    // fade in #back-top
    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('#back-top').fadeIn();
            } else {
                $('#back-top').fadeOut();
            }
        });

        // scroll body to 0px on click
        $('#back-top a').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
    });

});

/* MENU TOP FIXED WHEN SCROLL TO TOP */
$(function () {
    var width = $(window).width();
    if (width >= 930) {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 150) {
                $('.menu').addClass('menufx');
            } else {
                $('.menu').removeClass('menufx');
            }
        });
    }
});

/* SUPPORT ICON */
$(function () {
    var dur = "medium";
    $(".hotline").css({ right: -248 });
    $('.hotline').hover(function () {
        $(this).stop().animate({ right: 0 }, "medium");
    }, function () {
        $(this).stop().animate({ right: -248 }, "medium");
    });

    $(".payment").css({ right: -182 });
    $('.payment').hover(function () {
        $(this).stop().animate({ right: 0 }, "medium");
    }, function () {
        $(this).stop().animate({ right: -182 }, "medium");
    });

    $(".shipping").css({ right: -138 });
    $('.shipping').hover(function () {
        $(this).stop().animate({ right: 0 }, "medium");
    }, function () {
        $(this).stop().animate({ right: -138 }, "medium");
    });
});

/* ADD CLASS ACTIVE MENU */
$(function () {
    //alert(window.location.href);
    var pgurl = window.location.href.substr(window.location.href.lastIndexOf('/'));
    //alert(pgurl);
    $("#nav li a").each(function (e) {
        //e.preventDefault();
        if ($(this).attr('href') == pgurl || $(this).attr('href') == '' || $(this).attr('href') == null)
            $(this).closest('li').addClass('active');
    })
});

/* LOAD MORE MENU LEFT */

$(function () {
    $('#new-product li:lt(2)').show();
    $('#showLess').hide();
    var items = 5;
    var shown = 2;
    $('#loadMore').click(function () {
        $('#showLess').show();
        shown = $('#new-product li:visible').size() + 2;
        if (shown < items) { $('#new-product li:lt(' + shown + ')').show(); }
        else {
            $('#new-product li:lt(' + items + ')').show();
            $('#loadMore').hide();
        }
    });
    $('#showLess').click(function () {
        $('#new-product li').not(':lt(2)').hide();
        $('#loadMore').show();
        $('#showLess').hide();
    });
});

/* ADD ANIMATES WHEN SCROLLING */
//var $animation = $('.list-prd .item');

//function scrolling() {
//    var window_bottom_pos = ($(window).scrollTop() + $(window).height());

//    $.each($animation, function () {
//        var element_bottom_pos = ($(this).outerHeight() + $(this).outerHeight());


//        if ((element_bottom_pos >= $(window).scrollTop()) &&
//          ($(this).outerHeight() <= window_bottom_pos)) {
//            $(this).addClass('in-view');
//        } else {
//            $(this).removeClass('in-view');
//        }
//    });
//}

//$(window).on('scroll resize', scrolling);
//$(window).trigger('scroll');




/* CALCULATOR HEIGHT*/
$(function () {
    function fixHeights() {
        var heights = new Array();

        $('.list-prd .item > div').each(function () {
            heights.push($(this).height());
        });

        var max = Math.max.apply(Math, heights);

        $('.list-prd .item > div').each(function () {
            $(this).css('height', max + 'px');
        });
    }

    $(window).load(function () {
        fixHeights();

        $(window).resize(function () {
            setTimeout(function () {
                fixHeights();
            }, 120);
        });
    });
});

/* SORT BY PRICE, ALPHABET */
$(function () {
    $('select.select_styled.white_select[name="sort_list"]').change(function () {
        var arr = [];
        var by = this.selectedIndex;
        var items = $("._product");
        var val, temp;
        items.each(function () {
            if (by == 0 || by == 1) {
                val = $(this).find('.offer_price').text();
                val = val.replace('.', '') | 0;
            } else if (by == 2 || by == 3) {
                val = $(this).find('p a').text();
            }
            arr.push({
                v: val,
                t: this
            });
        });
        arr.sort(function (a, b) {
            if (by === 0) {
                return -((a.v < b.v) ? +1 : ((a.v > b.v) ? -1 : 0));
            } else if (by === 1) {
                return (a.v < b.v) ? +1 : ((a.v > b.v) ? -1 : 0);
            } else if (by === 2) {
                return a.v.localeCompare(b.v);
            } else if (by === 3) {
                return -a.v.localeCompare(b.v);
            }
        });
        $(arr).each(function () {
            $('.list_item_product').append(this.t);
        });
    }).trigger('change');
});


/* CONTACT VALIDATION */
function validateName() {

    var name = document.getElementById('contact-name').value;
    if (name.length == 0) {

        producePrompt('<i class="fa fa-times err" title="Tên không được để trống"></i>', 'name-error');
        return false;

    }

    if (!name.match(/^[A-Za-z ]*/)) {

        producePrompt('<i class="fa fa-times err" title="Vui lòng nhập họ và tên"></i>', 'name-error');
        return false;
    }

    producePrompt('<i class="fa fa-check" title="Tên hợp lệ"></i>', 'name-error');
    return true;

}

function validateEmail() {

    var email = document.getElementById('contact-email').value;

    if (email.length == 0) {

        producePrompt('<i class="fa fa-times err" title="Email không được để trống"></i>', 'email-error');
        return false;

    }

    if (!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/)) {

        producePrompt('<i class="fa fa-times err" title="Email không đúng định dạng"></i>', 'email-error');
        return false;

    }

    producePrompt('<i class="fa fa-check" title="Email hợp lệ"></i>', 'email-error');
    return true;

}

function validatePhone() {

    var phone = document.getElementById('contact-phone').value;

    if (phone.length == 0) {
        producePrompt('<i class="fa fa-times err" title="Số điện thoại không được để trống"></i>', 'phone-error');
        return false;
    }

    if (phone.length < 10 && phone.length > 11) {
        producePrompt('<i class="fa fa-times err" title="Số điện thoại phải từ 10 đến 11 số"></i>', 'phone-error');
        return false;
    }

    if (!phone.match(/^[0-9]{10,11}$/)) {
        producePrompt('<i class="fa fa-times err" title="Số điện thoại đúng định dạng"></i>', 'phone-error');
        return false;
    }

    producePrompt('<i class="fa fa-check" title="Số điện thoại hợp lệ"></i>', 'phone-error');
    return true;

}

function validateTitle() {

    var title = document.getElementById('contact-title').value;

    if (title.length == 0) {
        producePrompt('<i class="fa fa-times err" title="Tiêu đề không được để trống"></i>', 'title-error');
        return false;
    }
    if (title.length > 100) {
        producePrompt('<i class="fa fa-times err" title="Tiêu đề không được dài quá 100 kí tự"></i>', 'title-error');
    }
    producePrompt('<i class="fa fa-check" title="Tiêu đề hợp lệ"></i>', 'title-error');
    return true;

}

function validateMessage() {
    var message = document.getElementById('contact-message').value;
    var required = 30;
    var left = required - message.length;

    if (left > 0) {
        producePrompt('<i class="fa fa-times err" title="Nội dung gửi phải nhiều hơn 30 ký tự"></i>', 'message-error');
        return false;
    }

    producePrompt('<i class="fa fa-check" title="Nội dung hợp lệ"></i>', 'message-error');
    return true;
}

function validateForm() {
    if (!validateName() || !validateEmail() || !validatePhone() || !validateTitle() || !validateMessage()) {
        jsShow('submit-error');
        producePrompt('Sửa lỗi để gửi liên hệ', 'submit-error');
        setTimeout(function () { jsHide('submit-error'); }, 2000);
        return false;
    }
    producePrompt('Liên hệ đã được gởi', 'submit-error');
    return true;
}

function jsShow(id) {
    document.getElementById(id).style.display = 'block';
}

function jsHide(id) {
    document.getElementById(id).style.display = 'none';
}

function producePrompt(message, promptLocation) {
    document.getElementById(promptLocation).innerHTML = message;
}

/* USER VALIDATION */
$(function () {
    var formModal = $('._user-modal'),
        formLogin = formModal.find('#_login'),
        formSignup = formModal.find('#_signup'),
        formForgotPassword = formModal.find('#_reset-password'),
        formModalTab = $('._switcher'),
        tabLogin = formModalTab.children('li').eq(0).children('a'),
        tabSignup = formModalTab.children('li').eq(1).children('a'),
        forgotPasswordLink = formLogin.find('._form-bottom-message a'),
        backToLoginLink = formForgotPassword.find('._form-bottom-message a'),
        mainNav = $('.group_head');

    //open modal
    mainNav.on('click', function (event) {
        $(event.target).is(mainNav) && mainNav.children('ul').toggleClass('is-visible');
    });

    //open sign-up form
    mainNav.on('click', '._signup', signup_selected);
    //open login-form form
    mainNav.on('click', '._signin', login_selected);

    //close modal
    formModal.on('click', function (event) {
        if ($(event.target).is(formModal) || $(event.target).is('._close-form')) {
            formModal.removeClass('is-visible');
        }
    });
    //close modal when clicking the esc keyboard button
    $(document).keyup(function (event) {
        if (event.which == '27') {
            formModal.removeClass('is-visible');
        }
    });

    //switch from a tab to another
    formModalTab.on('click', function (event) {
        event.preventDefault();
        ($(event.target).is(tabLogin)) ? login_selected() : signup_selected();
    });

    //hide or show password
    $('.hide-password').on('click', function () {
        var togglePass = $(this),
            passwordField = togglePass.prev().prev('input');
        ('text' == passwordField.prop('type')) ? passwordField.prop('type', 'password') : passwordField.prop('type', 'text');
        ('Hiện' == togglePass.text()) ? togglePass.text('Ẩn') : togglePass.text('Hiện');
        //focus and move cursor to the end of input field
        //passwordField.putCursorAtEnd();
    });

    //show forgot-password form 
    forgotPasswordLink.on('click', function (event) {
        event.preventDefault();
        forgot_password_selected();
    });

    //back to login from the forgot-password form
    backToLoginLink.on('click', function (event) {
        event.preventDefault();
        login_selected();
    });

    function login_selected() {
        mainNav.children('ul').removeClass('is-visible');
        formModal.addClass('is-visible');
        formLogin.addClass('is-selected');
        formSignup.removeClass('is-selected');
        formForgotPassword.removeClass('is-selected');
        tabLogin.addClass('selected');
        tabSignup.removeClass('selected');
    }

    function signup_selected() {
        mainNav.children('ul').removeClass('is-visible');
        formModal.addClass('is-visible');
        formLogin.removeClass('is-selected');
        formSignup.addClass('is-selected');
        formForgotPassword.removeClass('is-selected');
        tabLogin.removeClass('selected');
        tabSignup.addClass('selected');
    }

    function forgot_password_selected() {
        formLogin.removeClass('is-selected');
        formSignup.removeClass('is-selected');
        formForgotPassword.addClass('is-selected');
    }

    //REMOVE THIS - it's just to show error messages 

    function addError(findObj) {
        findObj.addClass('has-error');
        findObj.next('span').addClass('is-visible');
    }

    function removeError(findObj) {
        findObj.removeClass('has-error');
        findObj.next('span').removeClass('is-visible');
    }

    // Signin Validate
    $('#signin-email').blur(function () {
        var email = $(this).val();
        var f_email = $(this);

        if (email == 'heo95konichiwa@gmail.com') {
            removeError(f_email);
            return true;
        } else if (email.length == 0) {
            addError(f_email);
            $(this).next('span').text('Email không được để trống!');
            return false;
        } else if (!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\._]{2,10}$/)) {
            //alert(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\._]{2,10}$/));
            addError(f_email);
            $(this).next('span').text('Email không đúng định dạng!');
            return false;
        } else if (email != 'heo95konichiwa@gmail.com') {
            addError(f_email);
            $(this).next('span').text('Email chưa được đăng ký');
            return false;
        }
    });

    $('#signin-password').blur(function () {
        var password = $(this).val();
        var f_pass = $(this);

        if (password.length == 0) {
            addError(f_pass);
            $(this).next('span').text('Mật khẩu không được để trống!');
            return false;
        } else {
            removeError(f_pass);
            return true;
        }
    });

    formLogin.find('input[type="submit"]').click(function (e) {
        e.preventDefault();
        var email = $('#signin-email').val();
        var password = $('#signin-password').val();
        var f_email = formLogin.find('#signin-email');
        var f_pass = formLogin.find('#signin-password');

        if (email == 'heo95konichiwa@gmail.com' && password == '10061995') {
            removeError(f_email);
            removeError(f_pass);
            alert('Đăng nhập thành công!');
            $('._user-modal').removeClass('is-visible');
            return true;
        } else if (email.length == 0) {
            addError(f_email);
            f_email.next('span').text('Email không được để trống!');
            return false;
        } else if (!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\.]{2,10}$/)) {
            //alert(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\._]{2,10}$/));
            addError(f_email);
            f_email.next('span').text('Email không đúng định dạng!');
            return false;

        } else if (email != 'heo95konichiwa@gmail.com') {
            addError(f_email);
            f_email.next('span').text('Email chưa được đăng ký');
            return false;
        } else if (password.length == 0) {
            addError(f_pass);
            f_pass.next('span').text('Mật khẩu không được để trống!');
            return false;
        } else if (password != '10061995') {
            addError(f_pass);
            f_pass.next('span').text('Sai mật khẩu!');
            return false;
        }
    });

    // Regesiter Validate
    $('#signup-email').blur(function () {
        var email = $(this).val();
        var f_email = $(this);

        if (email.length == 0) {
            addError(f_email);
            $(this).next('span').text('Email không được để trống!');
            return false;
        } else if (!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\._]{2,10}$/)) {
            //alert(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\._]{2,10}$/));
            addError(f_email);
            $(this).next('span').text('Email không đúng định dạng!');
            return false;
        } else if (email == 'heo95konichiwa@gmail.com') {
            addError(f_email);
            $(this).next('span').text('Email đã được đăng ký');
            return false;
        } else {
            removeError(f_email);
            return true;
        }
    });
    $('#signup-password').blur(function () {
        var password = $(this).val();
        var f_pass = $(this);

        if (password.length == 0) {
            addError(f_pass);
            $(this).next('span').text('Mật khẩu không được để trống!');
            return false
        } else if (password.length < 4) {
            addError(f_pass);
            $(this).next('span').text('Mật khẩu quá ngắn!');
            return false;
        } else {
            removeError(f_pass);
            return true;
        }
    });

    formSignup.find('input[type="submit"]').click(function (e) {
        e.preventDefault();
        var username = $('signup-username').val();
        var email = $('#signup-email').val();
        var password = $('#signup-password').val();
        var accept_terms = $('#accept-terms').prop('checked');
        var f_email = formSignup.find('#signup-email');
        var f_pass = formSignup.find('#signup-password');

        //alert(accept_terms);
        if (email != 'heo95konichiwa@gmail.com' && password.length >= 4 && accept_terms == true) {
            removeError(f_email);
            removeError(f_pass);
            alert('Đăng ký thành công!');
            $('._user-modal').removeClass('is-visible');
            return true;
        } else if (email.length == 0) {
            addError(f_email);
            formSignup.find('#signup-email').next('span').text('Email không được để trống!');
            return false;
        } else if (!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\.]{2,10}$/)) {
            //alert(!email.match(/^[A-Za-z\._\-[0-9]*[@][A-Za-z]*[\.][a-z\._]{2,10}$/));
            addError(f_email);
            formSignup.find('#signup-email').next('span').text('Email không đúng định dạng!');
            return false;
        } else if (email == 'heo95konichiwa@gmail.com') {
            addError(f_email);
            formSignup.find('#signup-email').next('span').text('Email đã được đăng ký');
            return false;
        } else if (password.length == 0) {
            addError(f_pass);
            formSignup.find('#signup-password').next('span').text('Mật khẩu không được để trống!');
            return false;

        } else if (password.length < 4) {
            addError(f_pass);
            formSignup.find('#signup-password').next('span').text('Mật khẩu quá ngắn!');
            return false;
        } else if (accept_terms == false) {
            formSignup.find('#accept-terms').next('span').addClass('is-visible');
            formSignup.find('#accept-terms').next('span').text('Bạn phải đồng ý với điều khoản!');
            return false;
        }
    });

});

/* MENU RESPONSIVE */
$(function () {
    var ww = document.body.clientWidth;
    var menuWidth = $('.menu').width();
    //alert(ww);
    //alert(menuWidth);
    $(".toggleMenu").click(function (e) {
        e.preventDefault();
        $(this).toggleClass("active");
        $(".nav").toggle();
    });
    $(window).bind('resize orientationchange', function () {
        ww = document.body.clientWidth;
        adjustMenu();
    });

    var adjustMenu = function () {
        if (ww < 929) {
            $(".toggleMenu").css("display", "block");
            $(".nav").hide();
            if (!$(".toggleMenu").hasClass("active")) {
                $(".nav").animate(function () {
                    $(this).hide();
                });
            } else {
                $(".nav").animate(function () {
                    $(this).show();
                });
            }
            $(".nav li").unbind('mouseenter mouseleave');
            $(".nav li a.parent").unbind('click').bind('click', function (e) {
                // must be attached to anchor element to prevent bubbling
                e.preventDefault();
                $(this).parent("li").toggleClass("hover");
            });
        }
        else if (ww >= 929) {
            $(".toggleMenu").css("display", "none");
            $(".nav").show();
            $(".nav li").removeClass("hover");
            $(".nav li a").unbind('click');
            $(".nav li").unbind('mouseenter mouseleave').bind('mouseenter mouseleave', function () {
                // must be attached to li so that mouseleave is not triggered when hover over submenu
                $(this).toggleClass('hover');
            });
        }
    }


    adjustMenu();
})