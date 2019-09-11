package com.changyue.o2o.service.impl;

import com.changyue.o2o.dao.ShopCategoryDao;
import com.changyue.o2o.entity.ShopCategory;
import com.changyue.o2o.service.ShopCategoryService;
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
