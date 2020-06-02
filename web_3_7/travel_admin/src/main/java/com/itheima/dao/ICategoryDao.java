package com.itheima.dao;

import com.itheima.entity.Category;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ICategoryDao {
    @Select("select * from tab_category order by cid")
    List<Category> findAll();
}
