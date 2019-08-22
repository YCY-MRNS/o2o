package com.ycy.shopping.dao;

import com.ycy.shopping.BaseTest;
import com.ycy.shopping.entity.HeadLine;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @program: ShoppingWithSSMAndSpringBoot
 * @description:
 * @author: ChangYue
 * @create: 2019-08-02 00:24
 */
public class HeadLineDaoTest extends BaseTest {
    @Autowired
    private HeadLineMapper headLineMapper;

    @Test
    public void testSelectAllHeadLine() {

        List<HeadLine> headLines = headLineMapper.selectAllHeadLine(new HeadLine());

        headLines.forEach(headLine -> System.out.println("headLine = " + headLine));

    }
}
