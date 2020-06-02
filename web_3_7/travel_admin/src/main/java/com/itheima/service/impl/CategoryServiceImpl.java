package com.itheima.service.impl;

import com.itheima.dao.ICategoryDao;
import com.itheima.entity.Category;
import com.itheima.entity.Route;
import com.itheima.service.ICategoryService;
import com.itheima.util.DaoInstanceFactory;

import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
    @Override
    public List<Category> findAll() {
        ICategoryDao categoryDao = DaoInstanceFactory.getBean(ICategoryDao.class);
        List<Category> categories = categoryDao.findAll();
        return categories;
    }
}
