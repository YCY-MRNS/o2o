package com.ycy.shopping.service;

import com.ycy.shopping.entity.HeadLine;

import java.util.List;

public interface HeadLineService {

    /**
     * 按照条件返回指定的头条列表
     */
    List<HeadLine> getHeadLineList(HeadLine headLine);

}
