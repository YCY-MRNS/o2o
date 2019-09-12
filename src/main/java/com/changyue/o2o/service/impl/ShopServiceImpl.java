package com.changyue.o2o.service.impl;

import com.changyue.o2o.exceptions.ShopOperationException;
import com.changyue.o2o.dao.ShopDao;
import com.changyue.o2o.dto.ImageHolder;
import com.changyue.o2o.dto.ShopExecution;
import com.changyue.o2o.emums.ShopStateEnum;
import com.changyue.o2o.entity.Shop;
import com.changyue.o2o.service.ShopService;
import com.changyue.o2o.util.ImageUtil;
import com.changyue.o2o.util.PageCalculator;
import com.changyue.o2o.util.PathUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-17 18:41
 */
@Service
public class ShopServiceImpl implements ShopService {

    @Autowired
    private ShopDao shopDao;

    /**
     * 获得商铺列表
     *
     * @param shopCondition 带条件的商铺信息
     * @param pageIndex     页码
     * @param pageSize      页数
     * @return 商铺异常包装类
     */
    @Override
    public ShopExecution getShopList(Shop shopCondition, int pageIndex, int pageSize) {

        int rowIndex = PageCalculator.calculator(pageIndex, pageSize);

        List<Shop> shopList = shopDao.queryShopList(shopCondition, rowIndex, pageSize);
        int shopCount = shopDao.queryShopCount(shopCondition);

        ShopExecution shopExecution = new ShopExecution();

        if (shopList != null) {
            shopExecution.setShopList(shopList);
            shopExecution.setCount(shopCount);
        } else {
            shopExecution.setState(ShopStateEnum.INNER_ERROR.getState());
        }
        return shopExecution;
    }

    @Override
    public Shop getByShopId(long shopId) {
        return shopDao.queryById(shopId);
    }


    /**
     * 修改商铺信息
     *
     * @param shop      商铺
     * @param thumbnail 缩略图
     * @return 商铺异常包装类
     */
    @Override
    public ShopExecution modifyShop(Shop shop, ImageHolder thumbnail) {

        if (shop == null || shop.getShopId() == null) {
            return new ShopExecution(ShopStateEnum.NULL_SHOP);
        } else {
            try {
                if (thumbnail.getImage() != null && thumbnail.getImageName() != null && !"".equals(thumbnail.getImageName())) {
                    Shop tempShop = shopDao.queryById(shop.getShopId());
                    if (tempShop.getShopImg() != null) {
                        ImageUtil.deleteImgFileOrPath(tempShop.getShopImg());
                    }
                    addShopImg(shop, thumbnail);
                }
                shop.setLastEditTime(new Date());
                int effectedNum = shopDao.updateShop(shop);
                if (effectedNum <= 0) {
                    return new ShopExecution(ShopStateEnum.INNER_ERROR);
                } else {
                    shop = shopDao.queryById(shop.getShopId());
                    return new ShopExecution(ShopStateEnum.SUCCESS, shop);
                }
            } catch (IOException e) {
                throw new ShopOperationException("modifyShop error :" + e.getMessage());
            }
        }
    }

    @Override
    @Transactional
    public ShopExecution addShop(Shop shop, ImageHolder thumbnail) {
        if (shop == null) {
            return new ShopExecution(ShopStateEnum.NULL_SHOP);
        }
        try {
            shop.setEnableStatus(0);
            shop.setCreateTime(new Date());
            shop.setLastEditTime(new Date());
            int effect = shopDao.insertShop(shop);
            if (effect <= 0) {
                throw new ShopOperationException("店铺创建失败");
            } else {
                if (thumbnail.getImage() != null) {
                    try {
                        addShopImg(shop, thumbnail);
                    } catch (Exception e) {
                        throw new RuntimeException("addShop error: " + e.getMessage());
                    }
                    effect = shopDao.updateShop(shop);
                    if (effect <= 0) {
                        throw new ShopOperationException("更新图片失败！");
                    }
                }
            }

        } catch (Exception e) {
            throw new ShopOperationException("addShop error: " + e.getMessage());
        }
        return new ShopExecution(ShopStateEnum.CHECK);
    }

    private void addShopImg(Shop shop, ImageHolder thumbnail) throws IOException {
        String dest = PathUtils.getShopImagePath(shop.getShopId());
        String imgAddr = ImageUtil.generateThumbnails(thumbnail, dest);
        shop.setShopImg(imgAddr);
    }

}
