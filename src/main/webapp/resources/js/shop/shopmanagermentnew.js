$(function () {

    var shopId = getQueryString("shopId");
    console.log(shopId);
    $('#shopInfo').attr('href', '/shopping/shopadmin/shopoperation?shopId=' + shopId);

});