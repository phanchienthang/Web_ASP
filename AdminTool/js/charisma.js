

function changetidIndex(index) {

    setCookie("tid", index);

}
function allowTour(value) {
    isAllowDisplayTour = value;
    $.cookie('is-tour', value, { expires: 365 });
    if (value == 'true') {
        
        beginTour();
    }
}
$('#isstour').click(function (e) {
    alert('b');
    $.cookie('is-tour', !$(this).prop('checked'), { expires: 365 });
    if ($(this).prop('checked') == true) {
        alert('a');
        tour.end();
    }
});
function cancelTour(checked) {
  //  alert('b');
    $.cookie('is-tour', !checked, { expires: 365 });
    if (checked == true) {
      
        tour.end();
    }
}
var tour = new Tour();
function beginTour() {
    
   
   
     
   
    
    //tour.addStep({
    //    element: ".theme-container",
    //    placement: "bottom",
    //    title: "Thay đổi giao diện",
    //    content: "Thay đổi giao diện nếu muốn làm mới web trang của chính mình."
    //});
 
    //tour.addStep({
    //    element: ".user-container",
    //    placement: "bottom",
    //    title: " Quản lý người dùng ",
    //    content: " Cho phép người dùng quản lý thông tin cá nhân."
    //});
    tour.addStep({
        element: "#M1",
        placement: "bottom",
        title: "Backup dữ liệu",
        content: " Có thể hiểu là thao tác tạo một bản sao của dữ liệu gốc ra một nơi lưu trữ khác."
    });
    tour.addStep({
        element: "#M2",
        placement: "bottom",
        title: " Quản trị ",
        content: " Khi sử dụng chức năng này admin có thể quản lý cả hệ thống và nhân viên của mình."
    });
    tour.addStep({
        element: "#M15",
        placement: "bottom",
        title: " Cấu hình web",
        content: " Thay đổi cách bố trí của sản phẩm. Ví dụ như ban đầu cho phép hiển thị 3 sản phẩm, nếu dùng chức năng này admin có thể đổi lại thành hiển thị 5 sản phẩm hoặc nhiều hơn."
    });
    tour.addStep({
        element: "#M18",
        placement: "bottom",
        title: " Quản lý modules ",
        content: " Với chức năng này admin có thể cấu hình chức năng web theo ý muốn tức là cho phép hiển thị hoặc tắt những chức năng tương ứng với chức vụ."
    });
    tour.addStep({
        element: "#M53",
        placement: "bottom",
        title: "Hướng dẫn dùng tool admin",
        content: " Giúp người dùng sử dụng tool admin một cách dễ dàng và dễ hiểu bằng cách chia nhỏ từng module và hướng dẫn từng bước thực hiện."
    });

    tour.addStep({
        element: "ul.main-menu a:first",

        title: " Bàn làm việc ",
        content: " Hiển thị thông tin ngày tháng và những tin tức, sự kiện đang được quan tâm để người dùng biết được những gì đang xảy ra trên thế giới."
    });
   
   
    tour.restart();
//    tour.addStep({
//        element: ".theme-container",
//        placement: "left",
//        title: "Themes",
//        content: "You change your theme from here."
//    });
//    tour.addStep({
//        element: "#M2",
//        placement: "left",
//        title: " Quản trị ",
//                content: " Khi sử dụng chức năng này admin có thể quản lý cả hệ thống và nhân viên của mình.."
//});

//    tour.addStep({
//        element: "ul.main-menu a:first",
//        title: "Dashboard",
//        content: "This is your dashboard from here you will find highlights."
//    });


   
}


$(document).ready(function () {
    //themes, change CSS with JS
    //default theme(CSS) is cerulean, change it if needed
    //var isMenuToggle = $.cookie('is-menu-toggle') == null ? 'true' : $.cookie('is-menu-toggle');
    //if (isMenuToggle == 'false') {
    //    $("#sidebarbg").toggleClass("hided");
    //    $("#sidebar").toggleClass("hided");
    //    $("#content").toggleClass("hided");
    //}
    var isAllowDisplayTour = $.cookie('is-tour') == null ? 'true' : $.cookie('is-tour');

  
    if (isAllowDisplayTour == 'true' ) {
      
      //  var tour = new Tour();
       //tour.addStep({
       //     element: ".theme-container",
       //     placement: "bottom",
       //     title: "Thay đổi giao diện",
       //     content: "Thay đổi giao diện nếu muốn làm mới web trang của chính mình."
       //});
       //tour.addStep({
       //    element: ".user-container",
       //    placement: "bottom",
       //    title: " Quản lý người dùng ",
       //    content: " Cho phép người dùng quản lý thông tin cá nhân."
       //});
        tour.addStep({
            element: "#M1",
            placement: "bottom",
            title: "Backup dữ liệu",
            content: " Có thể hiểu là thao tác tạo một bản sao của dữ liệu gốc ra một nơi lưu trữ khác."
        });
        tour.addStep({
            element: "#M2",
            placement: "bottom",
            title: " Quản trị ",
            content: " Khi sử dụng chức năng này admin có thể quản lý cả hệ thống và nhân viên của mình."
        });
        tour.addStep({
            element: "#M15",
            placement: "bottom",
            title: " Cấu hình web",
            content: " Thay đổi cách bố trí của sản phẩm. Ví dụ như ban đầu cho phép hiển thị 3 sản phẩm, nếu dùng chức năng này admin có thể đổi lại thành hiển thị 5 sản phẩm hoặc nhiều hơn."
        });
        tour.addStep({
            element: "#M18",
            placement: "bottom",
            title: " Quản lý modules ",
            content: " Với chức năng này admin có thể cấu hình chức năng web theo ý muốn tức là cho phép hiển thị hoặc tắt những chức năng tương ứng với chức vụ."
        });
        tour.addStep({
            element: "#M53",
            placement: "bottom",
            title: "Hướng dẫn dùng tool admin",
            content: " Giúp người dùng sử dụng tool admin một cách dễ dàng và dễ hiểu bằng cách chia nhỏ từng module và hướng dẫn từng bước thực hiện."
        });
      
        tour.addStep({
            element: "ul.main-menu a:first",
        
            title: " Bàn làm việc ",
            content: " Hiển thị thông tin ngày tháng và những tin tức, sự kiện đang được quan tâm để người dùng biết được những gì đang xảy ra trên thế giới."
        });
      
        tour.start();
    }


    
   
    var defaultTheme = 'classic';

    var currentTheme = $.cookie('currentTheme') == null ? defaultTheme : $.cookie('currentTheme');
    var msie = navigator.userAgent.match(/msie/i);
    $.browser = {};
    $.browser.msie = {};
    switchTheme(currentTheme);

    $('.navbar-toggle').click(function (e) {
        e.preventDefault();
        $('.nav-sm').html($('.navbar-collapse').html());
        $('.sidebar-nav').toggleClass('active');
        $(this).toggleClass('active');
    });

    var $sidebarNav = $('.sidebar-nav');

    // Hide responsive navbar on clicking outside
    $(document).mouseup(function (e) {
        if (!$sidebarNav.is(e.target) // if the target of the click isn't the container...
            && $sidebarNav.has(e.target).length === 0
            && !$('.navbar-toggle').is(e.target)
            && $('.navbar-toggle').has(e.target).length === 0
            && $sidebarNav.hasClass('active')
            )// ... nor a descendant of the container
        {
            e.stopPropagation();
            $('.navbar-toggle').click();
        }
    });


    $('#themes a').click(function (e) {
        e.preventDefault();
        currentTheme = $(this).attr('data-value');
        $.cookie('currentTheme', currentTheme, { expires: 365 });
        switchTheme(currentTheme);
        location.reload(false);
    });


    function switchTheme(themeName) {
        if (themeName == 'classic') {
            $('#bs-css').attr('href', 'bower_components/bootstrap/dist/css/bootstrap.min.css');
        } else {
            $('#bs-css').attr('href', 'css/bootstrap-' + themeName + '.min.css');
        }

        $('#themes i').removeClass('glyphicon glyphicon-ok whitespace').addClass('whitespace');
        $('#themes a[data-value=' + themeName + ']').find('i').removeClass('whitespace').addClass('glyphicon glyphicon-ok');
    }

    //ajax menu checkbox
    $('#is-ajax').click(function (e) {
        $.cookie('is-ajax', $(this).prop('checked'), { expires: 365 });
    });
    $('#is-ajax').prop('checked', $.cookie('is-ajax') === 'true' ? true : false);

    //disbaling some functions for Internet Explorer
    if (msie) {
        $('#is-ajax').prop('checked', false);
        $('#for-is-ajax').hide();
        $('#toggle-fullscreen').hide();
        $('.login-box').find('.input-large').removeClass('span10');

    }


    //highlight current / active link
    $('ul.main-menu li a').each(function () {
        if ($($(this))[0].href == String(window.location).replace('#',''))
            $(this).parent().addClass('active');
    });

    //establish history variables

    //bind to State Change


    //ajaxify menus
    $('a.ajax-link').click(function (e) {
        checkNavigate = true;
        if (msie) e.which = 1;
        if (e.which != 1 || !$('#is-ajax').prop('checked') || $(this).parent().hasClass('active')) return;
        e.preventDefault();
        $('.sidebar-nav').removeClass('active');
        $('.navbar-toggle').removeClass('active');
        $('#loading').remove();
        $('#content').fadeOut().parent().append('<div id="loading" class="center">Loading...<div class="center"></div></div>');
        var $clink = $(this);
        History.pushState(null, null, $clink.attr('href'));
        $('ul.main-menu li.active').removeClass('active');
        $clink.parent('li').addClass('active');

    });

    $('.accordion > a').click(function (e) {
        e.preventDefault();
        var $ul = $(this).siblings('ul');
        var $li = $(this).parent();
        if ($ul.is(':visible')) $li.removeClass('active');
        else $li.addClass('active');
        $ul.slideToggle();
    });

    $('.accordion li.active:first').parents('ul').slideDown();

   
    $('#is-tour').prop('checked', $.cookie('is-tour') === 'false' ? true : false);


    //other things to do on document ready, separated for ajax calls
    docReady();
});



function docReady() {
    //prevent # links from moving to top
    $('a[href="#"][data-top!=true]').click(function (e) {
        e.preventDefault();
    });

    //notifications
    $('.noty').click(function (e) {
        e.preventDefault();
        var options = $.parseJSON($(this).attr('data-noty-options'));
        noty(options);
    });

    //chosen - improves select
  

   

    //tooltip
    $('[data-toggle="tooltip"]').tooltip();

   

    //popover
    $('[data-toggle="popover"]').popover();

    //iOS / iPhone style toggle switch
   

   
   

  

    

    //tour
//    if ($('.tour').length && typeof(tour) == 'undefined') {
//        var tour = new Tour();
//        tour.addStep({
//            element: "#content", /* html element next to which the step popover should be shown */
//            placement: "top",
//            title: "Custom Tour", /* title of the popover */
//            content: "You can create tour like this. Click Next." /* content of the popover */
//        });
//        tour.addStep({
//            element: ".theme-container",
//            placement: "left",
//            title: "Themes",
//            content: "You change your theme from here."
//        });
//        tour.addStep({
//            element: "ul.main-menu a:first",
//            title: "Dashboard",
//            content: "This is your dashboard from here you will find highlights."
//        });
//        tour.addStep({
//            element: "#for-is-ajax",
//            title: "Ajax",
//            content: "You can change if pages load with Ajax or not."
//        });
//        tour.addStep({
//            element: ".top-nav a:first",
//            placement: "bottom",
//            title: "Visit Site",
//            content: "Visit your front end from here."
//        });

//        tour.restart();
//    }

    //datatable
    //$('.datatable').dataTable({
    //    "sDom": "<'row'<'col-md-6'l><'col-md-6'f>r>t<'row'<'col-md-12'i><'col-md-12 center-block'p>>",
    //    "sPaginationType": "bootstrap",
    //    "oLanguage": {
    //        "sLengthMenu": "_MENU_ records per page"
    //    }
    //});
    $('.btn-close').click(function (e) {
        e.preventDefault();
        $(this).parent().parent().parent().fadeOut();
    });
    $('.btn-minimize').click(function (e) {
        e.preventDefault();
        var $target = $(this).parent().parent().next('.box-content');
        if ($target.is(':visible')) $('i', $(this)).removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
        else                       $('i', $(this)).removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
        $target.slideToggle();
    });
    $('.btn-setting').click(function (e) {
        e.preventDefault();
        $('#myModal').modal('show');
    });


   

}


(function () {
    var _h1 = document.getElementsByTagName('title')[0] || false; var product_name = ''; if (_h1) { product_name = _h1.textContent || _h1.innerText; } var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.src = '//live.vnpgroup.net/js/web_client_box.php?hash=d68d6e94ec8206beed62e50b0af98ac3&data=eyJzc29faWQiOjIxNjk5NzEsImhhc2giOiIyOTBjYzE2MDcyZGFmN2RiZGZjYjJiYzNmNDJmYTg2ZiJ9&pname=' + product_name; var s = document.getElementsByTagName('script'); s[0].parentNode.insertBefore(ga, s[0]);
})();


//additional functions for data table

//$.extend($.fn.dataTableExt.oPagination, {
//    "bootstrap": {
//        "fnInit": function (oSettings, nPaging, fnDraw) {
//            var oLang = oSettings.oLanguage.oPaginate;
//            var fnClickHandler = function (e) {
//                e.preventDefault();
//                if (oSettings.oApi._fnPageChange(oSettings, e.data.action)) {
//                    fnDraw(oSettings);
//                }
//            };

//            $(nPaging).addClass('pagination').append(
//                '<ul class="pagination">' +
//                    '<li class="prev disabled"><a href="#">&larr; ' + oLang.sPrevious + '</a></li>' +
//                    '<li class="next disabled"><a href="#">' + oLang.sNext + ' &rarr; </a></li>' +
//                    '</ul>'
//            );
//            var els = $('a', nPaging);
//            $(els[0]).bind('click.DT', { action: "previous" }, fnClickHandler);
//            $(els[1]).bind('click.DT', { action: "next" }, fnClickHandler);
//        },

//        "fnUpdate": function (oSettings, fnDraw) {
//            var iListLength = 5;
//            var oPaging = oSettings.oInstance.fnPagingInfo();
//            var an = oSettings.aanFeatures.p;
//            var i, j, sClass, iStart, iEnd, iHalf = Math.floor(iListLength / 2);

//            if (oPaging.iTotalPages < iListLength) {
//                iStart = 1;
//                iEnd = oPaging.iTotalPages;
//            }
//            else if (oPaging.iPage <= iHalf) {
//                iStart = 1;
//                iEnd = iListLength;
//            } else if (oPaging.iPage >= (oPaging.iTotalPages - iHalf)) {
//                iStart = oPaging.iTotalPages - iListLength + 1;
//                iEnd = oPaging.iTotalPages;
//            } else {
//                iStart = oPaging.iPage - iHalf + 1;
//                iEnd = iStart + iListLength - 1;
//            }

//            for (i = 0, iLen = an.length; i < iLen; i++) {
//                // remove the middle elements
//                $('li:gt(0)', an[i]).filter(':not(:last)').remove();

//                // add the new list items and their event handlers
//                for (j = iStart; j <= iEnd; j++) {
//                    sClass = (j == oPaging.iPage + 1) ? 'class="active"' : '';
//                    $('<li ' + sClass + '><a href="#">' + j + '</a></li>')
//                        .insertBefore($('li:last', an[i])[0])
//                        .bind('click', function (e) {
//                            e.preventDefault();
//                            oSettings._iDisplayStart = (parseInt($('a', this).text(), 10) - 1) * oPaging.iLength;
//                            fnDraw(oSettings);
//                        });
//                }

//                // add / remove disabled classes from the static elements
//                if (oPaging.iPage === 0) {
//                    $('li:first', an[i]).addClass('disabled');
//                } else {
//                    $('li:first', an[i]).removeClass('disabled');
//                }

//                if (oPaging.iPage === oPaging.iTotalPages - 1 || oPaging.iTotalPages === 0) {
//                    $('li:last', an[i]).addClass('disabled');
//                } else {
//                    $('li:last', an[i]).removeClass('disabled');
//                }
//            }
//        }
//    }
//});
