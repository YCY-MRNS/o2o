package com.ycy.shopping.service;

import com.ycy.shopping.dto.ImageHolder;
import com.ycy.shopping.dto.ProductExecution;
import com.ycy.shopping.entity.Product;
import com.ycy.shopping.exceptions.ProductOperationException;

import java.io.IOException;
import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-04-10 16:51
 */
public interface ProductService {

    /**
     * 添加商品
     */
    ProductExecution addProduct(Product product, ImageHolder thumbnail, List<ImageHolder> productImgList) throws ProductOperationException, IOException;

    /**
     * 修改商品
     */
    ProductExecution modifyProduct(Product product, ImageHolder thumbnail, List<ImageHolder> imageHolders) throws IOException;

    /**
     * 查询商品
     */
    Product queryProductById(Long productId);

    /**
     * 查询当前传递的商铺下全部的商品
     */
    List<Product> queryProductAtAll(Long shopId);

    /**
     * 查询分页商品信息
     */
    ProductExecution getProductList(Product productCondition, Integer pageIndex, Integer pageSize);

}
