//-- caption hiển thị ở title msg
//---------------Set độ cao rộng tùy độ phân giải cho msg
//var w = (Math.max(0, document.documentElement.clientWidth))/3;
//var h = (Math.max(0, document.documentElement.clientHeight))/3;

/*-------------------------------
    Set độ cao rộng cố định cho msg */
var w = 500;
var h = 222;

var wScreen = Math.max(0, document.documentElement.clientWidth);
var hScreen = Math.max(0, document.documentElement.clientHeight);
//
  var pleft= (wScreen-w)/2;
  var ptop= (hScreen-h)/2;

function msgbox(caption, message, buttons, resfunc) {

    if (resfunc == undefined) resfunc = function () { return false; };

    var disablediv = document.createElement("div");
    disablediv.className = "disablediv";
    disablediv.setAttribute("class", "disablediv");

    document.body.appendChild(disablediv);

    msg = document.createElement("div");
    msg.className = "dvmsgbox";
    msg.setAttribute("class", "dvmsgbox");

    msg.disablediv = disablediv;
    msg.resfunc = resfunc;

    var strHTML = "<p class='msgboxtitle'><span class='caption'>" + caption + "</span>"
    strHTML += "<img src='js/msgbox/close.png' class='close' onclick=closemsgbox('btn_msgClose',this.parentNode.parentNode) /></p>"
    strHTML += "<p class='msgboxdesc'><span class='textcontent'>" + message + "</span></p>";
    msg.innerHTML = strHTML;

    if (buttons != undefined) {
        var btnArr = buttons.split(",");
        var btnGrp = document.createElement("p");
        btnGrp.className = "msgboxbuttons";
        btnGrp.setAttribute("class", "msgboxbuttons");

        for (i = btnArr.length - 1; i >= 0; i--) {
            var btn = document.createElement("input");
            btn.type = "button"
            btn.value = btnArr[i];
            btn.setAttribute("onclick", "closemsgbox(this.value,this.parentNode.parentNode)");
            btnGrp.appendChild(btn);
        }
        msg.appendChild(btnGrp);
    }

    document.body.appendChild(msg);
    return msg;
}
//--------------------------------------------------------------------
// close message box
function closemsgbox(btnval, msgobj) {
    
//    alert(btnval);
//    alert(msgobj);
    msgobj.resfunc(btnval, msgobj);
    document.body.removeChild(msgobj.disablediv);
    $('#msgbox').modal('hide');
    document.body.removeChild(msgobj);
}
function closemsgboxauto(msgobj) {

   
   
    document.body.removeChild(msgobj.disablediv);
    $('#msgbox').modal('hide');
    document.body.removeChild(msgobj);
}
//
var captionPublic = "Thông báo của Styles";

// Thông báo khi xảy ra lỗi giá trị nhập bị rỗng
//function StylesMsgNull(id,text,btnMsg)
//{
//    MsgBoxStyles(id, "Thông báo rỗng", text + " không được rỗng&nbsp;!", 'Tiếp tục', btnMsg);
//}



//------------------------------------------//-----------//-------------------------------------//
function MsgBoxStyles(id, caption, message, buttons, resfunc) {

    if (resfunc == undefined) resfunc = function () { return false; };
    if (id == "moreline")
    {   
        var morelineleft= (wScreen-800)/2;
        var morelinetop= (hScreen-250)/2;

        //div hidden all page phia duoi
        var disablediv = document.createElement("div");
        disablediv.className = "disablediv";
        disablediv.setAttribute("class", "disablediv"); //

        document.body.appendChild(disablediv);
        
        //dvmsgbox -> dvmsgmoreline
        msg = document.createElement("div");
        msg.className = "dvmsgmoreline";
        msg.setAttribute("id", "msgbox");
        msg.setAttribute("class", "modal fade dvmsgmoreline");

        msg.disablediv = disablediv;
        msg.resfunc = resfunc;

        var dialog = document.createElement("div");
        dialog.setAttribute("class", "modal-dialog");

        var content = document.createElement("div");
        //content.setAttribute("class", "modal-content dvmsgbox " + id);
        content.setAttribute("class", "modal-content " + id);

        var strHTML = "";
        strHTML += "<span class='textcontent'>" + message + "</span>";

        var str1 = strHTML;
        var header = document.createElement("div");
        header.setAttribute("class", "msgmoreline right modal-header");
        header.innerHTML = str1;

        var btn = document.createElement("div");
        btn.setAttribute("class", "modal-footer");
        if (buttons != undefined) {
            var btnArr = buttons.split(",");
            var btnGrp = document.createElement("div");
            btnGrp.className = "msgmorebuttons";
            btnGrp.setAttribute("class", "msgmorebuttons");

            for (i = btnArr.length - 1; i >= 0; i--) {
                var showbtn = document.createElement("input");
                showbtn.type = "button"
                showbtn.value = btnArr[i];
                showbtn.setAttribute("onclick", "closemsgbox(this.value,this.parentNode.parentNode.parentNode.parentNode.parentNode)");
                btnGrp.appendChild(showbtn);
            }
            btn.appendChild(btnGrp);
        }
        content.appendChild(header);
        content.appendChild(btn);
        dialog.appendChild(content);
        msg.appendChild(dialog);

    }
    else{
        var disablediv = document.createElement("div");
        disablediv.className = "disablediv";
        disablediv.setAttribute("class", "disablediv");
        
        document.body.appendChild(disablediv);

        msg = document.createElement("div");
        msg.className = "dvmsgbox";
        msg.setAttribute("id", "msgbox");
        msg.setAttribute("class", "modal fade " + id);

        msg.disablediv = disablediv;
        msg.resfunc = resfunc;
        var strHTML = "";
       
        var dialog = document.createElement("div");
        dialog.setAttribute("class", "modal-dialog");

        var content = document.createElement("div");
        content.setAttribute("class", "modal-content dvmsgbox "+ id);
       
        strHTML += "<span class='textcontent'>" + message + "</span>";

        var str1 = strHTML;
        var header = document.createElement("div");
        header.setAttribute("class", "modal-header");
        header.innerHTML = str1;

        //msg.appendChild(content);

        var btn = document.createElement("div");
        btn.setAttribute("class", "modal-footer");
        
        if (buttons != undefined) {
            var btnArr = buttons.split(",");
            var btnGrp = document.createElement("div");
            btnGrp.setAttribute("class", "msgboxbuttons");
            if (id != "success") {
                for (i = btnArr.length - 1; i >= 0; i--) {
                    var showbtn = document.createElement("input");
                    showbtn.type = "button"
                    showbtn.value = btnArr[i];
                    showbtn.setAttribute("onclick", "closemsgbox(this.value,this.parentNode.parentNode.parentNode.parentNode.parentNode)");
                    btnGrp.appendChild(showbtn);
                }
            }
            btn.appendChild(btnGrp);
        }
        
        content.appendChild(header);
        content.appendChild(btn);
        dialog.appendChild(content);
        msg.appendChild(dialog);
    }
    document.body.appendChild(msg);
    $('#msgbox').modal('show');
    if (id == "success") {
        setTimeout(function () {
            closemsgboxauto(msg);
        }, 700);
    }
   

    return msg;
}
//----------- Message new 22/07/2013----------------------------------------------------------------------------------
function ConfirmMsg(id,text,btnMsg)
{
    var idCss = "";
    var title = "";
    var msg = "";
    var btnArr = "";
    switch (id)
    {
        case "DoiNgay": 
            idCss = 'ChangeNgay';
            title = "Dời Ngày Hàng Hóa Đơn Hàng";
            msg = text;
            btnArr = "Có,Không";
            break;
        case "HuyHang":
            idCss = 'del';
            title = "Hủy Hàng Đơn Hàng";
            msg = text;
            btnArr = "Có,Không";
            break;
        case "XoaHangDH":
            idCss = 'deleteDH';
            title = "Xóa Đơn Hàng";
            msg = text;
            btnArr = "Có,Không";
            break;
        case "XoaHangHH":
            idCss = 'deleteHH';
            title = "Xóa Hàng Hóa của Đơn Hàng";
            msg = text;
            btnArr = "Có,Không";
            break;
        case "GiayToLuu":
            idCss = 'identification';
            title = "Giấy Tờ Lưu Đơn Hàng";
            msg = text;
            btnArr = "Có,Không";
            break;
        case "GiamGia":
            idCss = 'SaleOff';
            title = "Giảm Giá Đơn Hàng";
            msg = text;
            btnArr = "Tiếp Tục";
            break;
        case "hiddenDH":
            idCss = 'hiddenDH';
            title = "Ẩn Đơn Hàng đã trả hàng xong";
            msg = text;
            btnArr = "Có,Không";
            break;
        case "ExitChangeData":
            idCss = 'exitChangeData';
            title = "Thông báo thoát khi có sự thay đổi dữ liệu";
            msg = text;
            btnArr = "Có,Không";
            break;
        case "DelMoreLine":
            idCss = 'moreline';
            title = "giao diện riêng khi thông báo quá dài";
            msg = text;
            btnArr = "Tiếp tục";
            break;
        //thiết lập mặc định
        default:
            idCss = "exit";
            title = "title";
            msg =  "Xảy ra lỗi, vui lòng liên hệ qua email : info@styles.net.vn để được phục vụ tốt hơn!";
            btnArr = "Tiếp tục";
    }
    MsgBoxStyles(idCss, title, msg, btnArr , btnMsg);
}
//---------------------------------------------------------------------------------------------
function StylesMsg(id,text,btnMsg)
{
    var idCss = "";
    var title = "";
    var msg = "";
    var btnArr = "";
    if(id == "exit"){
   // MsgBoxStyles(id, "Thoát", "Bạn có chắc chắn thoát khỏi trang này không ?", 'Có,Không', btnMsg);
         idCss = id;
         title = "Thoát";
         msg = "Bạn có chắc chắn thoát khỏi trang này không ?";
         if(text!=""){
                   msg =text;
                 }
         btnArr = "Có,Không";
        }
        else{
        if(id == "nullvalue"){
            idCss = id;
            title = "titleNull";
            msg =  text + " không được rỗng&nbsp;!";
            btnArr = "Tiếp tục";
       // MsgBoxStyles(id, "titleNull", text + " không được rỗng&nbsp;!", 'Tiếp tục', btnMsg);
        }
        else
        {
            if (id == "Connect")
            {
                idCss = "Connect";
                title = "titleNull";
                msg =  text;
                btnArr = "Tiếp tục";
            }
        else{
            if(id == "warning"){
                 idCss = "nullvalue";
                 title = "title cảnh báo";
                 msg =  " Xảy ra lỗi trong quá trình thực hiện&nbsp;!";
                 if(text!=""){
                   msg =text;
                 }
                 btnArr = "Tiếp tục";
               // idMsg = "nullvalue"; // gán id để định nghĩa css
              //  MsgBoxStyles(idMsg, "title cảnh báo"," Xảy ra lỗi trong quá trình thực hiện&nbsp;!", 'Tiếp tục', btnMsg);
            }
            else{
            if(id == "Money"){
                 idCss = "Money";
                 title = "title thông báo liên quan đến tiền";
                 //msg =  text + " thành công&nbsp;!";
                 if (text == undefined){
                     msg ="Thành công&nbsp;!";
                 }
                 else{
                    if(text==""){
                        msg = "Lưu thành công&nbsp;!";
                    }else{
                        msg = text;
                    }
                 }
                 
                 btnArr = "Tiếp tục";
               // idMsg = "nullvalue"; // gán id để định nghĩa css
              //  MsgBoxStyles(idMsg, "title cảnh báo"," Xảy ra lỗi trong quá trình thực hiện&nbsp;!", 'Tiếp tục', btnMsg);
            }
            
            else{
                if(id == "successU"){
                    idCss = "success";
                    title = "title";
                    if (text == undefined){
                         msg ="Cập nhật thành công&nbsp;!";
                        }else{
                        if(text!=""){
                                msg =text;
                        }else{
                         msg ="Cập nhật thành công&nbsp;!";
                        }
                        }
                   // msg =  "Cập nhật thành công&nbsp;!";
                    btnArr = "Tiếp tục";
                  //  idMsg = "success";
                 //   MsgBoxStyles(idMsg, "title", "Cập nhật thành công&nbsp;!", 'Tiếp tục', btnMsg);
                }
                else
                {
                    if(id == "successS"){
                        idCss = "success";
                        title = "title";
                        if (text == undefined){
                         msg ="Lưu thành công&nbsp;!";
                        }else{
                            if(text!=""){
                                msg =text;
                            }else{
                                msg ="Lưu thành công&nbsp;!";
                            }
                        }
                        btnArr = "Tiếp tục";
                      //  idMsg = "success";
                       // MsgBoxStyles(idMsg, "title", "Lưu thành công&nbsp;!", 'Tiếp tục', btnMsg);
                    }
                    else
                    {
                        if(id == "Error"){
                            idCss = "exit";
                            title = "title";
                            msg =  text;
                            btnArr = "Tiếp tục";
                        }
                    }
                }
            }
        }
    } }
    }
     MsgBoxStyles(idCss, title, msg, btnArr , btnMsg);
}
function StylesConfirm(id,text,btnMsg)
{
 var idCss = "";
    var title = "";
    var msg = "";
    var btnArr = "";
    if(id=='confirm'){
          idCss = 'exit';
         title = "Xác Nhận";
         msg = text;
         btnArr = "Có,Không";
    }
     MsgBoxStyles(idCss, title, msg, btnArr , btnMsg);
}
//------------------------------------------------------------------------------------------------------------------