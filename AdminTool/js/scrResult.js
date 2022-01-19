/* ©2013 Style */
/* ©2013 130 Quang Trung - Hai Chau - Da Nang */

// Giao diện các form chính
function displayHeight125(id) {
    //alert('©2013 130 Quang Trung - Hai Chau - Da Nang');
    document.getElementById(id).style.height = (window.innerHeight - 900) + "px";
    document.getElementById(id).style.maxHeight = (window.innerHeight - 900) + "px";
    document.getElementById(id).style.minHeight = (window.innerHeight - 900) + "px";
}

function displayChoThue(id) {
    document.getElementById(id).style.height = (window.innerHeight - 480) + "px";
    document.getElementById(id).style.maxHeight = (window.innerHeight - 480) + "px";
}
function displayHeight160(id) {
    document.getElementById(id).style.height = (window.innerHeight - 200) + "px";
    document.getElementById(id).style.maxHeight = (window.innerHeight - 200) + "px";
}
function setReport() {
    return (window.innerHeight );
   //document.getElementById(id).style.height = (window.innerHeight - 100) + "px";
   //document.getElementById(id).style.maxHeight = (window.innerHeight - 100) + "px";
   
}
function displayTraCuu(id) {
    //alert(window.innerHeight - 260);
    document.getElementById(id).style.height = (window.innerHeight - 260) + "px";
    document.getElementById(id).style.maxHeight = (window.innerHeight - 260) + "px";
}
function displayHinhAnh(id) {
    if(document.getElementById(id)){
        document.getElementById(id).style.height = (window.innerHeight - 0) + "px";
        document.getElementById(id).style.minHeight = (window.innerHeight - 0) + "px";
        document.getElementById(id).style.maxHeight = (window.innerHeight - 0) + "px";
        //alert(window.innerHeight - 0);
    }
}

/*##############################################################################
  thiết lập show hide dành cho những form có chiều cao chuẩn*/
function CheckNameClass(id) { 
    var getElementID = document.getElementById('ShowHide');
    var getClass = $(getElementID).attr('class');
    var hei;
    if (getClass == "show_hide") {
        hei = SetMinHeight(id);
        return hei;
    }
    else { hei = SetMaxHeight(id); return hei; }
}
//
function CheckNameClass_click(id) {
    var getElementID = document.getElementById('ShowHide');
    var getClass = $(getElementID).attr('class');
    var hei;
    if (getClass == "show_hide") {
        hei = SetMaxHeight(id);
        return hei;
    }
    else { hei = SetMinHeight(id); return hei; }
}
//
function SetMinHeight(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 585) + "px";
    document.getElementById(id).style.maxHeight = (h - 585) + "px";
    return (h - 585);
}
function SetMaxHeight(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 170 - 42) + "px";
    document.getElementById(id).style.maxHeight = (h - 170 - 42) + "px";
    //alert((window.innerHeight-160)+"__changeHeight");
    return (h - 170 - 42);
}

/*######################################## The end ######################################*/

/*##############################################################################
 Start _ dành riêng cho form Cấu Hình Ngày Mùa vì form này có kích thước chiều cao khác những form còn lại  */
function setCauHinhNgayMua(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 270) + "px";
    document.getElementById(id).style.maxHeight = (h - 270) + "px";
    return(h - 270);
}
function CheckNameClass_NgayMua(id) { 
    var getElementID = document.getElementById('ShowHide');
    var getClass = $(getElementID).attr('class');
    var hei;
    if (getClass == "show_hide") {
        hei = SetMinHeight_NgayMua(id);
        return hei;
    }
    else { hei = SetMaxHeight_NgayMua(id); return hei; }
}
//
function CheckNameClass_NgayMua_click(id) {
    var getElementID = document.getElementById('ShowHide');
    var getClass = $(getElementID).attr('class');
    var hei;
    if (getClass == "show_hide") {
        hei = SetMaxHeight_NgayMua(id);
        return hei;
    }
    else { hei = SetMinHeight_NgayMua(id); return hei; }
}
//
function SetMinHeight_NgayMua(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 270) + "px";
    document.getElementById(id).style.maxHeight = (h - 270) + "px";
    //alert(h);
    return (h - 270);
}
function SetMaxHeight_NgayMua(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 155) + "px";
    document.getElementById(id).style.maxHeight = (h - 155) + "px";
    //alert((window.innerHeight-160)+"__changeHeight");
    return (h - 155);
}
/* The End _ form Cấu Hình Ngày Mùa
##############################################################################*/

/*##############################################################################
 Start _ dành riêng cho form Hoạt Động Cho Thuê vì form này có kích thước chiều cao khác những form còn lại  */
function setHoatDongChoThue(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 275) + "px";
    document.getElementById(id).style.maxHeight = (h - 275) + "px";
    return(h - 275);
}
function CheckNameClass_ChoThue(id) { 
    var getElementID = document.getElementById('ShowHide');
    var getClass = $(getElementID).attr('class');
    var hei;
    if (getClass == "show_hide") {
        hei = SetMinHeight_ChoThue(id);
        return hei;
    }
    else { hei = SetMaxHeight_ChoThue(id); return hei; }
}
//
function CheckNameClass_ChoThue_click(id) {
    var getElementID = document.getElementById('ShowHide');
    var getClass = $(getElementID).attr('class');
    var hei;
    if (getClass == "show_hide") {
        hei = SetMaxHeight_ChoThue(id);
        return hei;
    }
    else { hei = SetMinHeight_ChoThue(id); return hei; }
}
//
function SetMinHeight_ChoThue(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 275) + "px";
    document.getElementById(id).style.maxHeight = (h - 275) + "px";
    return (h - 275);
}
function SetMaxHeight_ChoThue(id) {
    var h = Math.max(0, document.documentElement.clientHeight);
    document.getElementById(id).style.height = (h - 160) + "px";
    document.getElementById(id).style.maxHeight = (h - 160) + "px";
    //alert((window.innerHeight-160)+"__changeHeight");
    return (h - 160);
}
/* The End _ Hoạt Động Cho Thuê
##############################################################################*/