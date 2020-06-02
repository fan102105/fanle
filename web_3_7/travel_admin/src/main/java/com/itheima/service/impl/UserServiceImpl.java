package com.itheima.service.impl;

import com.itheima.dao.IUserDao;
import com.itheima.service.IUserService;
import com.itheima.util.DaoInstanceFactory;

public class UserServiceImpl implements IUserService {
    @Override
    public int findUserCounts() {
        IUserDao userDao = DaoInstanceFactory.getBean(IUserDao.class);
        int i = userDao.findUserCounts();
        return i;
    }
}
