package com.itheima.service.impl;

import com.itheima.dao.ISellerDao;
import com.itheima.entity.Seller;
import com.itheima.service.ISellerService;
import com.itheima.util.DaoInstanceFactory;

import java.util.List;

public class SellerServiceImpl implements ISellerService {
    private ISellerDao sellerDao = DaoInstanceFactory.getBean(ISellerDao.class);

    public List<Seller> findAll() {
        List<Seller> sellers = sellerDao.findAll();
        return sellers;
    }
}
