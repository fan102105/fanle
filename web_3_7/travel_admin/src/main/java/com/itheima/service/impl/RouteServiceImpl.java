package com.itheima.service.impl;

import com.itheima.dao.IRouteDao;
import com.itheima.entity.PageBean;
import com.itheima.entity.Route;
import com.itheima.exception.CustomerErrorMsgException;
import com.itheima.service.IRouteService;
import com.itheima.util.DaoInstanceFactory;
import com.itheima.util.SqlSessionUtils;
import org.apache.ibatis.session.SqlSession;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class RouteServiceImpl implements IRouteService {
    private IRouteDao routeDao = DaoInstanceFactory.getBean(IRouteDao.class);

    @Override
    public PageBean<Route> findRoutesByPage(int current, String rname) {
        int pageSize = 5;
        int begin = (current - 1) * pageSize;
        List<Route> routes = routeDao.findRoutes(begin, pageSize, rname);
        int totalCounts = routeDao.findTotalCounts(rname);

        PageBean<Route> pageBean = new PageBean<>();
        pageBean.setCurrent(current);
        pageBean.setData(routes);
        pageBean.setSize(pageSize);
        pageBean.setCount(totalCounts);
        return pageBean;
    }

    @Override
    public void saveRoute(Route route) throws CustomerErrorMsgException {
        String format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        route.setRdate(format);
        route.setIsThemeTour("0");
        route.setCount(0);
        try {
            routeDao.saveRoute(route);
        } catch (Exception e) {
            throw new CustomerErrorMsgException(e.getMessage());
        }

    }

    @Override
    public Route findRouteByRid(String rid) {
        return routeDao.findRouteByRid(rid);
    }

    @Override
    public void delRoute(String[] rids) {
        routeDao.delRouteByRid(rids);
    }

    @Override
    public void updateRoute(Route route) throws CustomerErrorMsgException {
        try {
            routeDao.updateRoute(route);
        } catch (Exception e) {
            throw new CustomerErrorMsgException(e.getMessage());
        }
    }
}
