package com.ycy.shopping.service;

import com.ycy.shopping.BaseTest;
import com.ycy.shopping.entity.Area;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: shopping
 * @description:
 * @author: ChangYue
 * @create: 2019-03-12 21:26
 */
public class AreaServiceTest extends BaseTest {

    @Autowired
    private AreaService areaService;

    @Test
    public void getAreaList() {
        List<Area> areaList = areaService.getAreaList();
        Assert.assertEquals("西苑",areaList.get(0).getAreaName());
    }
}
