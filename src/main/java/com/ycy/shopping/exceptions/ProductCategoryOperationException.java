package com.ycy.shopping.exceptions;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-21 22:47
 */
public class ProductCategoryOperationException extends RuntimeException {
    public ProductCategoryOperationException(String msg) {
        super(msg);
    }
}
