package com.changyue.o2o.service;

import com.changyue.o2o.entity.HeadLine;

import java.util.List;

public interface HeadLineService {

    /**
     * 按照条件返回指定的头条列表
     */
    List<HeadLine> getHeadLineList(HeadLine headLine);

}
