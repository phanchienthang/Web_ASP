// JavaScript Document
/*************************************************************
 * jConf - jQuery Plugin
 * Simple and Light Confirmation Alternative
 *
 * Examples and documentation at: http://aku.salimag.us/jconf-jquery-plugin.html
 * 
 * Created By Agus Salim
 * 
 * Version: 1.0.0 (06/15/2011)
 * Requires: jQuery v1.3+
 *
/*************************************************************/
    var wWidth = Math.max(0, document.documentElement.clientWidth);
    var wHeight = Math.max(0, document.documentElement.clientHeight);
    var idCss = "SaNg";
(function($){
	$.fn.jConf = function (options) {
		//set default parameter for this plugin
		var defaults = {			
			sText: "Are You Sure ?",
			textInput: false,
			inputVal: '',
			okBtn: "Yes",
			noBtn: false,
			css:"",
			callResult: false
		}
		var param = $.extend({},defaults, options);	//read default options and compare with used defined options
		//var wHeight = $(document).height();
		//var wWidth = $(document).width();
		var poinx = 0;
		var poiny = 0;
		/*-------------------------------
            Set độ cao rộng cố định cho msg */
                var w = 500;
                var h = 222;
		/*-------------------------------*/
		
		//
		$(this).click(function(e){
			poinx = e.pageX + 10; 	//Get X coodrinates
			poiny = e.pageY + 10; 	//Get Y coordinates
			render($(e.target).text());				//render background and container box
			
			//var wScreen = Math.max(0, document.documentElement.clientWidth); // width full screen
            //var hScreen = Math.max(0, document.documentElement.clientHeight);// height full screen
			showBox(wWidth, wHeight);	//adjust jConf box position depend on mouse position
			setUI();				//read event on button YES and NO
			e.preventDefault();
		});		
		
		function render(text){
			//add render div in body
			
			$('body').append('<div class="disablediv"></div>');
			//
			$('body').append('<div class="jconfRender"></div>');
			$('.jconfRender').css({'height': wHeight, 'width': wWidth}).fadeIn(100);
			
			$('body').append('<div id="jconfBox"></div>');
			$('#jconfBox').append(genContent(text));
		}
		function showBox(wScreen, hScreen){
            var pleft= (wScreen-w)/2;
            var ptop= (hScreen-h)/2;
			//var mousex = posX + 10; //Get X coodrinates
			//var mousey = posY + 10; //Get Y coordinates
//			var boxWidth = $('#jconfBox').width(); 	//Find width of box container
//			var boxHeight = $('#jconfBox').height(); //Find height of box container
//			
//			var boxVisX = wWidth - (mousex + boxWidth);		//Distance of element from the right edge of viewport				
//			var boxVisY = wHeight - (mousey + boxHeight);	//Distance of element from the bottom of viewport

			//If box container exceeds the X coordinate of viewport
//			if ( boxVisX < 10 ) { mousex = posX - boxWidth - 40;} 
			//If box container exceeds the Y coordinate of viewport
//			if ( boxVisY < 10 ) { mousey = posY - boxHeight - 40;}
			//set default position
			$('#jconfBox').css({'left': pleft, 'top': ptop, 'width':w, 'height':h});
			$('.jconfRender').css({'left': pleft, 'top': ptop, 'width':w, 'height':h});
			
		}
//	    function getsText(){
//	    return $(this).text();
//	    }	
        
		function genContent(text){
			//add text container
		//	var ssText= getsText();
		    // alert(text);
		    
		    //strHTML += "<div class='msgboxdesc'>";
            //strHTML += "<div class='msgboxdesc left img" + id + "'></div>";
            //strHTML += "<div class='msgboxdesc right'><span class='textcontent'>" + message + "</span></div>";
            //strHTML += "</div>";
            //strHTML += "</div>";
		    //
		    
		    var isi = '<div class="dvmsgbox '+ param.css +' " style="height:100%">';
			    isi += "<div style='margin:auto; height:" + (h - 60) + "px' >";
			    isi = isi + '<div class="msgboxdesc">';
			    isi = isi + '<div class="msgboxdesc left img'+param.css+'"></div>';
			    isi = isi + '<div class="msgboxdesc right">';
			    isi = isi + '<div class="jconfText"><span class="textcontent">' + text + '</span></div>';
			    isi = isi + '</div> </div> </div>';
				//cek wether user define input or not, and add it when defined
				if(param.textInput){
					isi = isi + '<input type="text" class="jconfInput" value="' + param.inputVal + '" />';
				}				
                //isi = isi + '<div style="clear:both"></div>'					//add separator
				
				isi = isi + '<p class="msgboxbuttons">'	  //content button
				    //cek wether user define only 1 button or not
				    if(param.noBtn){
					    isi = isi + '<a class="jconfBtn">' + param.noBtn + '</a>';						//add button NO
				    }				
				    isi = isi + '<a class="jconfBtn" id="jconfBtnOK">' + param.okBtn + '</a>&nbsp;';	//add button OK
				    
				isi = isi + '</p>';
				isi = isi + '</div>';
			return isi;
		}
		
		function setUI(){
//			$('.jconfInput').focus();
//			//bind click functon on background div
//			$('.jconfRender').click(function(){	
//				$('.jconfRender').fadeOut(100,function(){	//animate and remove all object created by jConf
//					$('#jconfBox').remove();				//remove box container
//					$('.jconfRender').remove();				//remove background
//					
//				});
//			});	
			
			//bind on click event and give callback
			$('.jconfBtn').click(function(){
				if ($.isFunction(param.callResult)){ 
					//if there is input on jConf and btn OK is pressed
					if( param.textInput && $(this).attr('id')=='jconfBtnOK' ){
						param.callResult($('.jconfInput').val());	//Give text value as callback
						$('#jconfBox').remove();				//remove box container
					    $('.jconfRender').remove();				//remove background
						$('.disablediv').remove();				//remove background
					}else{
						param.callResult($(this).html()); 			//Give btn text as callback
						$('#jconfBox').remove();				//remove box container
					    $('.jconfRender').remove();				//remove background
						$('.disablediv').remove();				//remove background
					}
				}
				//$('.jconfRender').trigger('click');				
			});
		}
	}
})(jQuery);
