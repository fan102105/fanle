package com.itheima.service;

import com.itheima.entity.PageBean;
import com.itheima.entity.Route;
import com.itheima.exception.CustomerErrorMsgException;

public interface IRouteService {
    PageBean<Route> findRoutesByPage(int current, String rname);

    void saveRoute(Route route) throws CustomerErrorMsgException;

    Route findRouteByRid(String rid);

    void delRoute(String[] rid);

    void updateRoute(Route route) throws CustomerErrorMsgException;
}
