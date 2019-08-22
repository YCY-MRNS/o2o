package com.ycy.shopping.service.impl;

import com.ycy.shopping.dao.AreaDao;
import com.ycy.shopping.entity.Area;
import com.ycy.shopping.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-12 21:20
 */

@Service
public class AreaServiceImpl implements AreaService {

    @Autowired
    private AreaDao areaDao;

    @Override
    public List<Area> getAreaList() {
        return areaDao.queryAll();
    }
}
