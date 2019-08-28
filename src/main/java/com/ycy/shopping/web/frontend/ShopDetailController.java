package com.ycy.shopping.web.frontend;

import com.ycy.shopping.entity.ProductCategory;
import com.ycy.shopping.entity.Shop;
import com.ycy.shopping.service.ProductCategoryService;
import com.ycy.shopping.service.ShopService;
import com.ycy.shopping.util.HttpServletRequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: o2o
 * @description: 商铺详情控制器
 * @author: YuanChangYue
 * @create: 2019-08-23 10:41
 */
@Controller
@RequestMapping("/frontend")
public class ShopDetailController {


    @Autowired
    private ShopService shopService;

    @Autowired
    private ProductCategoryService productCategoryService;

    /**
     * 获得商铺详情页的信息
     *
     * @param request 请求域
     */
    @GetMapping("/shopdetailpageinfo")
    @ResponseBody
    public Map<String, Object> getShopDetail(HttpServletRequest request) {

        Map<String, Object> modelMap = new HashMap<>();

        long shopId = HttpServletRequestUtil.getLong(request, "shopId");
        Shop shop = null;
        List<ProductCategory> productCategoryList = null;

        if (shopId != -1) {

            shop = shopService.getByShopId(shopId);
            productCategoryList = productCategoryService.getProductCategoryList(shopId);

            modelMap.put("shop", shop);
            modelMap.put("productCategoryList", productCategoryList);
            modelMap.put("success", true);

        } else {
            modelMap.put("success", false);
            modelMap.put("errMsg", "the shopId is empty!");
        }


        return modelMap;
    }

}
