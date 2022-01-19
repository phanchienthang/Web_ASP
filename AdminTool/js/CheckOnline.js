



 $(function() {


            setInterval(function() {


                $.get(preFix + "KeepAlive.ashx");
                if (!navigator.onLine) {
                    alertTB("Kiểm tra lại kết nối mạng!");
                }
            }, 1000 * 30); 
        });