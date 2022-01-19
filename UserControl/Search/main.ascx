<%@ control language="C#" autoeventwireup="true" inherits="UserControl_Search_main, App_Web_frjhjssl" %>
<script type="text/javascript">
    var ID_txtSearch = '<%= txtSearch.ClientID%>';
    $(document).ready(function () {
        var Input = $('#' + ID_txtSearch);
        var default_value = Input.val();

        $(Input).focus(function () {
            if ($(this).val() == default_value) {
                $(this).val("");
            }
        }).blur(function () {
            if ($(this).val().length == 0) /*Small update*/ {
                $(this).val(default_value);
            }
        });
    });

    function clickButton(e, buttonid) {
        var evt = e ? e : window.event;
        var bt = document.getElementById(buttonid);

        if (bt) {
            if (evt.keyCode == 13) {
                bt.click();
                return false;
            }
        }
    }

    $(document).ready(function () {
        $("#<%=txtSearch.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '/UserControl/Search/main.ascx/GetSearchHint',
                    data: "{ 'prefix': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",

                    dataFilter: function (data) { return data; },

                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item,
                                val: item
                            }
                        }))

                    },
                    error: function (response) {
                        // alert(response.responseText);
                    },
                    failure: function (response) {
                        //  alert(response.responseText);
                    }
                });
            },
            minLength: 1
        });
    });

</script>
<div class="search">
    <asp:TextBox ID="txtSearch" runat="server" CssClass="search-text" placeholder="Nhập từ khóa tìm kiếm"></asp:TextBox>
</div>
