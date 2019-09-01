package com.ycy.shopping.web.shopadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-17 23:16
 */
@Controller
@RequestMapping(value = "/shopadmin", method = RequestMethod.GET)
public class ShopAdminPageController {

    @RequestMapping(value = "/shopoperation")
    public String shopOperation() {
        return "shop/shopoperation";
    }

    @RequestMapping(value = "/shoplist")
    public String shopList() {
        return "shop/shoplist";
    }

    @RequestMapping(value = "/shopmanagement")
    public String shopManagement() {
        return "shop/shopmanagement";
    }

    @RequestMapping(value = "/productcategorymanagement", method = RequestMethod.GET)
    public String productCategoryManagement() {
        return "shop/productcategorymanagement";
    }

    /**
     * 商品操作 跳转到商品页面 进行添加和编辑操作
     */
    @RequestMapping(value = "/productoperation")
    public String productOperation() {
        return "shop/productoperation";
    }

    @RequestMapping(value = "/productlist")
    public String productlist() {
        return "shop/productlist";
    }
}

