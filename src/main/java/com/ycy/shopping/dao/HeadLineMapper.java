package com.ycy.shopping.dao;

import com.ycy.shopping.entity.HeadLine;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HeadLineMapper {
    int deleteByPrimaryKey(Integer lineId);

    int insert(HeadLine record);

    int insertSelective(HeadLine record);

    HeadLine selectByPrimaryKey(Integer lineId);

    List<HeadLine> selectAllHeadLine(@Param("headLineCondition")HeadLine headLineCondition);

    int updateByPrimaryKeySelective(HeadLine record);

    int updateByPrimaryKey(HeadLine record);
}