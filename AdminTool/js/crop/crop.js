



function ValidateSelected() {
    if (document.getElementById("w").value == "" || document.getElementById("w").value == "0"
        || document.getElementById("h").value == "" || document.getElementById("h").value == "0") {
        alert("No area to crop was selected");
        return false;
    }
}