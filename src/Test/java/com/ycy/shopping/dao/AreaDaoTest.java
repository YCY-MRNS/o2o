package com.ycy.shopping.dao;

import com.ycy.shopping.BaseTest;
import com.ycy.shopping.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-06 23:25
 */
public class AreaDaoTest extends BaseTest {
    @Autowired
    private AreaDao areaDao;

    @Test
    public void testQueryAre(){
        List<Area> areas = areaDao.queryAll();
        for (Area area : areas) {
            System.out.println(area);
        }
    }

}
