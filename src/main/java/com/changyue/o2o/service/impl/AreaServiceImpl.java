package com.changyue.o2o.service.impl;

import com.changyue.o2o.dao.AreaDao;
import com.changyue.o2o.entity.Area;
import com.changyue.o2o.service.AreaService;
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
