package com.itheima.web.servlet;

import com.itheima.entity.Category;
import com.itheima.entity.PageBean;
import com.itheima.entity.Route;
import com.itheima.entity.Seller;
import com.itheima.exception.CustomerErrorMsgException;
import com.itheima.service.ICategoryService;
import com.itheima.service.IRouteService;
import com.itheima.service.ISellerService;
import com.itheima.service.impl.CategoryServiceImpl;
import com.itheima.service.impl.RouteServiceImpl;
import com.itheima.service.impl.SellerServiceImpl;
import com.itheima.util.UuidUtil;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/route/*")
@MultipartConfig
public class RouteServlet extends BaseServlet {

    private IRouteService routeService = new RouteServiceImpl();
    private ICategoryService categoryService = new CategoryServiceImpl();
    private ISellerService sellerService = new SellerServiceImpl();

    private void findRoutesByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentStr = request.getParameter("current");
        String rname = request.getParameter("rname");
        if (rname == null) {
            rname = "";
        }
        if (currentStr == null) {
            currentStr = "1";
        }
        int current = Integer.parseInt(currentStr);

        PageBean<Route> pageBean = routeService.findRoutesByPage(current, rname);
        request.setAttribute("rname", rname);
        request.setAttribute("pageBean", pageBean);
        request.getRequestDispatcher("/pages/route/route_list.jsp").forward(request, response);
    }

    protected void addRoute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<String, String[]> map = request.getParameterMap();
        String s = uploadRouteImage(request, "rimage");
        Route route = new Route();
        try {
            BeanUtils.populate(route, map);
            route.setRimage(s);
            routeService.saveRoute(route);
            response.sendRedirect(request.getContextPath() + "/route/findRoutesByPage");

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (CustomerErrorMsgException e) {
            String msg = e.getMessage();
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/pages/error/error.jsp").forward(request, response);
        }
    }

    private String uploadRouteImage(HttpServletRequest request, String rimage) throws IOException, ServletException {
        //上传文件到服务器指定目录
        Part part = request.getPart(rimage);
        //获取上传传文件名
        String fileName = part.getSubmittedFileName();

        //随机生成文件名
        String uuid = UuidUtil.getUuid();
        //得到扩展名
        String extFile = fileName.substring(fileName.lastIndexOf("."));
        //上传到服务器指定的目录地址
        String picFileName = uuid + extFile;
        String path = getServletContext().getRealPath("/img/product/small/");
        //写到服务器上
        part.write(path + picFileName);
        part.delete();
        return "img/product/small/" + picFileName;
    }

    protected void findSellerAndCategories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Seller> sellers = sellerService.findAll();
        List<Category> categories = categoryService.findAll();

        request.setAttribute("sellers", sellers);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/pages/route/route_add.jsp").forward(request, response);
    }

    protected void findRouteByRid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String rid = request.getParameter("rid");
        Route route = routeService.findRouteByRid(rid);
        List<Seller> sellers = sellerService.findAll();
        List<Category> categories = categoryService.findAll();
        request.setAttribute("route", route);
        request.setAttribute("sellers", sellers);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/pages/route/route_update.jsp").forward(request, response);
    }

    protected void delRoute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] rids = request.getParameterValues("rid");
        routeService.delRoute(rids);
        String referer = request.getHeader("referer");
        //String path = referer.substring(referer.indexOf("/"));
        response.sendRedirect( referer);
    }

    protected void updateRoute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Map<String, String[]> map = request.getParameterMap();
        Route route = new Route();
        try {
            BeanUtils.populate(route, map);
            routeService.updateRoute(route);
            response.sendRedirect(request.getContextPath() + "/route/findRoutesByPage");

        } catch (Exception e) {
            String msg = e.getMessage();
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("/pages/error/error.jsp");
        }
    }
}
