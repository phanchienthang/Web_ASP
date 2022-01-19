var legal_characters = "$%&()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_´abcdefghijklmnopqrstuvwxyz{|}~€_‚ƒ„...†‡ˆ‰_‹Œ____–—˜™_›œ__Ÿ ¡¢£€x_§¨©ª«¬_®¯°±__´μ¶·¸_º»___¿ÀÁÃÄÅÆÇÈÉÊËÌÍÎÏ_ÑÒÓÔÕÖ_ØÙÚÛÜ__ßàáãäåæçèéêëìíîï_ñòóôõö÷øùúûü__ÿ";
 
  


  function encrypt_cookie(cookie_value, encrypt_key) {

  var cookie_character;
  var character_location;
  var encrypted_location;
  var encrypted_character;

  // This variable holds the encrypted cookie characters
  var encrypted_string = "";
  
  // Run through each character in the cookie value
  for (var counter = 0; counter < cookie_value.length; counter++) {
  
    // Get the current cookie character
    cookie_character = cookie_value.substring(counter, counter + 1);
    
    // Get the character's location in the string of legal characters
    character_location = legal_characters.indexOf(cookie_character);
    
    // XOR the character location with the encrypt_key
    encrypted_location = character_location ^ encrypt_key;
    
    // Use the encrypted location to specify the encrypted 
    // character within the string of legal characters
    encrypted_character = legal_characters.substring(encrypted_location, encrypted_location + 1);
    
    // Add the encrypted character to the string
    encrypted_string += encrypted_character ;
    
  }
  return encrypted_string;
}

        function setCookie(c_name, value, exdays) {
         var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var c_value = encrypt_cookie(escape(value),25) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
            document.cookie = c_name + "=" + c_value;




        }
        function getCookie(c_name) {
            var i, x, y, ARRcookies = document.cookie.split(";");
            for (i = 0; i < ARRcookies.length; i++) {
                x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
                y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
                x = x.replace(/^\s+|\s+$/g, "");
                if (x == c_name) {
                    //    return decrypt_cookie(unescape(y),25);
                    return unescape(y);
                }
            }
        }
          function setCookies(c_name, value, exdays) {
         var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var c_value = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString());
            document.cookie = c_name + "=" + c_value;
          function getCookie(e){
          var t,n,r,i=document.cookie.split(";");
          for(t=0;t<i.length;t++)
          {
          n=i[t].substr(0,i[t].indexOf("="));
          r=i[t].substr(i[t].indexOf("=")+1);
          n=n.replace(/^\s+|\s+$/g,"");
          if(n==e){
          return unescape(r)
          }
          }
          }
   
   
         
        }