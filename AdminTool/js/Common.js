
function OpenBrWindow(theURL,winName,width,height) 
{ //v2.0
  var pleft=(screen.width-width)/2;
  var ptop=(screen.height-height)/2;
  wd=window.open(theURL,winName,'width='+width+', height='+height+", top="+ptop+", left="+pleft);
  wd.focus();
}
function OpenBrWindowIsScroll(theURL,winName,width,height) 
{ //v2.0
  var pleft=(screen.width-width)/2;
  var ptop=(screen.height-height)/2;
  wd=window.open(theURL,winName,'width='+width+', height='+height+", top="+ptop+", left="+pleft+",scrollbars=yes");
  wd.focus();
}
function OpenBrWindowMax(theURL,winName) 
{ //v2.0
  var pW=screen.width-10;
  var pH=screen.height-10;
  wd=window.open(theURL,winName,'width='+pW+', height='+pH+", top=0, left=0,scrollbars=yes");
  wd.focus();
}
///Msgbox Delete
function alertDelete()
{
   if(confirm("Bạn có chắc chắn xóa những thông tin đã được đánh dấu ?"))
        return true;
   else
        return false;   
}
///Msgbox Hidden
function alertHidden()
{
   if(confirm("Bạn có chắc chắn đánh dấu ẩn những thông tin đã được đánh dấu ?"+ "\n" + "Nếu đồng ý thì các thông tin này được đánh dấu ẩn."))
        return true;
   else
        return false;   
}
//Sort
function alertSort()
{
   if(confirm("Bạn có chắc sắp xếp lại toàn bộ dữ liệu?"))
        return true;
   else
        return false;   
}

function testText(isnull,nameitem,strmsg,sizemax,process)
{
    var str= trim(document.getElementById(nameitem).value)
    if(!isnull)
    {
        if(isEmpty(str))
        {
           alert("Chưa nhập thông tin: "+ strmsg+" \n => Xin hãy cập nhật rồi "+process+" !");
           document.getElementById(nameitem).focus();
           return false;
        }
        else
           document.getElementById(nameitem).value=str;
    }   
    return testLen(str,sizemax,strmsg);
   
}
function testEmail(isnull,nameitem,sizemax,process)
{
    var str= trim(document.getElementById(nameitem).value)  
    if(!isnull)
    {    
        if(isEmpty(str))
        {
           alert("Chưa nhập thông tin: Email \n => Xin hãy cập nhật rồi "+process+" !");
           document.getElementById(nameitem).focus();
           return false;
        }
        else
        {
            if (!isEMailAddr(str)) 
            {
                alert("Định dạng địa chỉ Email chưa đúng.\n => Xin hãy định dạng lại rồi "+process+" !");
                document.getElementById(nameitem).focus()
                return false;
            }
       }         
    }
    else
    {
      if(!isEmpty(str))
      {       
        if(!isEMailAddr(str)) 
        {
            alert("Định dạng địa chỉ Email chưa đúng.\n => Xin hãy định dạng lại rồi "+process+" !");
            document.getElementById(nameitem).focus();
            return false;
        }
      }     
    }
    return testLen(str,sizemax,'Email');;
}
function testNumber(isnull,nameitem,strmsg,sizemax,process)
{
    var str= trim(document.getElementById(nameitem).value)  
    if(!isnull)
    {    
        if(isEmpty(str))
        {
           alert("Chưa nhập thông tin: "+strmsg+" \n => Xin hãy cập nhật rồi "+process+" !");
           document.getElementById(nameitem).focus();
           return false;
        }
        else
        {
            if (!isNumber(str)) 
            {
                alert(strmsg+" => Không phải là số. \n Xin hãy nhập "+strmsg+"  là kiểu số rồi "+process+" !");
                document.getElementById(nameitem).focus()
                return false;
            }
       }         
    }
    else
    {
      if(!isEmpty(str))
      {       
        if(!isNumber(str)) 
        {
           alert(strmsg+" => Không phải là số. \n Xin hãy nhập "+strmsg+"  là kiểu số rồi "+process+" !");
                document.getElementById(nameitem).focus()
                return false;
        }
      }     
    }
    return testLen(str,sizemax,strmsg);
}

function testDate(isnull,nameitem,strmsg,process)
{
    var str= trim(document.getElementById(nameitem).value)
    if(!isnull)
    {
        if(isEmpty(str))
        {
           alert("Chưa nhập thông tin: "+ strmsg+" \n => Xin hãy cập nhật rồi "+process+" !");
           document.getElementById(nameitem).focus();
           return false;
        }
        else
           document.getElementById(nameitem).value=str;
    }
    else
    { 
      if(!isEmpty(str))
      {
        if(!isDate(str))
        {
           document.getElementById(nameitem).focus();
           return false;           
        }        
      } 
    }
    return true;
}
function testDateTime(isnull,nameitem,strmsg,process)
{
    var str= trim(document.getElementById(nameitem).value)
    if(isnull)
    {
        if(isEmpty(str))
        {
           alert("Chưa nhập thông tin: "+ strmsg+" \n => Xin hãy cập nhật rồi "+process+" !");
           document.getElementById(nameitem).focus();
           return false;
        }
        else
           document.getElementById(nameitem).value=str;
    }
    else
    { 
      if(!isEmpty(str))
      {
        if(!isDateTime(str))
        {
           document.getElementById(nameitem).focus();
           return false;           
        }        
      } 
    }
    return true;
}
function isDateTime(ngay)
{
    var arrNgay = ngay.split(" ")
    if(arrNgay.length!=2)
    {
        alert("Ngày và giờ cách nhau bởi 1 dấu cách");
        return  false;
    }
    else
    {
        if(isDate(arrNgay[0])==false || isTime(arrNgay[1])==false)
          return false;
        else
             return true; 
    }
    return  true;
  
}
function testInCbo(nameitem,strmsg)
{
    var cb = document.getElementById(nameitem)
    var value = cb.options[cb.selectedIndex].value;
    if(value.indexOf("-1")==0)
    {
        alert('Bạn phải chọn một giá trị trong: ' + strmsg);
        cb.focus();
        return false;
    }
    return true;


}
function testInList(isnull,nameitem,vlList,strmsg,sizemax)
{
    var str= trim(document.getElementById(nameitem).value)
    var reslt;
    if(!isnull)
    {
        if(isEmpty(str))
        {
           alert("Chưa nhập thông tin: "+ strmsg+" \n => Xin hãy cập nhật rồi lưu !");
           document.getElementById(nameitem).focus();
           return false;
        }
        else
           document.getElementById(nameitem).value=str;
    }
    else
    {
      if(!isEmpty(str))
      {
        if(!inList(str,vlList,strmsg))
        {
           document.getElementById(nameitem).focus();
           return false;           
        }        
      }     
    }
    return testLen(str,sizemax,strmsg);
}

function inList(vl,list,msg)
{
    var count=0;
    var itemlist = list.split(";");
    var msgArr='\n';
    var v;
    for (x in itemlist)
    {
       v=itemlist[x];
       msgArr+=v + '\n';
       if(v==vl)
          count++;
    } 
    if(count==0)
    {
        alert(msg+" phải có giá trị trong các giá trị sau: " +msgArr);
        return false;
    }
    else
        return true;
}
function isEmpty(str)
{
    var re = /.+/;
    if(!str.match(re)) {
        return true;
    } else {
        return false;
    }
}
function isItemNumber(nameitem,strmsg) 
{
   var str= trim(document.getElementById(nameitem).value)
    if(!isNumber(str))
    {
       alert("Thông tin " + strmsg + " không phải là số !");
       document.getElementById(nameitem).focus();
       return true;
    }
    else
    {
       document.getElementById(nameitem).value=str;
       return false; 
    }
}
function isNumber(str) 
{
    var re = /^[-]?\d*\.?\d*$/;
    str = str.toString( );
    if (!str.match(re)) {
        return false;
    }
    return true;
}

function isEMailAddr(str) 
{
    var re = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
    if (!str.match(re)) {        
        return false;
    } else {
        return true;
    }
}
function testLen(str,size,strTB)
{
  if (str.length>size)
  {
      alert("Độ dài của " + strTB + " \nkhông vượt quá " + size + " ký tự. \n -> Bạn đã nhập "+str.length + " ký tự")
      return false;
  }
  return true
}
function trim(inputString) 
{
   if (typeof inputString != "string") { return inputString; }
    var retValue = inputString;
   var ch = retValue.substring(0, 1);
   while (ch == " ") 
   {
      retValue = retValue.substring(1, retValue.length);
      ch = retValue.substring(0, 1);
    }
   ch = retValue.substring(retValue.length-1, retValue.length);
   while (ch == " ")
   {
      retValue = retValue.substring(0, retValue.length-1);
      ch = retValue.substring(retValue.length-1, retValue.length);
    }
    while (retValue.indexOf("  ") != -1)
    { 
        retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); // Again, there are two spaces in each of the strings
    }
    return retValue; 
}
function isDate(ngay)
{
   var arrNgay = ngay.split("/")
   if(arrNgay.length!=3)
   {
     alert("Định dạnh ngày chưa đúng, xin kiểm tra lại theo dạng (ngày/tháng/năm) \n Chú ý: khoảng cách giữa ngày tháng năm phải là dấu (/) ")
      return false;       
   }
   var i_ngay = parseInt(arrNgay[0])
   var i_thang = parseInt(arrNgay[1])
   var i_nam = parseInt(arrNgay[2])
   //Kiem tra phai la so khong.       
   if (isNaN(i_ngay) || isNaN(i_thang) || isNaN(i_nam))
   {
        alert("Ngày/Tháng/ Năm -> phải là số.")
        return false;
   }        
   //Kiem tra tinh hop le.
   switch (i_thang)
   {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
       if (i_ngay>31 )
       {
         alert("Tháng "+i_thang + " lớn nhất là 31 ngày.")
         return false
       }
      break    
    case 4:
    case 6:
    case 9:
    case 11:
       if (i_ngay>30 )
       {
         alert("Tháng "+i_thang + " lớn nhất là 30 ngày.")
         return false
       }
       break
    case 2:
       if (i_ngay>29)
       {
         alert("Tháng "+i_thang + " lớn nhất là  28 hay 29 ngày.")
         return false
       }
       else
       {
           x=i_nam;
           x%=4;
           if(x==0)
           {
             if(i_ngay>29)
             {
                alert("Tháng "+i_thang + " lớn nhất phải là 29 ngày.")
                return false
             }              
           }
           else
           {
             if(i_ngay>28)
             {
                alert("Tháng "+i_thang + " lớn nhất phải là 28 ngày.")
                return false
             }  
           }
       }          
    }
    //Thang
    if( i_thang>12 || i_thang < 1  )
    {
       alert("Tháng nhập không đúng (giá trị từ 1 đến 12)")
       return false;
    }
    //Kiem tra nam
    if(arrNgay[2].length!=4)
    {
       alert("Năm phải có 4 chữ số.")
       return false;       
    }
    return true;
}
function isTime(time)
{
   var arrTime = time.split(":")
   if(arrTime.length!=3)
   {
      alert("Định dạnh giờ chưa đúng, xin kiểm tra lại theo dạng (giờ:phút:giây) \n Chú ý: Khoảng cách giữa giờ phút giây phải là dấu (:) ")
      return false;       
   }
   var i_gio= parseInt(arrTime[0])
   var i_phut = parseInt(arrTime[1])
   var i_giay = parseInt(arrTime[2])
   //Kiem tra phai la so khong.       
   if (isNaN(i_gio) || isNaN(i_phut) || isNaN(i_giay))
   {
        alert("Giời:Phút/Giây -> phải là số.")
        return false;
   }        
    //Gio
    if( i_gio>24 || i_gio < 0  )
    {
       alert("Giờ nhập không đúng (giá trị từ 1 đến 24)")
       return false;
    }
    //Phut
    if( i_phut>60 || i_phut < 0  )
    {
       alert("Phút nhập không đúng (giá trị từ 0 đến 60)")
       return false;
    }
     //Giay
    if( i_giay>60 || i_giay < 0  )
    {
       alert("Giây nhập không đúng (giá trị từ 0 đến 60)")
       return false;
    }
    return true;
}



     
    ///Find item in Combobox
///nameitem: Name control
///str_value: value find
function FindItemComb(nameitem,str_value) 
{
  var kq=false;
  var x=document.getElementById(nameitem);
  for (i=0;i<x.length;i++)
  {
    if(x.options[i].text==str_value)
    {
        kq=true;
        break;
    }
  }
  return kq;  
}
///Add item in combobox
///nameitem: name control
///value: value add
function addItemComb(nameitem,value) 
{
   if(!FindItemComb(nameitem,value))
   {
       var y = document.createElement('option');
       y.text=value;
       y.value=value;
       var x=document.getElementById(nameitem);
       try
       {
        x.add(y,null); // standards compliant
       }
       catch(ex)
       {
        x.add(y); // IE only
       }
   }
}
///Get Name Field
function getNameFiled(field)
{
    return field.substr(3,field.length-3);
}
