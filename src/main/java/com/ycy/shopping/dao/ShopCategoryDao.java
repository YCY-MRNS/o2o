package com.ycy.shopping.dao;

import com.ycy.shopping.entity.ShopCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopCategoryDao {

    List<ShopCategory> queryShopCategory(@Param("shopCategoryCondition")ShopCategory shopCategory);

}
