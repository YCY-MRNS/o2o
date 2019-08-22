package com.ycy.shopping.service.impl;

import com.ycy.shopping.dao.ShopCategoryDao;
import com.ycy.shopping.entity.ShopCategory;
import com.ycy.shopping.service.ShopCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-18 20:50
 */
@Service
public class ShopCategoryImpl implements ShopCategoryService {

    @Autowired
    private ShopCategoryDao shopCategoryDao;

    @Override
    public List<ShopCategory> getShopCategoryList(ShopCategory shopCategory) {
        return shopCategoryDao.queryShopCategory(shopCategory);
    }
}
