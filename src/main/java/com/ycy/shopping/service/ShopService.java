package com.ycy.shopping.service;

import com.ycy.shopping.dto.ImageHolder;
import com.ycy.shopping.dto.ShopExecution;
import com.ycy.shopping.entity.Shop;
import com.ycy.shopping.exceptions.ShopOperationException;


/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-17 18:34
 */

public interface ShopService {


    /**
     * 获得Shop的分页数据
     */
    public ShopExecution getShopList(Shop shopCondition, int pageIndex, int pageSize);

    /**
     * @param shopId
     * @return
     */
    Shop getByShopId(long shopId);

    /**
     * 修改商铺信息
     */
    ShopExecution modifyShop(Shop shop, ImageHolder thumbnail) throws ShopOperationException;


    /**
     * 添加商铺
     */
    ShopExecution addShop(Shop shop, ImageHolder thumbnail) throws ShopOperationException;

}
