function changeVerityCode(img) {
    img.src = "/o2o/Kaptcha?" + Math.floor(Math.random() * 100);
}

function handleUser(user) {
    $("#userLogedinDropdown").text(user.name)
}

function getQueryString(name) {
    var regExp = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var temp = window.location.search.substr(1).match(regExp);
    if (temp != null) {
        return decodeURIComponent(temp[2]);
    }
    return '';
}

function showPagination(data) {
    var pagination = $(".pagination");
    pagination.empty();

    var paginationHtml = '';
    var pagePreviousHtml = '<li class="page-item page-previous" data-id="1"><a class="page-link" href="#">首页</a></li>';
    var pageNextHtml = '<li class="page-item page-next" data-id="' + data.pages + '"><a class="page-link" href="#">末页</a></li>';

    data.navigatepageNums.map(function (item, index) {
        if (item === data.pageNum) {
            paginationHtml += '<li class="page-item active" data-id="' + item + '"><a class="page-link">' + item + '</a></li>';
        } else {
            paginationHtml += '<li class="page-item" data-id="' + item + '"><a class="page-link">' + item + '</a></li>';
        }
    });

    $(".page-total-page").text(data.pages);
    $(".page-current-nums").text(data.pageNum);

    if (data.isFirstPage) {
        pagePreviousHtml = "";
    }
    if (data.isLastPage) {
        pageNextHtml = "";
    }

    pagination.append(pagePreviousHtml);
    pagination.append(paginationHtml);
    pagination.append(pageNextHtml);

}