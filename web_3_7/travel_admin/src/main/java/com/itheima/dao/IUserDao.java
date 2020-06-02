package com.itheima.dao;

import org.apache.ibatis.annotations.Select;

public interface IUserDao {
    @Select("select count(1) from tab_user")
    int findUserCounts();
}
