package com.itheima.dao;

import com.itheima.entity.Seller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISellerDao {
    @Select("select * from tab_seller order by sid")
    List<Seller> findAll();
}
