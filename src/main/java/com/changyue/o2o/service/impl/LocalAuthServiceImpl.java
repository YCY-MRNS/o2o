package com.changyue.o2o.service.impl;

import com.changyue.o2o.dao.LocalAuthDao;
import com.changyue.o2o.dto.LocalAuthExecution;
import com.changyue.o2o.entity.LocalAuth;
import com.changyue.o2o.exceptions.LocalAuthOperationException;
import com.changyue.o2o.service.LocalAuthService;
import com.changyue.o2o.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @program: o2o
 * @description: 平台认证业务实现类
 * @author: YuanChangYue
 * @create: 2019-09-24 22:17
 */
public class LocalAuthServiceImpl implements LocalAuthService {

    @Autowired
    private LocalAuthDao localAuthDao;

    @Override
    public LocalAuth getLocalByUserNameAndPw(String username, String password) {
        return localAuthDao.queryLocalByUserNameAndPw(username, MD5.getMd5(password));
    }

    @Override
    public LocalAuth getLocalByUserId(long userId) {
        return localAuthDao.queryLocalByUserId(userId);
    }

    @Override
    @Transactional
    public LocalAuthExecution bindLocalAuth(LocalAuth localAuth) throws LocalAuthOperationException {
        //TODO
        return null;
    }

    @Override
    public LocalAuthExecution modifyLocalAuth(long userId, String username, String password, String newPassword, Date lastEditTime) throws LocalAuthOperationException {
        return null;
    }
}
