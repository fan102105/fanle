package com.itheima.test;

import com.itheima.dao.IRouteDao;
import com.itheima.entity.PageBean;
import com.itheima.entity.Route;
import com.itheima.entity.Seller;
import com.itheima.service.IRouteService;
import com.itheima.service.ISellerService;
import com.itheima.service.impl.RouteServiceImpl;
import com.itheima.service.impl.SellerServiceImpl;
import com.itheima.util.DaoInstanceFactory;
import org.junit.Test;

import java.util.List;

public class RouteTest {
    @Test
    public void testFindByPage() {
        IRouteService routeService = new RouteServiceImpl();
        IRouteDao routeDao = DaoInstanceFactory.getBean(IRouteDao.class);
//        int counts = routeDao.findTotalCounts("西安");
        PageBean<Route> pageBean = routeService.findRoutesByPage(1, "");
        System.out.println(pageBean);
    }

    @Test
    public void testFindAll() {
        ISellerService sellerService = new SellerServiceImpl();
        List<Seller> sellers = sellerService.findAll();
        System.out.println(sellers);
    }

    @Test
    public void saveRoute() {
        IRouteService routeService = new RouteServiceImpl();
        Route route = new Route();
        route.setRdate("1922-01-02");
        route.setCount(0);
        route.setRname("中国人民");
        route.setRouteIntroduce("sdfsdfss");

        try {
            routeService.saveRoute(route);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
