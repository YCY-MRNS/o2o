

function changeVerityCode(img) {
    img.src = "../Kaptcha?" + Math.floor(Math.random() * 100);
}

function getQueryString(name) {
    var regExp = new RegExp("(^|&)"+name+"=([^&]*)(&|$)");
    var temp = window.location.search.substr(1).match(regExp);
    if (temp != null) {
        return decodeURIComponent(temp[2]);
    }
    return '';
}