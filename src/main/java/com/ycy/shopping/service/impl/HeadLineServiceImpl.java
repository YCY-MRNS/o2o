package com.ycy.shopping.service.impl;

import com.ycy.shopping.dao.HeadLineMapper;
import com.ycy.shopping.entity.HeadLine;
import com.ycy.shopping.service.HeadLineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ShoppingWithSSMAndSpringBoot
 * @description:
 * @author: ChangYue
 * @create: 2019-08-02 19:25
 */
@Service
public class HeadLineServiceImpl implements HeadLineService {

    @Autowired
    private HeadLineMapper headLineMapper;

    @Override
    public List<HeadLine> getHeadLineList(HeadLine headLine) {
        return headLineMapper.selectAllHeadLine(headLine);
    }

}
