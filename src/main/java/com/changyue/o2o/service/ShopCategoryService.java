package com.changyue.o2o.service;

import com.changyue.o2o.entity.ShopCategory;

import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-18 20:49
 */
public interface ShopCategoryService {

    /**
     * 根据条件获得ShopCategory列表
     */
    List<ShopCategory> getShopCategoryList(ShopCategory shopCategory);

}
