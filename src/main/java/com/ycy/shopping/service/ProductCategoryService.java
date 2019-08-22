package com.ycy.shopping.service;

import com.ycy.shopping.dto.ProductCategoryExecution;
import com.ycy.shopping.entity.ProductCategory;
import com.ycy.shopping.exceptions.ProductCategoryOperationException;

import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-25 22:37
 */
public interface ProductCategoryService {

    List<ProductCategory> getProductCategoryList(long shopId);

    ProductCategoryExecution batchAddProductCategory(List<ProductCategory> productCategories) throws ProductCategoryOperationException;

    ProductCategoryExecution deleteProductCategory(long productCategoryId,long shopId) throws ProductCategoryOperationException;


}
