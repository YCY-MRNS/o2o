package com.ycy.shopping.dao;

import com.ycy.shopping.entity.Area;

import java.util.List;

public interface AreaDao {
    /**
     * 返回区域列表
     * @return
     */
    List<Area> queryAll();
}
