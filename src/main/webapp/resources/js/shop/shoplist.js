$(function () {
    getList();

    function getList(e) {
        $.ajax({
            url: "/shopping/shopadmin/getshoplist",
            type: "get",
            dataType: "json",
            success: function (data) {
                console.info(data);
                if (data.success) {
                    console.info(data);
                    handleList(data.shopList);
                    handleUser(data.user);
                }
            }
        });
    }

    function handleUser(data) {
        $("#user-name").text(data.name);
    }

    function handleList(data) {
        var html = "";

        data.map(function (value, index) {
            var number = index + 1;
            html += '<tr>'
                + '<th scope="row">' + number + '</th>'
                + '<td>' + value.shopName + '</td>'
                + '<td>' + shopStatus(value.enableStatus) + '</td>'
                + '<td>' + goShop(value.enableStatus, value.shopId) + '</td>'
                + '</tr>';
        });

        $('#shop-wrap').html(html);

    }

    function shopStatus(status) {
        if (status === 0) {
            return '审核中';
        } else if (status === -1) {
            return '商铺非法';
        } else {
            return '审核通过';
        }
    }

    function goShop(status, id) {
        if (status === 1) {
            return "<div class='dropdown'>" +
                '<a id="shopInfo" class="btn btn-primary btn-sm shop-edit-btn" data-toggle="modal" data-target="#shop-edit" data-id=' + id + '>编辑</a>&nbsp;' +
                '<a id="shopInfo" class="btn btn-danger btn-sm shop-remove-btn"  data-id=' + id + '>删除</a>&nbsp;' +
                "<a class='btn btn-info btn-sm btn-more' id='dLabel' data-id='" + id + "' type='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>更多&nbsp;<i class='fas fa-angle-down'></i></a>" +
                "<ul class='dropdown-menu' aria-labelledby='dLabel'>" +
                "<li><a href='/shopping/shopadmin/shopmanagement?shopId=" + id + "'>商铺信息</a></li>" +
                "<li><a href='/shopping/shopadmin/productlist'>商品管理</a></li>" +
                "<li><a href='/shopping/shopadmin/productcategorymanagement?shopId=" + id + "'>商品类别管理</a></li>" +
                "</ul>" +
                "</div>";
        } else {
            return "";
        }
    }
});