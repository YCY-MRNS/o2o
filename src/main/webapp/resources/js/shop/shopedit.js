
var shopInfoUrl = '/shopping/shopadmin/getshopbyid?shopId=';
var editShopUrl = '/shopping/shopadmin/updateShop';
var saveCurrentShop = '/shopping/shopadmin/getshopmanagementinfo';


$(document).on("click", ".btn-more", function () {
    var shopId = $(this).data("id");
    console.info(shopId);
    $.ajax({
        url: saveCurrentShop,
        type: 'POST',
        data: {
            shopId: shopId
        },
        success: function (data) {
            console.info("传递成功！");
        }
    });
});

$(document).on("click", ".shop-edit-btn", function () {

    var shopId = $(this).attr("data-id");

    $.getJSON(shopInfoUrl + shopId, function (data) {
        if (data.success) {
            var shop = data.shop;
            $('#shop-name').val(shop.shopName);
            $('#shop-desc').val(shop.shopDesc);
            $('#shop-phone').val(shop.phone);
            $('#shop-addr').val(shop.shopAddr);

            var shopCategory = '<option selected="selected" data-id='
                + shop.shopCategory.shopCategoryId + '>'
                + shop.shopCategory.shopCategoryName + '</option>';

            var tampAreaHtml = '';

            data.areaList.map(function (value, index) {
                tampAreaHtml += '<option data-id="' + value.areaId + '">' +
                    value.areaName + '</option>';
            });

            $('#shop-category').html(shopCategory);
            $('#shop-category').attr('disabled', 'disabled');
            $('#area').html(tampAreaHtml);
            $("#area option[data-id='" + shop.area.areaId + "']").attr('selected', 'selected');
            $("#submit").attr("data-id", shopId);
        }
    });

});

//提交表单数据
$('#submit').click(function () {

    var shop = {};

    shop.shopId = $(this).attr("data-id");
    shop.shopName = $('#shop-name').val();
    shop.shopDesc = $('#shop-desc').val();
    shop.phone = $('#shop-phone').val();
    shop.shopAddr = $('#shop-addr').val();
    shop.shopCategory = {
        shopCategoryId: $('#shop-category option:checked').attr('data-id')
    };

    shop.area = {
        areaId: $('#area option:checked').attr('data-id')
    };

    var shopImg = $('#shop-img')[0].files[0];

    var formData = new FormData();
    formData.append("shopImg", shopImg);
    formData.append("shopStr", JSON.stringify(shop));
    var verifyCodeActual = $('#j_captcha').val();
    if (!verifyCodeActual) {
        alert("请输入验证码！");
        return;
    }

    formData.append("verifyCodeActual", verifyCodeActual);

    console.info(shop);

    $.ajax({
        url: editShopUrl,
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        cache: false,
        success: function (data) {
            if (data.success) {
                alert('提交成功');
                $("#shop-edit").modal("hide");
                window.location.href = "/shopping/shopadmin/shoplist";
            } else {
                alert("提交失败" + data.errMsg);
            }
            $('#captcha_img').click();
        }
    })
});
