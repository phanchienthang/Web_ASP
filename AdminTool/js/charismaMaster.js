

$(document).ready(function () {
   


    
   
 
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
   
}
document.addEventListener("keydown", keyDownTextField, false);

function keyDownTextField(e) {
    var keyCode = e.keyCode;
    if (keyCode == 27) {

        if (window.parent.p1) {
            window.parent.btnBlueBall.DoClick();
        }
    }
}
function ieClicked() {
    if (document.all) {
        return false;
    }
}

function firefoxClicked(e) {
    if (document.layers || (document.getElementById && !document.all)) {
        if (e.which == 2 || e.which == 3) {
            return false;
        }
    }
}
if (document.layers) {
    document.captureEvents(Event.MOUSEDOWN);
    document.onmousedown = firefoxClicked;
} else {
    document.onmouseup = firefoxClicked;
    document.oncontextmenu = ieClicked;
}
document.oncontextmenu = new Function("return false");



function isFormChanged() {

    var form = document.forms['form2'];
    var isChanged = false;
    for (var i = 0; i < form.length; i++) {
        switch (form.elements[i].type) {
            case "text":
                isChanged = isTextChanged(form.elements[i]);
                //                        if (isChanged == true) {
                //                            alert(form.elements[i].value.replace('.'/g, ""));
                //                        }
                break;
            case "select-one":
                isChanged = isSelectChangedOne(form.elements[i]);
                break;
            case "select-multiple":
                isChanged = isSelectChangedMul(form.elements[i]);
                break;
            case "radio":
                isChanged = isRadioChanged(form.elements[i]);
                break;
            case "checkbox":
                isChanged = isCheckChanged(form.elements[i]);
                break;
            case "textarea":
                isChanged = isTextAreaChanged(form.elements[i]);
                break;
        }
        if (isChanged) {
            break;
        }
    }
    return isChanged;
}


// ************************************************************************
// * Returns true if the select-one value has changed, else returns false.
// ************************************************************************
function isSelectChangedOne(selectbox) {
    var len = selectbox.options.length;
    var defaultIndex = -1;
    for (var i = 0; i < len; i++) {
        if (selectbox.options[i].defaultSelected) {
            defaultIndex = i;
            break;
        }
    }
    if (selectbox.size <= 1) {
        if (defaultIndex == -1 && selectbox.selectedIndex == 0) return false;
        return (defaultIndex == selectbox.selectedIndex) ? false : true;
    }
    else {
        return (defaultIndex == selectbox.selectedIndex) ? false : true;
    }
}
// ****************************************************************************
// * Returns true if the select-multiple value has changed, else returns false.
// ****************************************************************************
function isSelectChangedMul(selectbox) {
    var len = selectbox.options.length;
    for (var i = 0; i < len; i++) {
        if (selectbox.options[i].selected != selectbox.options[i].defaultSelected) {
            return true;
        }
    }
    return false;
}
// **********************************************************************
// * returns true if the text value has changed, else returns false.
// ********************************************************************** ((textBox.value.split('.').length - 1) == ((textBox.defaultValue-1) / 3))
function isTextChanged(textBox) {
    return (textBox.value == textBox.defaultValue || textBox.value.replace(/\./g, "") == textBox.defaultValue) ? false : true;

}
// ******************************************************************************
// * Returns true if the radio checked condition has changed, else returns false.
// ******************************************************************************
function isRadioChanged(radioButton) {
    return (radioButton.checked == radioButton.defaultChecked) ? false : true;
}
// *****************************************************************************
// * returns true if checkbox checked condition has changed, else returns false.
// *****************************************************************************
function isCheckChanged(checkBox) {
    return (checkBox.checked == checkBox.defaultChecked) ? false : true;
}
// **********************************************************************
// * returns true if the select value has changed else returns false
// **********************************************************************
function isTextAreaChanged(textAreaField) {
    return (textAreaField.defaultValue == textAreaField.value) ? false : true;
}
function isValid(str) {
    var iChars = "`$^*[]\\\'{}\<>";
    for (var i = 0; i < str.length; i++) {
        if (iChars.indexOf(str.charAt(i)) != -1) {
            return false;
        }
    }
    return true;
}
function confirmMessage(idCss, str, func) {
    window.parent.ConfirmMsg(idCss, str, func);
}
function alertN(stringTB, func) {
    window.parent.StylesMsg('warning', stringTB, func);
}
function alertTB(stringTB, func) {
    window.parent.StylesMsg('warning', stringTB, func);
}

function alertE(stringTB, func) {
    window.parent.StylesMsg('Error', stringTB, func);
}
function alertConnect(stringTB, func) {
    window.parent.StylesMsg('Connect', stringTB, func);
}
function confirmE(func) {
    window.parent.StylesMsg('exit', '', func);
}
function confirmA(str, func) {
    window.parent.StylesConfirm('confirm', str, func);
}
function alertSM(stringTB, func) {
    window.parent.StylesMsg('Money', stringTB, func);
}
function alertS(stringTB, func) {
    window.parent.StylesMsg('successS', stringTB, func);
}
function alertU(stringTB, func) {
    window.parent.StylesMsg('successU', stringTB, func);
}
function getCookie(c_name) {
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            return unescape(y);
        }
    }
}
function setCookie(c_name, value, exdays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
    document.cookie = c_name + "=" + c_value;
}



function locdau(str) {

    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    str = str.replace(/!|@|\$|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\'| |\"|\&|\#|\[|\]|~|\“|\”/g, "-");
    str = str.replace(/-+-/g, "-"); //thay thế 2- thành 1-
    str = str.replace(/^\-+|\-+$/g, ""); //cắt bỏ ký tự - ở đầu và cuối chuỗi
    return str;
}
