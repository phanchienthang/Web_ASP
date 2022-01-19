var FirstLoading = true;
var checkRefresh = false;
var iframe;

function ResizeContent() {
    $("#contentMain").css("min-height", window.innerHeight - 145);
};
$(document).ready(function () {
    ResizeContent();
});

function OnInit(s, e) {
    ResizeContent();
}

function OnControlsInitialized(s, e) {
    ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
        ResizeContent();
    });
}

